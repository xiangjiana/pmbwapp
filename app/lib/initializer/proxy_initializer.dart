import 'dart:async';
import 'dart:io';

import 'package:dio/io.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:repository/utils/net.dart';
import 'package:sp_util/sp_util.dart';

class ProxyInitializer extends AppInitializer {
  @override
  FutureOr<void> init() {
    // (Net().dio.httpClientAdapter as DefaultHttpClientAdapter)
    //     .onHttpClientCreate = (client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 172.20.10.9:8888";
    //   };
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    // };
    if (SpUtil.getBool("setProxy", defValue: false) ?? false) {
      (Net().dio.httpClientAdapter as DefaultHttpClientAdapter)
          .onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return "PROXY ${SpUtil.getString("proxyIp", defValue: "127.0.0.1")}:${SpUtil.getString("proxyPort", defValue: "8888")}";
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }
}
