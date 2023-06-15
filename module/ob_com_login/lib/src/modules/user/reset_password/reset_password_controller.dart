import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_mixin.dart';
import 'package:ob_com_login/src/modules/user/login/repository/reset_info.dart';
import 'package:sign/sign.dart';
import 'package:params/params.dart';

import 'repository/reset_repository.dart';

class ResetPasswordController extends GetxController
    with KeyboardManager, LoginMixin {
  final signApi = Get.find<SignApi>();
  RxBool newPasswordEyeOn = false.obs;
  RxBool confirmPasswordEyeOn = false.obs;
  RxBool cleanPassword = false.obs;
  RxBool isPasswordEnableClean = false.obs;
  RxBool cleanConfirmPassword = false.obs;
  RxBool isConfirmPasswordEnableClean = false.obs;
  RxBool submitOk = false.obs;
  RxBool passWordRemindVisiable = false.obs;

  var passwordRegExp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$');

  final inputPassWordController = TextEditingController();
  @protected
  final inputConfirmPassWordController = TextEditingController();
  final focusNodePassword = FocusNode();
  final focusNodeConfirmPassword = FocusNode();
  RxString errorText = "".obs;
  ResetInfo resetInfo = ResetInfo("", "");

  @override
  void onReady() {
    resetInfo = Get.arguments;
    focusNodePassword.addListener(() {
      changePasswordEnableClean();
    });
    focusNodeConfirmPassword.addListener(() {
      changeRptPasswordEnableClean();
    });
  }

  void changePasswordEnableClean() {
    if (inputPassWordController.text.isNotEmpty && focusNodePassword.hasFocus) {
      isPasswordEnableClean.value = true;
    } else {
      isPasswordEnableClean.value = false;
    }
  }

  void changeRptPasswordEnableClean() {
    if (inputConfirmPassWordController.text.isNotEmpty &&
        focusNodeConfirmPassword.hasFocus) {
      isConfirmPasswordEnableClean.value = true;
    } else {
      isConfirmPasswordEnableClean.value = false;
    }
  }

  void changePassword() {
    newPasswordEyeOn.value = !newPasswordEyeOn.value;
  }

  void changeRegPassword() {
    confirmPasswordEyeOn.value = !confirmPasswordEyeOn.value;
  }

  checkPasswordIsSame() {
    bool passwordExp = passwordRegExp.hasMatch(inputPassWordController.text);
    bool passWordConfirmExp =
        passwordRegExp.hasMatch(inputConfirmPassWordController.text);
    if (!passwordExp && inputPassWordController.text.isNotEmpty) {
      errorText.value =
          "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
      passWordRemindVisiable.value = true;
    } else if (!passWordConfirmExp &&
        inputConfirmPassWordController.text.isNotEmpty) {
      errorText.value =
          "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
      passWordRemindVisiable.value = true;
    } else if (inputPassWordController.text.isNotEmpty &&
        inputConfirmPassWordController.text.isNotEmpty) {
      //检查两次密码是否一致
      passWordRemindVisiable.value =
          inputPassWordController.text != inputConfirmPassWordController.text;
      if (passWordRemindVisiable.value) {
        errorText.value =
            "the_passwords_entered_twice_are_inconsistent_please_check_and_enter"
                .tr;
      } else {
        errorText.value = "";
      }
    } else {
      errorText.value = "";
      passWordRemindVisiable.value = true;
    }
  }

  inputPassWord(String passWord) {
    checkPasswordIsSame();
    checkSubmit();
  }

  inputConfirmPassword(String confirmPassWord) {
    checkPasswordIsSame();
    checkSubmit();
  }

  checkSubmit() {
    changePasswordEnableClean();
    changeRptPasswordEnableClean();
    if (inputPassWordController.text.isEmpty ||
        inputConfirmPassWordController.text.isEmpty) {
      submitOk.value = false;
    } else {
      if (!passWordRemindVisiable.value) {
        submitOk.value = true;
      } else {
        submitOk.value = false;
      }
    }
  }

  void onCleanPassword() {
    inputPassWordController.clear();
    errorText.value = "";
    isPasswordEnableClean.value = false;
  }

  void onCleanConfirmPassword() {
    inputConfirmPassWordController.clear();
    errorText.value = "";
    isConfirmPasswordEnableClean.value = false;
  }

  void onSubmitted() {
    showLoading();
    runCatch(() async {
      if (resetInfo.rawPassword.isNotEmpty && resetInfo.username.isNotEmpty) {
        await signApi.setNew(
          SetNewPasswordParam(
            oldPassword: Tools.generateMd5(resetInfo.rawPassword),
            newPassword: Tools.generateMd5(inputPassWordController.text),
            userName: resetInfo.username,
          ),
        );
        dismissLoading();
        setGestureWarn();
      }
    }, onError: (e) {
      errorText.value = e;
      dismissLoading();
    });
  }

  void setGestureWarn() {
    var gesturePassword = CacheUtil.get('gesture_password');
    if (gesturePassword.isNotEmpty) {
      CacheUtil.remove('gesture_password');
    }
    Get.back(result: inputPassWordController.text);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    inputPassWordController.dispose();
    inputConfirmPassWordController.dispose();
  }
}
