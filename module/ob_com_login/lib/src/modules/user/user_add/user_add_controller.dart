import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_login/src/login_pages.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_mixin.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/repository/toggle_mixin.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/repository/ui_toggle_item_user.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/user_toggle_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sign/sign.dart';
import 'package:params/params.dart';
import 'package:repository/utils/device_type.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sp_util/sp_util.dart';
import 'package:ob_com_login/src/login_x.dart';

class UserAddController extends GetxController with LoginMixin, ToggleMixin {
  final AuthService authService;
  final signApi = Get.find<SignApi>();

  UserAddController(this.authService);

  final TextEditingController usernameController = TextEditingController(); //账号
  final TextEditingController passwordController = TextEditingController(); //密码

  RegExp usnRegExp = RegExp(r'^(?=.*\d)[a-zA-Z].{3,10}$');
  RegExp psdRegExp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$');

  RxString usernameErrorText = "".obs;
  RxString passwordErrorText = "".obs;
  RxBool buttonIsOk = false.obs;
  RxBool isUsernameEnableClean = false.obs;
  RxBool isPasswordEnableClean = false.obs;
  RxBool isBlind = false.obs;

  bool isUsernameVerify = false;
  bool isPasswordVerify = false;
  String argumentsUserName = '';
  String argumentsPassword = '';

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      argumentsUserName = Get.arguments["user"];
      argumentsPassword = Get.arguments["password"];
      usernameController.text = argumentsUserName;
      //passwordController.text = argumentsPassword.length > 0 ? Tools.base64Decode(argumentsPassword) : "";
      isUsernameVerify = argumentsUserName.length > 0 ? true : false;
      onUsernameChanged('');
      onPasswordChanged('');
      isUsernameEnableClean.value = false;
    }
    refreshAccount();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void refreshAccount() {
    initSpAccount();
    final user = (authService.authState as LoggedIn).uiUser;
    updateAccountStatus(user.userName);
  }

  void toggleBlind() {
    isBlind.value = !isBlind.value;
  }

  void cleanUsername() {
    usernameController.clear();
    usernameErrorText.value = "";
    buttonIsOk.value = false;
    isUsernameEnableClean.value = false;
  }

  void cleanPassword() {
    passwordController.clear();
    if (usernameController.text.length == 0) {
      usernameErrorText.value = "";
    }
    passwordErrorText.value = "";
    buttonIsOk.value = false;
    isPasswordEnableClean.value = false;
  }

  void onUsernameChanged(String txt) {
    //用户名清空显示
    if (usernameController.text.length == 0) {
      usernameErrorText.value = "";
      isUsernameEnableClean.value = false;
      return;
    } else {
      isUsernameEnableClean.value = true;
    }

    bool userNameLength = usernameController.text.length > 0;
    bool username = usnRegExp.hasMatch(usernameController.text);

    if (!username && (usernameController.text.length > 0)) {
      usernameErrorText.value = "user_toggle_login_username_error".tr;
      isUsernameVerify = false;
    } else {
      if (!userNameLength) {
        usernameErrorText.value = "user_toggle_login_username_error".tr;
        isUsernameVerify = false;
      } else if (username) {
        usernameErrorText.value = "";
        isUsernameVerify = true;
      }
    }
    _verify();
  }

  void onPasswordChanged(String txt) {
    //密码清空显示
    if (passwordController.text.length == 0) {
      passwordErrorText.value = "";
      isPasswordEnableClean.value = false;
      return;
    } else {
      isPasswordEnableClean.value = true;
    }

    bool userNameLength = usernameController.text.length > 0;
    bool passWordLength = passwordController.text.length > 0;
    bool password = psdRegExp.hasMatch(passwordController.text);

    if (!password && (passwordController.text.length > 0)) {
      usernameErrorText.value = '';
      passwordErrorText.value = "user_toggle_login_password_error".tr;
      isPasswordVerify = false;
    } else {
      if (!passWordLength) {
        usernameErrorText.value = '';
        passwordErrorText.value = "user_toggle_login_password_error".tr;
        isPasswordVerify = false;
      } else if (password &&
          !userNameLength &&
          argumentsUserName.isNullOrEmpty) {
        usernameErrorText.value = "user_toggle_login_username_error".tr;
        passwordErrorText.value = "";
        isPasswordVerify = false;
      } else if (password) {
        passwordErrorText.value = "";
        isPasswordVerify = true;
      }
    }
    _verify();
  }

  void _verify() {
    bool userNameLength = usernameController.text.length > 0;
    bool passWordLength = passwordController.text.length > 0;
    if (userNameLength &&
        passWordLength &&
        isUsernameVerify &&
        isPasswordVerify) {
      usernameErrorText.value = "";
      passwordErrorText.value = "";
      buttonIsOk.value = true;
    } else {
      buttonIsOk.value = false;
    }
  }

  void sendLogin() {
    if (buttonIsOk.value) {
      if (CoolDownManager.handler(key: 'kCoolDownLogin', duration: 1000)) {
        if (argumentsUserName.isNotNullOrEmpty) {
          userToggleLogic(authService);
          _postLogin();
        } else {
          _addUserAccount();
        }
      }
    }
  }

  void goResetPasswordPage() async {
    String passWord = await Get.toNamed(
      AppRoutes.RESET_PASSWORD,
      arguments: usernameController.text,
    );
    if (passWord.isNotEmpty) {
      passwordController.text = passWord;
      sendLogin();
    }
  }

  ///登录请求
  Future<void> _postLogin() async {
    try {
      showLoading();

      final LoginResp res = await signApi.login(
        LoginParam(
          userName: usernameController.text,
          loginReference: '',
          deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
          userPwd: passwordController.text,
        ),
      );
      onSignInSuccess(res.memberInfo.userName, res.memberInfo, res.token,
          isFromToggle: true, onComplete: (userInfo) {
        SpUtil.putString("userName", usernameController.text.toLowerCase());
        SpUtil.putString(
            "userPassword",
            Tools.base64Encode(passwordController
                .text)); //Tools.encryptAes(Tools.base64Encode(passwordController.text))
        updateAccountStatus(
          usernameController.text,
          password: passwordController.text,
          token: res.token,
          userAvatarUrl: res.memberInfo.topImagesUrl,
        );

        /// if (Get.isRegistered<MineController>()) {
        ///   Get.find<MineController>().refreshInfo();
        /// }
        LoginX.instance.loginCallback?.MineController_refreshInfo();
        if (Get.isRegistered<UserToggleController>()) {
          Get.find<UserToggleController>().refreshAccount();
        }

        ///HomeGameManager.instance.startRefreshTimer();
        LoginX.instance.loginCallback?.HomeGameManager_startRefreshTimer();

        ///HomeWidgetAutoRefreshManager.instance.startRefreshTimer();
        LoginX.instance.loginCallback
            ?.HomeWidgetAutoRefreshManager_startRefreshTimer();

        Get.back();
        Get.back();
        gotoMinePage();
      });
    } on Map catch (e) {
      dismissLoading();
      if (e['code'] == 42110) {
        Map<String, String> paras = {
          "phoneNum": e['message'],
          'userName': usernameController.text,
        };
        Get.toNamed(AppRoutes.LOGIN_ERROE, arguments: paras);
      } else if (e['code'] == 333333) {
        goResetPasswordPage();
      } else {
        warnDialog(e['message']);
      }
    }
  }

  ///添加帐号请求
  Future<void> _addUserAccount() async {
    int isUserExist = userLists.indexWhere((e) =>
        e.username.toLowerCase() == usernameController.text.toLowerCase());
    userLists.forEach((e) {
      e.isCurrentLogin = false;
    });

    if (isUserExist != -1) {
      UIToggleItemUser userExists = userLists[isUserExist];
      if (userExists.isCurrentLogin) {
        showToast("user_toggle_tip_login_txt_2".tr);
        return;
      }
    }

    if (isUserExist == -1 && userLists.length < 6) {
      try {
        showLoading();
        final LoginResp res = await signApi.login(
          LoginParam(
            userName: usernameController.text,
            loginReference: '',
            deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
            userPwd: passwordController.text,
          ),
        );
        dismissLoading();
        bool isExist = checkSpAccount(
          res.memberInfo.id,
          usernameController.text,
          passwordController.text,
          res.token,
          userAvatarUrl: res.memberInfo.topImagesUrl,
          isRemember: false,
        );
        if (isExist) {
          showToast("user_toggle_tip_login_txt_3".tr);
        } else {
          showToast("user_toggle_tip_login_txt_4".tr);
        }
        if (Get.isRegistered<UserToggleController>()) {
          Get.find<UserToggleController>().refreshAccount();
        }
        Get.close(1);
      } on Map catch (e) {
        dismissLoading();
        if (e['code'] == 333333) {
          goResetPasswordPage();
        } else {
          warnDialog(e['message']);
        }
      }
    } else {
      warnDialog("user_toggle_tip_login_txt_4".tr);
    }
  }

  void warnDialog(String tipMsg) {
    OBDialogUtil.show(
      ObaseDialog.alert(
        title: 'alert'.tr,
        content: tipMsg,
        confirmText: 'confirm'.tr,
        cancelText: 'login_help'.tr,
        onConfirmListener: () {
          Get.back();
        },
        onCancelListener: () {
          if (Store.clientId == Store.clientIdFYB) {
            PublicResources.jumpToAgentServicePage();
          } else {
            PublicResources.jumpToMemberServicePage();
          }
        },
      ),
    );
  }
}
