import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:get/get.dart' hide Response;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:ob_package/modules/home/components/controller/home_widget_auto_refresh_manager.dart';
import 'package:ob_package/modules/home/home_controller.dart';
import 'package:ob_package/modules/home/home_page.dart';
import 'package:ob_package/modules/home_modules/home_float/float_controller.dart';
import 'package:ob_package/routes/app_pages.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:repository/backport/domain_factory.dart';
import 'package:repository/utils/device_type.dart';
import 'package:repository/utils/domainService.dart';
import 'package:repository/utils/net.dart';
import 'package:repository/utils/sqlite_service.dart';
import 'package:sp_util/sp_util.dart';

class NetworkInitializer extends AppInitializer {
  static String _userAgent = '';
  static bool ip403 = false;
  static dynamic _ip403Arg;

  static void go403() {
    Store.needUpdateKeyBoardBottom = false;
    if (Store.isIpLimited) return;
    Store.isIpLimited = true;
    if (Store.nativeRouting.isNotEmpty) {
      NativeUtils.backUntilNativeEvent();
    }
    Get.toNamed(AppRoutes.limitIpPage, arguments: _ip403Arg);
  }

  @override
  FutureOr<void> init() async {
    DomainService.isBw = true;
    if (Flavor.I.getString(MERCHANT_CODE) == 'X1BET') {
      DomainService.appId = DomainService.bwX1AppId;
    }

    HttpOverrides.global = HttpCertificate();
    WidgetsFlutterBinding.ensureInitialized();
    await InstallDeviceType.install();
    //ConnectivityX.instance.setup();

    if (!GetPlatform.isWeb) await initUserAgentState();
    Net().setHeader = {
      'merchant-id': AppCurrencyUtils.getAppCurrencyMerchantId(),
      'ob-client': InstallDeviceType.deviceType,
      'Content-Type': 'application/json',
      'ob-application': GetPlatform.isWeb ? 67 : 66,
      'User-Agent': '$_userAgent',
      'lang': SpUtil.getString("LanguageCode",
          defValue: AppMerchantUtils.currencyLang()),
      'currency': SpUtil.getString(Constants.appCurrency,
          defValue: Store.merchantCurrency)!,
    };

    if (kIsWeb && !kDebugMode) {
      Net().setUrl = '/api';
    } else {
      Net().setUrl = Flavor.I.getString(API_URL)!;
    }

    Net().setCryptoConfigs(
        aesKey: Flavor.I.getString(AES_KEY)!,
        aesKeyVersion: Flavor.I.getString(AES_VERSION)!,
        isOpen: Flavor.I.getBool(CRYPTO_SWITCH)!);
    Net().setDio = Interceptors()
      ..add(InterceptorsWrapper(onRequest: (options, handler) {
        options.headers['X-Request-Token'] = SpUtil.getString("token");
        return handler.next(options); //continue
      }));

    if (kDebugMode && !GetPlatform.isWeb) {
      Net().setDio = Interceptors()
        ..add(PrettyDioLogger(
            request: Constants.requestInfoPrint,
            requestHeader: Constants.requestHeaderPrint,
            requestBody: Constants.requestBodyPrint,
            responseBody: Constants.responseBodyPrint,
            responseHeader: Constants.responseHeaderPrint,
            error: Constants.requestErrorPrint,
            compact: Constants.responseInfoPrint,
            maxWidth: 90));

      Net().retryDio.interceptors.add(PrettyDioLogger(
          request: Constants.requestInfoPrint,
          requestHeader: Constants.requestHeaderPrint,
          requestBody: Constants.requestBodyPrint,
          responseBody: Constants.responseBodyPrint,
          responseHeader: Constants.responseHeaderPrint,
          error: Constants.requestErrorPrint,
          compact: Constants.responseInfoPrint,
          maxWidth: 90));
    }
    Net().setDio = Interceptors()
      ..add(
        InterceptorsWrapper(
          onResponse: (Response resp, ResponseInterceptorHandler handler) {
            if (ip403) {
              handler.next(resp);
              return;
            }

            Map<String, dynamic> res = jsonDecode(resp.toString());
            final int code = res['code'];

            switch (code) {
              case 200:
                handler.next(resp);
                break;
              case 4004:
                //退出登录Token失效
                dismissAll();
                if (Get.currentRoute.contains(AppRoutes.USER_TOGGLE)) {
                  handler.next(resp);
                  return;
                }
                if (Store.isLogin.value) {
                  showToast("${res['msg']}");
                }
                break;
              case 20000:
              case 20001: //抢登录
              case 20002: //账号禁用 拦截跳登录页
                dismissAll();
                if (Get.currentRoute.contains(AppRoutes.USER_TOGGLE) &&
                    code == 20000) {
                  handler.next(resp);
                  return;
                }
                if (Store.isLogin.value) {
                  showToast("${res['msg']}");
                }
                rollBackOperation();
                break;
              case 20004:
                // 代理登录锁定
                dismissAll();
                showToast("${res['msg']}");
                if (Get.currentRoute.contains('/agent')) {
                  Get.until((route) => !Get.currentRoute.contains('agent'));
                }
                Net().removeHeader('x-request-proxy');
                break;
              case 300037:
                dismissAll();
                showToast("${res['msg']}");
                if (Get.currentRoute.contains(AppRoutes.Avatar_Clip)) {
                  Get.back();
                }
                break;
              case 4013:
                ip403 = true;
                _ip403Arg = res['data'];
                go403();
                break;
              default:
                handler.next(resp);
            }
          },
          onError: (DioError e, ErrorInterceptorHandler handler) {
            if (ip403) {
              handler.next(e);
              return;
            }

            dismissAll();
            if (null != e.response) {
              if (e.response!.statusCode == 503) {
                try {
                  Map json = e.response!.data;
                  if (json['code'] == 4091) {
                    showToast("${json['msg']}");
                    if (isSystemMaintenance()) {
                      return;
                    }
                    rollBackOperation();
                  }
                } catch (err) {
                  print("${err.toString()}");
                  DioError nerr = e;
                  nerr.response?.statusCode = 999;
                  nerr.response?.statusMessage =
                      "service_unavaliable_plz_try_again_later".tr;
                  handler.next(nerr);
                }
              } else if (e.response!.statusCode != 500) {
                showToast("${e.response!.data['msg']}");
              }
            } else {
              Store.isSystemMaintenance = false;
              handler.next(e);
            }
          },
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            if (GetPlatform.isWeb) options.headers.remove('user-agent');
            handler.next(options);
          },
        ),
      );
    Net().cacheList = CacheList.list; //增加缓存
    /// dev 版本不做域名切换
    DomainService.setApiType = Flavor.I.getString(API_TYPE)!;
    var clientServer = Flavor.I.getString(CLIENT_SERVER);
    if (clientServer != null) DomainFactory.clientServerUri = clientServer;

