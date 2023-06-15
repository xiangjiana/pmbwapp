import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_login/src/login_pages.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_mixin.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sp_util/sp_util.dart';

import 'repository/toggle_mixin.dart';
import 'repository/toggle_user_repository.dart';
import 'repository/ui_toggle_item_user.dart';

class UserToggleController extends GetxController with ToggleMixin, LoginMixin, SingleGetTickerProviderMixin {
  final AuthService authService;
  final repository = Get.find<UserToggleRepository>();

  UserToggleController(this.authService);

  late AnimationController animaController;
  late RxBool isEditor = false.obs;

  bool isAvatarHttpUrl(String url) {
    return Uri.tryParse(url)?.scheme == 'https';
  }

  void changeEditor() {
    isEditor.value = !isEditor.value;
    if (!isEditor.value) {
      if (animaController.isCompleted) {
        animaController.reverse();
      } else if (animaController.isDismissed) {
        animaController.forward();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    animaController = AnimationController(
      vsync: this,
      upperBound: 0.8,
      duration: const Duration(milliseconds: 60),
    );
    refreshAccount();
  }

  @override
  void onClose() {
    isEditor.value = false;
    animaController.dispose();
    super.onClose();
  }

  ///更新帐号
  Future<void> refreshAccount() async {
    initSpAccount();
    final user = (authService.authState as LoggedIn).uiUser;
    updateAccountStatus(user.userName);
  }

  ///移除操作
  void removeUser(int index) {
    UIToggleItemUser itemUser = userLists[index];
    if (itemUser.isCurrentLogin) {
      OBDialogUtil.show(
        ObaseDialog.alert(
          title: 'alert'.tr,
          content: 'user_toggle_remove_tip'.tr,
          confirmText: 'user_toggle_confirm_remove_label'.tr,
          cancelText: 'cancel'.tr,
          onConfirmListener: () {
            logout(authService, onComplete: () {
              removeSpUser(index);
              if (userLists.isNotEmpty) {
                SpUtil.putString("userName", userLists[0].username.toLowerCase());
                SpUtil.putString("userPassword", userLists[0].password);
              }
              Get.back();
              Get.offAllNamed(AppRoutes.LOGIN);
            });
          },
          onCancelListener: () {
            Get.back();
          },
        ),
      );
      return;
    }
    removeSpUser(index);
  }

  ///切换操作
  void toggleUser(int index) {
    if (isEditor.value) {
      return;
    }

    if (CoolDownManager.handler(key: 'kCoolDownLogin', duration: 1000)) {
      UIToggleItemUser itemUser = userLists[index];
      if (itemUser.isCurrentLogin) {
        showToast("user_toggle_tip_login_txt_1".tr);
        return;
      }
      if (itemUser.username.isNotEmpty && itemUser.token.isNotEmpty) {
        _toggleUseToken(itemUser);
      } else {
        warnDialog(itemUser, 'user_toggle_account_tip'.tr);
      }
    }
  }

  ///切换 登录之Token操作
  void _toggleUseToken(UIToggleItemUser itemUser) async {
    _onPausePatrolRequest();
    String beforeToken = SpUtil.getString("token") ?? '';
    try {
      showLoading();
      SpUtil.putString("token", itemUser.token);
      final resp = await repository.getUserInfo();
      userToggleLogic(authService);
      onSignInSuccess(resp.userName, resp, itemUser.token, isFromToggle: true, onComplete: (userInfo) {
        SpUtil.putString("userName", itemUser.username.toLowerCase());
        SpUtil.putString("userPassword", itemUser.password);
        _onRestorePatrolRequest();
        gotoMinePage();
        Get.back();
      });
    } on Map catch (e) {
      SpUtil.putString("token", beforeToken);
      _onRestorePatrolRequest();
      dismissLoading();
      if (e['code'] == 20000 || e['code'] == 4004) {
        _saveToggleUserInfo(itemUser.username);
        warnDialog(
          itemUser,
          'user_toggle_account_tip'.tr,
        );
      } else {
        onSignInFail(e['code'], e['message'], itemUser.username, itemUser.password);
      }
    }
  }

  ///更新用户信息
  void _saveToggleUserInfo(String username) {
    int isUserExist = userLists.indexWhere((e) => e.username == username);
    userLists[isUserExist].token = '';
    String userInfo = json.encode(userLists);
    CacheUtil.saveAll('user_toggle', userInfo);
  }

  ///暂停请求
  void _onPausePatrolRequest() {
    ///HomeGameManager.instance.cancelRefreshTimer();
    ///HomeWidgetAutoRefreshManager.instance.cancelRefreshTimer();
    LoginX.instance.loginCallback?.onPausePatrolRequest();
  }

  ///恢复请求
  void _onRestorePatrolRequest() {
    /// if (Get.isRegistered<MineController>()) {
    ///   Get.find<MineController>().refreshInfo();
    /// }
    /// HomeGameManager.instance.startRefreshTimer();
    /// HomeWidgetAutoRefreshManager.instance.startRefreshTimer();
    LoginX.instance.loginCallback?.onRestorePatrolRequest();
  }

  void warnDialog(UIToggleItemUser itemUser, String msg) {
    OBDialogUtil.show(
      ObaseDialog.alert(
        title: 'alert'.tr,
        content: msg,
        confirmText: 'confirm'.tr,
        onConfirmListener: () {
          Get.back();
          Get.toNamed(
            AppRoutes.USER_ADD,
            arguments: {
              "user": itemUser.username,
              "password": itemUser.isRemember ? itemUser.password : '',
            },
          );
        },
      ),
    );
  }
}
