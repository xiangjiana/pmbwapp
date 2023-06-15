import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:repository/backport/domain_factory.dart';
import 'package:repository/backport/header_utils.dart';
import 'package:repository/backport/http_interceptor.dart';
import 'package:repository/domain_pool/provider/domains_provider.dart';
import 'package:repository/utils/sqlite_service.dart';
import 'package:sp_util/sp_util.dart';

import 'crypt_utils_http.dart';

typedef Success = void Function(Response data);
typedef Fail = Function(int code, String msg);

class Net {
  static final Net _net = Net._();

  factory Net() => _net;

  Map<String, int> cacheUriMap = {};

  bool get openCrypto => _openCrypto;
  bool _openCrypto = false;

  bool openCache = false;
  String _aesKey = '';
  String _aesKeyVersion = '';
  bool isConnect = true;
  String domain_pool_path = '';

  CryptUtilsHttp? _crypto;

  String _domain = '';

  String get domain => _domain;

  set domainSet(String val) {
    _domain = val;
  }

  String _apiType = '';

  String get apiType => _apiType;

  set apiTypeSet(String val) {
    _apiType = val;
  }

  Net._() {
    _dio = Dio();
    _retryDio = Dio();
    _dio.options = BaseOptions(
        connectTimeout: Duration(milliseconds: 8000),
        receiveTimeout: Duration(milliseconds: 8000),
        sendTimeout: Duration(milliseconds: 8000),
        responseType: ResponseType.json,
        headers: {
          'ob-application': 1,
          'Content-Type': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36'
        });
    _retryDio.options = BaseOptions(
        connectTimeout: Duration(milliseconds: 8000),
        receiveTimeout: Duration(milliseconds: 8000),
        sendTimeout: Duration(milliseconds: 8000),
        responseType: ResponseType.json,
        headers: {
          'ob-application': 1,
          'Content-Type': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36'
        });

    if (SpUtil.getBool('setProxy', defValue: false) ?? false) {
      //设置代理
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.findProxy = (uri) {
          return "PROXY ${SpUtil.getString("proxyIp", defValue: "")}:${SpUtil.getString("proxyPort", defValue: "")}";
        };
      };
      ;
      (retryDio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.findProxy = (uri) {
          return "PROXY ${SpUtil.getString("proxyIp", defValue: "")}:${SpUtil.getString("proxyPort", defValue: "")}";
        };
      };
      ;
    }

