
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:repository/utils/net.dart';
import 'dart:html' if (dart.library.io) 'html_stub.dart' as html;

class ConnectivityX {
  static ConnectivityX? _instance;

  static ConnectivityX get instance => _instance ??= ConnectivityX._();

  bool _isInitialized = false;

  bool _isConnected = true;
  //web端通过navigator.onLine检测有无网络连接
  bool get isConnected => kIsWeb ? html.window.navigator.onLine! : _isConnected;

  static late StreamController streamController;

  ConnectivityX._();

  Future<void> setup() async {
    if (_isInitialized) return;
    _isInitialized = true;
    streamController = StreamController<bool>();
    if (kIsWeb) {
      html.window.addEventListener("online", (event) {
        streamController.add(true);
        Net().isConnect = true;
      });
      html.window.addEventListener("offline", (event) {
        streamController.add(false);
        Net().isConnect = false;
      });
      return;
    }
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
        streamController.add(true);
        debugPrint('网络连接正常');
        _isConnected = true;
        Net().isConnect = _isConnected;
        break;
      default:
        debugPrint('网络断开');
        streamController.add(false);
        _isConnected = false;
        Net().isConnect = _isConnected;
    }
  }
}
