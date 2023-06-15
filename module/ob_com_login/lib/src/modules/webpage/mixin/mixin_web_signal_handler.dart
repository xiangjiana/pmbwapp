import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:webview_flutter/webview_flutter.dart';

mixin WebSignalHandler on GetxController {
  final AuthService authService = Get.find<AuthService>();

  NavigationDecision navigationDelegates(NavigationRequest navigation) {
    String url = navigation.url;
    if (url.contains(WebUtil.scheme)) {
      try {
        jumpToPage(url);
      } catch (error) {
        print(error);
      }
      return NavigationDecision.prevent;
    } else {
      if (url.toLowerCase().contains('app://')) {
        return NavigationDecision.prevent;
      }
    }
    return NavigationDecision.navigate;
  }

  @mustCallSuper
  void jumpToPage(String page) {
    if (page == WebUtil.bindPhone) {
      Get.toNamed(AppRoutes.BIND_PHONE_NUMBER);
    } else if (page == WebUtil.accountBank) {
      navigateAddBankAccount("${AppRoutes.ACCOUNT}${AppRoutes.BANK}", "bank_card".tr);
    } else if (page == WebUtil.login) {
      //跳转到登录页面
      dismissAll();

      ///NetworkInitializer.rollBackOperation();
      LoginX.instance.loginCallback?.rollBackOperation();
    } else if (page == WebUtil.customService) {
      PublicResources.jumpToMemberServicePage();
    } else if (page == WebUtil.deposit) {
      //Get.toNamed(AppRoutes.DEPOSIT); //存款
      GoUtils.goDeposit();
    } else if (page == WebUtil.callBack) {
      Get.back(); //返回
    }
  }

  void navigateAddBankAccount(String route, String type) {
    if (authService.isTryPlay) {
      OBDialogUtil.show(
        ObaseDialog.alert(
          title: 'alert'.tr,
          content: 'account_trial_account_does_not_support_binding'.tr + '$type',
          cancelText: 'user_profile_understood'.tr,
          onCancelListener: () {
            Get.back();
          },
        ),
      );
      return;
    }
    authService.syncUser();
    if ((authService.authState as LoggedIn).uiUser.phone!.isEmpty) {
      OBDialogUtil.show(
        ObaseDialog.alert(
          title: 'alert'.tr,
          content: 'account_currently_have_phone_number_bound'.tr,
          confirmText: 'continue'.tr,
          onConfirmListener: () {
            Get.back();
            Get.toNamed(AppRoutes.BIND_PHONE_NUMBER);
          },
        ),
      );
      return;
    }
    Get.toNamed(route);
  }
}
