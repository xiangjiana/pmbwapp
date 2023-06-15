// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class BaseX {
  static const String pkg = 'ob_com_png';
  static const String png = 'png';
  static const String pkg2 = 'ob_com_base';

  ///模块回调
  BaseCallback? baseCallback;
  ToastCallback? toastCallback;

  static BaseX? _instance;

  static BaseX get instance => _instance ??= BaseX._();

  BaseX._();
}

abstract class BaseCallback {
  void Constants_init();

  void Store_init();

  void HomePageController_jumpToPage0();

  //打开游戏H5页面
  void WebUtil_openGameInApp(
    String url, {
    required String gameId,
    String title = "",
    String gameCode = "",
    String gameType = "",
    bool testify = false,
  });

}

abstract class ToastCallback {
  void dismissAll();

  void dismissLoading();

  CancelFunc showToast(String msg);

  CancelFunc showSuccess(String msg);

  CancelFunc showError(String msg);

  CancelFunc showLoading({String? msg});
}
