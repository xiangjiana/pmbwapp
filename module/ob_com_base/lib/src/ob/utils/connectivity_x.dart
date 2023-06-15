
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:repository/utils/net.dart';

class ConnectivityX {
  static ConnectivityX? _instance;

  static ConnectivityX get instance => _instance ??= ConnectivityX._();

  bool _isInitialized = false;

  bool _isConnected = true;

  bool get isConnected => _isConnected;

  ConnectivityX._();

  Future<void> setup() async {
    if (_isInitialized) return;

    _isInitialized = true;
    var result = await (Connectivity().checkConnectivity());
    _setConnectivityResult(result);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _setConnectivityResult(result);
    });
  }

  void _setConnectivityResult(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      // case ConnectivityResult.ethernet:
        debugPrint('网络连接正常');
        _isConnected = true;
        Net().isConnect = _isConnected;
        break;
      default:
        debugPrint('网络断开');
        _isConnected = false;
        Net().isConnect = _isConnected;
    }
  }
}
