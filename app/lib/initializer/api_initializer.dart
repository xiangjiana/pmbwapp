import 'dart:async';
import 'dart:io';

import 'package:bank/bank.dart';
import 'package:common/common.dart';
import 'package:activity/activity.dart';
import 'package:capital/capital.dart';
import 'package:config/config.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:game/game.dart';
import 'package:get/get.dart';
import 'package:interceptor/interceptor.dart';
import 'package:main/main.dart';
import 'package:message/message.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/flavor/properties.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:record/record.dart';
import 'package:setting/setting.dart';
import 'package:sign/sign.dart';
import 'package:user/user.dart';
import 'package:vip/vip.dart';
import 'package:wallet/wallet.dart';
import 'package:game/game.dart';

class ApiInitializer implements AppInitializer {
  @override
  FutureOr<void> init() {
    final baseUrl = (kIsWeb && !kDebugMode)
        ? '/api/bw-client-server'
        : Flavor.I.getString(API_URL)! + Flavor.I.getString(CLIENT_SERVER)!;
    final launchDio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 8000),
      sendTimeout: const Duration(milliseconds: 8000),
      receiveTimeout: const Duration(milliseconds: 8000),
    ));
    final memberDio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 8000),
      sendTimeout: const Duration(milliseconds: 8000),
      receiveTimeout: const Duration(milliseconds: 8000),
    ));
    final cgwDio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 8000),
      sendTimeout: const Duration(milliseconds: 8000),
      receiveTimeout: const Duration(milliseconds: 8000),
    ));

    // (memberDio.httpClientAdapter as DefaultHttpClientAdapter)
    //     .onHttpClientCreate = (client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 192.168.1.10:8888";
    //   };
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    // };
    if (kDebugMode && !GetPlatform.isWeb) {
      memberDio.interceptors.add(PrettyDioLogger(
          request: Constants.requestInfoPrint,
          requestHeader: Constants.requestHeaderPrint,
          requestBody: Constants.requestBodyPrint,
          responseBody: Constants.responseBodyPrint,
          responseHeader: Constants.responseHeaderPrint,
          error: Constants.requestErrorPrint,
          compact: Constants.responseInfoPrint,
          maxWidth: 90));
    }
    final signApi = SignApi(memberDio);
    final configApi = ConfigApi(memberDio);
    final bankApi = BankApi(memberDio);
    final commonApi = CommonApi(memberDio);
    final settingApi = SettingApi(memberDio);
    final mainApi = MainApi(memberDio);
    final recordApi = RecordApi(memberDio);
    final messageApi = MessageApi(memberDio);
    final vipApi = VipApi(memberDio);
    final activityApi = ActivityApi(memberDio);
    final capitalApi = CapitalApi(memberDio);
    final userApi = UserApi(memberDio);
    final walletApi = WalletApi(memberDio);
    final gameApi = GameApi(memberDio);
    
    Get
      ..put(launchDio, tag: LAUNCH_URL)
      ..put(memberDio, tag: MEMBER_URL)
      ..put(cgwDio, tag: CGW_URL)
      ..put(signApi)
      ..put(configApi)
      ..put(bankApi)
      ..put(commonApi)
      ..put(settingApi)
      ..put(mainApi)
      ..put(recordApi)
      ..put(messageApi)
      ..put(activityApi)
      ..put(capitalApi)
      ..put(userApi)
      ..put(walletApi)
      ..put(vipApi)
      ..put(gameApi);
  }
}
