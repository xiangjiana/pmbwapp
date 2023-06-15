import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

// 设备类型单例
class InstallConnectivityTools {
  static late InstallConnectivityTools _instance;
  static late Stream<ConnectivityResult> connectListenStream;

  static set isConnect(bool value) {
    isConnect = value;
  }

  static _internal() async {
    connectListenStream = createConnectListen();
    // isConnect = await _getConnectivityInfo();
  }

  static install() async {
    _instance = await _internal();
    return _instance;
  }

  //生成网络设备信息
  static Future<bool> getConnectivityInfo() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.ethernet:
      case ConnectivityResult.wifi:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.mobile:
        print('网络连接正常');
        return true;
      case ConnectivityResult.none:
        print('网络断开');
        // case ConnectivityResult.ethernet:
        return false;
      default:
        return false;
    }
  }

  InstallConnectivityTools(); //注册网络监听
  static Stream<ConnectivityResult> createConnectListen() {
    return Connectivity().onConnectivityChanged;
  }

  //初始化网络连接对象
  static Future<ConnectivityResult> checkConnectivity() {
    return Connectivity().checkConnectivity();
  }
}
