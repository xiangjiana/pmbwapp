import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:repository/backport/domain_factory.dart';
import 'package:repository/backport/header_utils.dart';
import 'package:repository/backport/list_utils.dart';
import 'package:repository/backport/ping_bai_du.dart';
import 'package:repository/utils/domainService.dart';
import 'package:repository/utils/net.dart';

const bool isDioRetryParallel = true;

///拦截器基类
abstract class _MyBaseInterceptor {
  bool ignoreOnRequest(RequestOptions options) {
    return false;
  }

  bool ignoreOnResponse(RequestOptions options) {
    return false;
  }

  bool ignoreOnError(RequestOptions options) {
    return false;
  }
}

///错误处理
class ErrorInterceptor extends QueuedInterceptorsWrapper with _MyBaseInterceptor {
  @override
  Future<void> onError(err, handler) async {
    if (ignoreOnError(err.requestOptions)) {
      handler.next(err);
      return;
    }
    if (err.type == DioErrorType.unknown) {
      if (err.error is SocketException) {
        await _retry2(err, handler);
        return;
      }
    }
    if (err.type == DioErrorType.unknown) {
      if (err.error is HttpException) {
        await _retry(err, handler);
        return;
      }

      ///200返回一个页面，解析错误
      if (err.error is FormatException) {
        await _retry(err, handler);
        return;
      }
    }
    if (err.type == DioErrorType.connectionTimeout) {
      await _retry(err, handler);
      return;
    }

    if (err.type == DioErrorType.badResponse) {
      var code = err.response?.statusCode ?? 0;
      if (code >= 500 && code != 503) {
        await _retry(err, handler);
        return;
      }
    }

    handler.next(err);
  }

  ///重试请求接口
  Future<void> _retry(DioError err, ErrorInterceptorHandler handler) async {
    DomainFactory.dead.add(HeaderUtils.getDomain(err.requestOptions));
    var domains = DomainService.domainFactory.getBak(
      HeaderUtils.getDomainType(err.requestOptions),
    );

    if (isDioRetryParallel && !_forceQueuedRetry(err)) {
      ///分组并发
      var listList = ListUtils.split(domains, 3);
      for (var sList in listList) {
        try {
          var response = await _parallelRetry(sList, err);
          if (response.statusCode == 200) {
            DomainFactory.setDomain(
              HeaderUtils.getDomainType(response.requestOptions),
              HeaderUtils.getDomain(response.requestOptions),
            );

            ///域名数量过少，更新域名
            if (domains.length <= 5) {
              DomainService.getNewDomainList();
            }
            handler.resolve(response);
            return;
          }
        } catch (e) {
          if (e is DioError) {
            DomainFactory.dead.add(e.requestOptions.headers[HeaderUtils.domain]);
          }
          continue;
        }
      }
    } else {
      for (var o in domains) {
        try {
          var response = await Net().retryDio.fetch(_retryRequestOptions(err, o));
          if (response.statusCode == 200) {
            DomainFactory.setDomain(
              HeaderUtils.getDomainType(response.requestOptions),
              HeaderUtils.getDomain(response.requestOptions),
            );

            ///域名数量过少，更新域名
            if (domains.length <= 5) {
              DomainService.getNewDomainList();
            }
            handler.resolve(response);
            return;
          }
        } catch (e) {
          if (e is DioError) {
            DomainFactory.dead.add(e.requestOptions.headers[HeaderUtils.domain]);
          }
          continue;
        }
      }
    }

    err.requestOptions.headers[HeaderUtils.isNoDomain] = true;
    handler.next(err);
  }

  ///先检测网络是否畅通，再重试请求接口
  Future<void> _retry2(DioError err, ErrorInterceptorHandler handler) async {
    var vBool = await PingBaiDu.get();
    if (vBool) {
      await _retry(err, handler);
    } else {
      handler.next(err);
    }
  }

  ///构建重试请求头
  RequestOptions _retryRequestOptions(DioError err, String domain) {
    return err.requestOptions.copyWith()
      ..baseUrl = DomainFactory.asBaseUrl(domain)
      ..headers[HeaderUtils.isRetry] = true
      ..headers[HeaderUtils.domain] = domain;
  }

  ///普通并发模式
  Future<Response<dynamic>> _parallelRetry(List<String> domains, DioError err) async {
    var errorCount = 0;
    var completer = Completer<Response<dynamic>>();
    if (domains.isEmpty) {
      completer.completeError(err);
      return completer.future;
    }

    if (domains.isNotEmpty) {
      unawaited(Net().retryDio.fetch(_retryRequestOptions(err, domains[0])).then((result) {
        if (!completer.isCompleted) {
          completer.complete(result);
        }
      }).onError((error, stackTrace) {
        errorCount++;
        if (error is DioError) {
          DomainFactory.dead.add(error.requestOptions.headers[HeaderUtils.domain]);
        }
        if (!completer.isCompleted && errorCount >= domains.length) {
          completer.completeError(err);
        }
      }));
    }
    if (domains.length >= 2) {
      unawaited(Net().retryDio.fetch(_retryRequestOptions(err, domains[1])).then((result) {
        if (!completer.isCompleted) {
          completer.complete(result);
        }
      }).onError((error, stackTrace) {
        errorCount++;
        if (error is DioError) {
          DomainFactory.dead.add(error.requestOptions.headers[HeaderUtils.domain]);
        }
        if (!completer.isCompleted && errorCount >= domains.length) {
          completer.completeError(err);
        }
      }));
    }
    if (domains.length >= 3) {
      unawaited(Net().retryDio.fetch(_retryRequestOptions(err, domains[2])).then((result) {
        if (!completer.isCompleted) {
          completer.complete(result);
        }
      }).onError((error, stackTrace) {
        errorCount++;
        if (error is DioError) {
          DomainFactory.dead.add(error.requestOptions.headers[HeaderUtils.domain]);
        }
        if (!completer.isCompleted && errorCount >= domains.length) {
          completer.completeError(err);
        }
      }));
    }
    return completer.future;
  }

  bool _forceQueuedRetry(DioError err) {
    if (err.requestOptions.uri.toString().contains('config/domainNameConfigQueryList') ||
        err.requestOptions.uri.toString().contains('client-gateway/login')) {
      return true;
    }
    return false;
  }
}
