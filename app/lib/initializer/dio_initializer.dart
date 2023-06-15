import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exception/exception.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_interceptor/flutter_interceptor.dart';
import 'package:ob_package/net/error_toast_interceptor.dart';
import 'package:ob_package/net/net_status_check_interceptor.dart';
import 'package:repository/utils/net.dart';
import 'package:get/get.dart';
import 'package:interceptor/interceptor.dart';
import 'package:encrypt_interceptor/encrypt_interceptor.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/initializer/network_initializer.dart';
import 'package:repository/utils/device_type.dart';
import 'package:ob_package/flavor/properties.dart'
    hide AES_KEY, CRYPTO_SWITCH, API_TYPE;
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:sp_util/sp_util.dart';

class DioInitializer implements AppInitializer {
  @override
  FutureOr<void> init() async {
    for (final element in UrlEndpoint.values) {
      final dio = Get.find<Dio>(tag: '${element.name}_url');
      dio.interceptors.addAll([
        NetStatusCheckInterceptor(),
        EncryptInterceptor(
          aesKey: Flavor.I.getString(AES_KEY)!,
          aesVersion: Flavor.I.getString(AES_VERSION)!,
          openEncrypt: Flavor.I.getBool(CRYPTO_SWITCH)!,
          kIsWeb: kIsWeb,
        ),
        AppConfigInterceptor(),
        TokenInterceptor(),
      ]);
      dio.interceptors.addAll([
        EnvelopeInterceptor(
          Flavor.I.getBool(CRYPTO_SWITCH)!,
        ),
        ErrorHandleInterceptor(),
        ErrorToastInterceptor(),
      ]);
      // TODO 切换地址 后续处理
      // if (!Flavor.I.isDevelopment) {
      //   final domainHandler = DomainSwitchHandler(
      //       baseUrl: dio.options.baseUrl,
      //       urlEndpoint: element,
      //       buildInDomains:
      //           Flavor.I.getObject('${element.name}_buildIn') as List<String>);
      //   await domainHandler.init();
      //   dio.interceptors.addAll([
      //     RetryInterceptor(domainHandler),
      //     EnvelopeInterceptor(
      //       Flavor.I.getBool(CRYPTO_SWITCH)!,
      //     ),
      //     ErrorHandleInterceptor()
      //   ]);
      // } else {
      //   dio.interceptors.addAll([
      //     EnvelopeInterceptor(
      //       Flavor.I.getBool(CRYPTO_SWITCH)!,
      //     ),
      //     ErrorHandleInterceptor()
      //   ]);
      // }
    }
  }
}

class AppConfigInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['merchant-id'] =
        AppCurrencyUtils.getAppCurrencyMerchantId();
    options.headers['ob-client'] = InstallDeviceType.deviceType;
    options.headers['Content-Type'] = 'application/json';
    options.headers['ob-application'] = GetPlatform.isWeb ? 67 : 66;
    options.headers['User-Agent'] = NetworkInitializer.userAgentContent;
    options.headers['lang'] =
        SpUtil.getString("LanguageCode", defValue: "zh_CN");
    options.headers['currency'] =
        SpUtil.getString(Constants.appCurrency, defValue: "CNY");
    handler.next(options);
  }
}

class ErrorHandleInterceptor extends Interceptor {
  dynamic _ip403Arg;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    dismissAll();
    if (err.error is ServerException) {
      final exception = err.error as ServerException;
      switch (exception.code) {
        case 4004:
          //退出登录Token失效
          dismissAll();
          // TODO 切换用户 需要查验
          // if (Get.currentRoute.contains(AppRoutes.USER_TOGGLE)) {
          //   handler.next(resp);
          //   return;
          // }
          if (Store.isLogin.value) {
            showToast(exception.message);
          }
          break;
        case 20000:
        case 20001: //抢登录
        case 20002: //账号禁用 拦截跳登录页
          dismissAll();
          // TODO 切换用户 需要查验
          // if (Get.currentRoute.contains(AppRoutes.USER_TOGGLE) &&
          //     exception.code == 20000) {
          //   handler.next(resp);
          //   return;
          // }
          _optionalToast(exception.message);
          NetworkInitializer.rollBackOperation();
          break;
        case 20004:
          // 代理登录锁定
          dismissAll();
          showToast(exception.message);
          if (Get.currentRoute.contains('/agent')) {
            Get.until((route) => !Get.currentRoute.contains('agent'));
          }
          Net().removeHeader('x-request-proxy');
          break;
        case 300037:
          dismissAll();
          showToast(exception.message);
          if (Get.currentRoute.contains(AppRoutes.Avatar_Clip)) {
            Get.back();
          }
          break;
        case 4013:
          _go403();
          break;
        default:
          handler.next(err);
      }
    } else {
      super.onError(err, handler);
    }
  }

  void _optionalToast(String message) {
    if (Store.isLogin.value) {
      showToast(message);
    }
  }

  void _go403() {
    Store.needUpdateKeyBoardBottom = false;
    if (Store.isIpLimited) return;
    Store.isIpLimited = true;
    if (Store.nativeRouting.isNotEmpty) {
      NativeUtils.backUntilNativeEvent();
    }
    Get.toNamed(AppRoutes.limitIpPage, arguments: _ip403Arg);
  }
}