    var clientGateway = Flavor.I.getString(CLIENT_GATEWAY);
    if (clientGateway != null) DomainFactory.clientGatewayUri = clientGateway;

    if (!kIsWeb) {
      ///预埋域名
      await DomainService.initDomain();

      NetCache.sqliteConnection().then((open) async {
        if (null != open && open) {
          bool tableIsNotEmpty = await NetCache.tableisEmpty();
          if (tableIsNotEmpty) {
            NetCache.selectTableAll();
          } else {
            NetCache.createTable();
          }
        }
      });

      DomainService.getNewDomainList();
      DomainNameApis.heartbeat();
    }
    if (SpUtil.getString("token") != null &&
        SpUtil.getString("token")!.isNotEmpty) {
      String userJson = CacheUtil.getAll('user_toggle');
      List jsons = json.decode(userJson);
      List<UIToggleItemUser> synchronousUser =
          jsons.map((e) => UIToggleItemUser.fromJson(e)).toList();
      if (synchronousUser
          .where((element) => element.isCurrentLogin == true)
          .isNotEmpty) {
        UIToggleItemUser toggleItemUser = synchronousUser
            .where((element) => element.isCurrentLogin == true)
            .toList()[0];
        Get.find<AuthService>().updateAuthState(LoggedIn(UiUser(
          toggleItemUser.id,
          toggleItemUser.username,
          false,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          '',
          '',
          null,
          false,
        )));
        Store.isLogin.value = true;
      }
    }
  }

  //忘记密码不跳转登录
  bool isSystemMaintenance() {
    return Get.currentRoute.contains(AppRoutes.FIND_PASSWORD);
  }

  //抢登录,重新登录，维护操作
  static void rollBackOperation() {
    Store.needUpdateKeyBoardBottom = false;

    if (Store.nativeRouting.isNotEmpty) {
      NativeUtils.backUntilNativeEvent();
    }

    final homePageController = Get.findOrNull<HomePageController>();
    if (homePageController != null) {
      if((homePageController.drawerKey.currentState as ScaffoldState).isDrawerOpen){
        (homePageController.drawerKey.currentState as ScaffoldState).closeDrawer();
      }
      if(Get.currentRoute != AppRoutes.HOME && Get.currentRoute != AppRoutes.LOGIN){
        Get.until((route) => route.settings.name == AppRoutes.HOME);
      }
      if(Store.currentRootPageIndex != 0){
        try {
          Store.currentRootPageIndex = 0;
          homePageController.currentIndex.value = 0;
          homePageController.pageCtrl.jumpToPage(0);
          eventBus.fire(HomeTabChange(0));
        } catch (e) {
          print(e);
        }
      }
    }
    if (Get.currentRoute != AppRoutes.ONBOARDING && Get.currentRoute != AppRoutes.SPLASH) {
      if (Get.currentRoute != AppRoutes.LOGIN) {
        Get.toNamed(AppRoutes.LOGIN);
      }
    }
    Get.find<AuthService>().authState = LoggedOut();
    SpUtil.remove("token");
    Store.isLogin.value = false;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initUserAgentState() async {
    String userAgent, webViewUserAgent;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      userAgent = await FkUserAgent.getPropertyAsync('userAgent');
      await FkUserAgent.init();
      webViewUserAgent = FkUserAgent.webViewUserAgent ?? '';
      print('''
applicationVersion => ${FkUserAgent.getProperty('applicationVersion')}
systemName         => ${FkUserAgent.getProperty('systemName')}
userAgent          => $userAgent
webViewUserAgent   => $webViewUserAgent
packageUserAgent   => ${FkUserAgent.getProperty('packageUserAgent')}
      ''');
    } on PlatformException {
      userAgent = webViewUserAgent = '<error>';
    }

    _userAgent = webViewUserAgent;
  }

  static set userAgent(Map map) {
    //配置鸿蒙系统头部信息
    String name = map["name"];
    String version = map["version"];
    if (name.isNotEmpty && version.isNotEmpty) {
      _userAgent = _userAgent + "-&&-" + "{name:${name},version:${version}}";
      Net().setHeader = {
        'User-Agent': '$_userAgent'
        //'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36'
      };
    }
  }

  static get userAgentContent => _userAgent;
}