    if (!GetPlatform.isWeb) {
      _dio.interceptors.add(ErrorInterceptor());
    }

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions req, RequestInterceptorHandler handler) async {
        ///开启缓存并且不是web环境
        if (openCache && !kIsWeb) {
          ///判断网络是否正常
          if (!isConnect) {
            var reqData = req.data;

            ///缓存数据
            Map<String, dynamic>? cache;
            var header = Headers();
            if (reqData is Map) {
              reqData = jsonDecode(jsonEncode(req.data));
            }
            cache = await NetCache.selectCache(formatUri(req.path.toString(), reqData));

            ///网络状态不正常，并且未开启缓存和列表则直接返回响应失败
            if (openCache && cache != null && cacheUriMap[req.path.toString()] != null) {
              ///返回缓存数据
              handler.resolve(Response(
                headers: header,
                statusCode: 203,
                statusMessage: '缓存数据',
                requestOptions: req,
                data: jsonDecode(cache['soure']),
              ));
            } else {
              handler.resolve(Response(
                headers: header,
                statusCode: 504,
                statusMessage: 'network_unusual_plz_try_again_later2'.tr,
                requestOptions: req,
                data: {
                  'code': 504,
                  'msg': 'network_unusual_plz_try_again_later2'.tr,
                },
              ));
            }
          } else {
            reqHandlerNextEvent(req, handler);
          }
        } else if (!isConnect) {
          //web端也要无网络的提示，因此加这个判断
          handler.resolve(Response(
            headers: Headers(),
            statusCode: 504,
            statusMessage: 'network_unusual_plz_try_again_later2'.tr,
            requestOptions: req,
            data: {
              'code': 504,
              'msg': 'network_unusual_plz_try_again_later2'.tr,
            },
          ));
        } else {
          reqHandlerNextEvent(req, handler);
        }
      },
      onResponse: (Response resp, ResponseInterceptorHandler handler) async {
        ///接收解析后的response
        var responseData;

        ///加密或不加密对象
        var requestOptionsData;

        ///返回空 | 未开启加密 | 返回类型非字串 的不解密
        if (resp.data != null && _openCrypto && resp.data is String) {
          responseData = CryptUtilsHttp.deCrypt(resp.data);
          resp.data = responseData;
        }

        if (_openCrypto == true && resp.requestOptions.data is String && resp.requestOptions.data != '') {
          ///更新缓存需要使用未加密的请求参数查询缓存数据库
          requestOptionsData = CryptUtilsHttp.deCrypt(resp.requestOptions.data);
        } else {
          if (resp.requestOptions.data == '') {
            requestOptionsData = {};
          } else {
            requestOptionsData = resp.requestOptions.data;
          }
        }
        if (openCache && !kIsWeb) {
          if (cacheUriMap[resp.requestOptions.path.toString()] != null && resp.data != null) {
            if (resp.data.runtimeType.toString() == 'String') {
              debugPrint('返回拦截器类型${resp.data.runtimeType}---返回数据${resp.data}');
              resp.data = jsonDecode(resp.data);
            }
            //判断请求是否成功,并且判断业务是否合格
            switch (resp.statusCode) {
              case 200:
                if (resp.data != null && resp.data['code'] != null) {
                  if (resp.data['code'] == 200) {
                    //更新缓存往下放行
                    var str = formatUri(resp.requestOptions.path.toString(), requestOptionsData);
                    if (resp.data['data'].length > 0) {
                      NetCache.inserAndUpdateData(
                        str,
                        jsonEncode(resp.data),
                        cacheUriMap[resp.requestOptions.path.toString()]!,
                      );
                    }
                    handler.next(resp); //往下放行
                  } else {
                    handler.next(resp);
                  }
                } else {
                  handler.next(resp); //往下放行
                }
                break;
              case 403:
                //替换域名 剔除原有域名 判断还有域名数量 少于 3 个请求接口 再补充域名管理类 写入到sp
                // DomainService.toSetSld(resp.requestOptions.path.toString());
                handler.resolve(Response(
                  headers: resp.headers,
                  statusCode: 403,
                  statusMessage: '服务异常，请重新再试',
                  requestOptions: resp.requestOptions,
                  data: {'code': 403, 'msg': 'service_unusual_plz_try_again_later'.tr},
                ));
                break;
              default:
                //返回缓存
                var str = formatUri(resp.requestOptions.path.toString(), requestOptionsData);
                Map<String, dynamic>? cache;
                cache = await NetCache.selectCache(str);
                if (cache == null || cache['soure'] == null) {
                  handler.next(resp);
                } else {
                  var header = Headers();
                  header.add('exp', cache['cache_time'].toString());
                  handler.resolve(Response(
                    headers: header,
                    statusCode: 203,
                    statusMessage: '骨架缓存数据',
                    requestOptions: resp.requestOptions,
                    data: jsonDecode(cache['soure']),
                  ));
                }
            }
          } else {
            handler.next(resp);
          }
        } else {
          handler.next(resp);
        }
      },
      onError: (DioError e, ErrorInterceptorHandler handler) async {
        if (openCache && !kIsWeb) {
          debugPrint(cacheUriMap[e.requestOptions.path.toString()].toString());
          if (cacheUriMap[e.requestOptions.path.toString()] != null) {
            Map<String, dynamic>? cache;
            cache = await NetCache.selectCache(formatUri(
              e.requestOptions.path.toString(),
              e.requestOptions.data,
            ));
            if (cache == null || cache['soure'] == null) {
              //判断拿到的缓存是没有数据的--往下继续执行报错
              handler.next(e);
            } else {
              debugPrint('获取到缓存:${cache['soure'].toString()}');
              var header = Headers();
              header.add('exp', cache['cache_time'].toString());
              handler.resolve(Response(
                headers: header,
                statusCode: 203,
                statusMessage: '骨架缓存数据',
                requestOptions: e.requestOptions,
                data: jsonDecode(cache['soure']),
              ));
            }
          } else {
            handler.next(e);
          }
        } else {
          handler.next(e);
        }
      },
    ));
  }

  late Dio _dio;

  Dio get dio => _dio;

  late Dio _retryDio;

  Dio get retryDio => _retryDio;

  set setDio(Interceptors element) {
    _dio.interceptors.addAll(element);
  }

  set setOpenDioCache(bool open) {
    openCache = open;
  }

  set setHeader(Map<String, dynamic> header) {
    _dio.options.headers.addAll(header);
  }

  set setUrl(String url) {
    _dio.options.baseUrl = url;
  }

  set setOptions(BaseOptions options) {
    options.headers = _dio.options.headers;
    _dio.options = options;
  }

  set cacheList(Map<String, int> mp) {
    cacheUriMap = mp;
  }

  set crypto(CryptUtilsHttp value) {
    _crypto = value;
  }

  ///是否开启加密，默认不开启
  set setOpenCrypto(bool status) {
    _openCrypto = status;
    cryptoHeadersHandler(status);
  }

  ///清除header
  void removeHeader(String header) {
    _dio.options.headers.remove(header);
  }

  ///加密配置
  ///-------------------------
  ///aesKey：密钥
  ///aesKeyVersion： 密钥版本
  ///isOpen： 是否开启加密
  void setCryptoConfigs({required String aesKey, required String aesKeyVersion, required bool isOpen}) {
    _aesKey = aesKey;
    _aesKeyVersion = aesKeyVersion;
    _crypto = CryptUtilsHttp(key: _aesKey, iv: _aesKey);
    setOpenCrypto = isOpen;
  }

  ///配置加密请求头部
  void cryptoHeadersHandler(bool isOpen) {
    debugPrint('加密版本：【$_aesKeyVersion】；密钥：【$_aesKey】；开启状态【$isOpen】');
    _net.setHeader = {
      'ob-encrypted': isOpen,
      'ob-secret-version': _aesKeyVersion,
    };
  }

  ///发送请求调度函数
  void reqHandlerNextEvent(RequestOptions options, RequestInterceptorHandler handler) async {
    ///未开启加密或者加密未初始化则不做加密
    if (_openCrypto == true && _crypto != null && !(options.data is FormData)) {
      var result = CryptUtilsHttp.toCrypt(options.data);
      options.responseType = ResponseType.plain;
      options.headers['ob-nonce'] = result.nonce;
      options.headers['ob-timestamp'] = result.timestamp;
      options.headers['ob-sign'] = result.sign;
      options.data = result.base64param.toString();
    } else {
      options.headers['ob-nonce'] = _randomBit(18);
      options.headers['ob-timestamp'] = DateTime.now().millisecondsSinceEpoch.toString();
    }

    if (!GetPlatform.isWeb) {
      ///分服务请求逻辑
      var domain = DomainFactory.getDomain(options.uri);
      options
        ..baseUrl = DomainFactory.asBaseUrl(domain.item3)
        ..headers[HeaderUtils.domainType] = domain.item1
        ..headers[HeaderUtils.domainTag] = domain.item2
        ..headers[HeaderUtils.domain] = domain.item3;
    }
    handler.next(options);
  }

  static String _randomBit(int len) {
    var scopeF = '123456789'; //首位
    var scopeC = '0123456789'; //中间
    var result = '';
    for (var i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    return result;
  }

  void post(
    String uri, {
    Options? options,
    Map<String, dynamic>? params,
    Map<String, dynamic>? info,
    Success? success,
    Fail? fail,
  }) async {
    Response response;
    try {
      response = await _dio.post(DomainFactory.postUriDopedWithServer(uri), data: params);
      Map<String, dynamic> res = jsonDecode(response.toString());
      final int code = res['code'];
      switch (code) {
        case 200:
          try {
            if (success != null) success(response);
          } catch (e) {
            if (fail != null) {
              if (isConnect) {
                fail(403, 'service_unavaliable_plz_try_again_later'.tr);
              } else {
                fail(403, 'network_unavaliable_plz_try_again_later'.tr);
              }
            }
          }
          break;
        case 301:
          if (fail != null) {
            if (isConnect) {
              fail(403, 'service_unavaliable_plz_try_again_later'.tr);
            } else {
              fail(403, 'network_unavaliable_plz_try_again_later'.tr);
            }
          }
          break;
        case 302:
          if (fail != null) {
            if (isConnect) {
              fail(403, 'service_unavaliable_plz_try_again_later'.tr);
            } else {
              fail(403, 'network_unavaliable_plz_try_again_later'.tr);
            }
          }
          break;
        default:
          if (fail != null) fail(res['code'], res['msg']);
          break;
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
          if (fail != null) {
            if (isConnect) {
              if (HeaderUtils.getIsNoDomain(e.requestOptions) == true) {
                fail(999, 'service_unavaliable_plz_try_again_later'.tr);
              } else {
                fail(403, 'service_unavaliable_plz_try_again_later'.tr);
              }
            } else {
              fail(403, 'network_unavaliable_plz_try_again_later'.tr);
            }
          }
          break;
        case DioErrorType.badResponse:
          if (fail != null) {
            fail(e.response!.statusCode!, e.response!.statusMessage!);
          }
          break;
        case DioErrorType.unknown:
          if (fail != null) {
            if (isConnect) {
              if (HeaderUtils.getIsNoDomain(e.requestOptions) == true) {
                fail(999, 'service_unavaliable_plz_try_again_later'.tr);
              } else {
                fail(403, 'service_unavaliable_plz_try_again_later'.tr);
              }
            } else {
              fail(504, 'network_unavaliable_plz_try_again_later2'.tr);
            }
            break;
          }
          break;
        case DioErrorType.cancel:
          if (fail != null) {
            if (isConnect) {
              fail(403, 'service_unavaliable_plz_try_again_later2'.tr);
            } else {
              fail(403, 'network_unavaliable_plz_try_again_later'.tr);
            }
          }
          break;
        default:
          if (fail != null) {
            if (isConnect) {
              fail(-10000, 'service_unavaliable_plz_try_again_later'.tr);
            } else {
              fail(-10000, 'network_unavaliable_plz_try_again_later'.tr);
            }
          }
          break;
      }
    } catch (e) {
      if (fail != null) {
        //不是网络异常的所有错误
        if (isConnect) {
          fail(-50000, 'service_unavaliable_plz_try_again_later'.tr);
        } else {
          fail(-50000, 'network_unavaliable_plz_try_again_later'.tr);
        }
      }
    }
  }

  Future<Response> postNew(
    String uri, {
    Options? options,
    Map<String, dynamic>? params,
    Map<String, dynamic>? info,
  }) async {
    final completer = Completer<Response>();
    Response response;
    response = await _dio.post(uri, data: params, options: options);
    Map<String, dynamic> res = jsonDecode(response.toString());
    completer.complete(response);
    return completer.future;
  }
}

String formatUri(String uri, dynamic params) {
  var add = '';
  if (params is Map) {
    if (params['pageSize'] != null && params['pageNum'] != null) {
      var pageSting = '?pageSize=' + params['pageSize'].toString() + '&pageNum=' + params['pageNum'].toString();
      params.remove('pageSize');
      params.remove('pageNum');
      add = uri + params.toString() + pageSting;
    } else {
      add = uri + params.toString();
    }
  } else {
    add = uri;
  }
  return add;
}

class DomainReturnProvider implements DomainsProvider {
  final List<String> domainList;

  DomainReturnProvider(this.domainList);

  @override
  Future<List<String>> queryDomains() async {
    return domainList;
  }
}
