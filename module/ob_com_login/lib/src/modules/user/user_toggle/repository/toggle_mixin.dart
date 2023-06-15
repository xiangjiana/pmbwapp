import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/main.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sp_util/sp_util.dart';

mixin ToggleMixin on GetxController {
  void logout(
    AuthService authService, {
    VoidCallback? onComplete,
  }) {
    Store.isLogin.value = false;
    SpUtil.putString("token", '');

    runCatch(
      () async {
        MainApi mainApi = Get.find<MainApi>();
        await mainApi.logout();
        authService.updateAuthState(LoggedOut());
        onComplete?.call();
      },
      onError: (_) {
        authService.updateAuthState(LoggedOut());
        onComplete?.call();
      },
    );
  }

  ///用户切换需要处理的业务
  void userToggleLogic(AuthService authService) {
    Store.isLogin.value = false;
    authService.updateAuthState(LoggedOut());
    Store.init();
    Constants.init();
  }
}
