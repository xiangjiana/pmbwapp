import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/update_password/repository/update_password_repository.dart';

import 'package:ob_com_base/ob_com_base.dart';
import 'package:sign/sign.dart';
import 'package:params/params.dart';
import 'package:sp_util/sp_util.dart';

class UpdatePasswordController extends GetxController {
  final UpdatePasswordRepository repository;
  final signApi = Get.find<SignApi>();
  RegExp regExp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$');
  final newPasswordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final oldPasswordCtrl = TextEditingController();
  final AuthService authService;
  RxString errorOldText = "".obs;
  RxString errorNewText = "".obs;
  RxString errorConfirmText = "".obs;
  RxBool oldValidate = false.obs;
  RxBool newValidate = false.obs;
  RxBool confirmValidate = false.obs;
  RxBool validate = false.obs; //按钮是否亮起

  RxBool isOldPassword = true.obs;
  RxBool isNewPassword = true.obs;
  RxBool isConfirmPassword = true.obs;

  UpdatePasswordController(this.repository, this.authService);

  @override
  void onInit() {
    super.onInit();
    newPasswordCtrl.clear();
    confirmPasswordCtrl.clear();
    oldPasswordCtrl.clear();
  }

  @override
  void onClose() {
    newPasswordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    oldPasswordCtrl.dispose();
    super.onClose();
  }

  void updatePassword() {
    if (oldPasswordCtrl.text == newPasswordCtrl.text) {
      showToast('user_cannot_be_the_same_as_the_current_password'.tr);
      return;
    }
    if (newPasswordCtrl.text != confirmPasswordCtrl.text) {
      showToast('user_the_passwords_entered_twice_are_inconsistent'.tr);
      return;
    }
    runCatch(() async {
      await signApi.updatePassword(
        EditPasswordParam(
          newPassword: Tools.generateMd5(newPasswordCtrl.text),
          password: Tools.generateMd5(oldPasswordCtrl.text),
          confirmPassword: Tools.generateMd5(confirmPasswordCtrl.text),
        ),
      );
      showToast("user_password_reset_complete".tr);
      SpUtil.putString("userPassword", '');
      SpUtil.putBool("isRenewPassword", true);
      if (newPasswordCtrl.text.length > 0) {
        String md5Pas = Tools.base64Encode(
          newPasswordCtrl.text,
        );
        SpUtil.putString("gesture_user_password", md5Pas);
      }
      Get.back();
    });
  }

  void changeOldTextPassword(String text) {
    oldValidate.value = oldPasswordCtrl.value.text.length > 0;
    if (oldPasswordCtrl.value.text.length < 8) {
      errorOldText.value = "user_please_enter_original_password".tr;
    } else {
      errorOldText.value = '';
    }

    if ((oldValidate.value) &&
        (newPasswordCtrl.value.text.length > 7 && newValidate.value) &&
        (confirmPasswordCtrl.value.text.length > 7 && confirmValidate.value)) {
      validate.value = true;
    } else {
      validate.value = false;
    }
  }

  void changeNewTextPassword(String text) {
    bool newPassword = regExp.hasMatch(newPasswordCtrl.value.text);
    newValidate.value = newPassword;
    if (!newPassword && newPasswordCtrl.value.text.length > 0) {
      errorNewText.value = "user_enter_a_password_of812_digits".tr;
    } else if (newPasswordCtrl.value.text != confirmPasswordCtrl.value.text &&
        confirmPasswordCtrl.value.text.length > 0) {
      errorNewText.value = 'user_passwords_entered_twice_are_inconsistent'.tr;
      errorConfirmText.value = '';
    } else {
      errorNewText.value = '';
      if (newPasswordCtrl.value.text.length > 0) errorConfirmText.value = '';
    }

    if (oldValidate.value &&
        (newPasswordCtrl.value.text.length > 7 &&
            newValidate.value &&
            errorNewText.value.isEmpty) &&
        (confirmPasswordCtrl.value.text.length > 7 &&
            confirmValidate.value &&
            errorConfirmText.value.isEmpty)) {
      validate.value = true;
    } else {
      validate.value = false;
    }
  }

  void changeConfirmTextPassword(String text) {
    bool confirmPassword = regExp.hasMatch(confirmPasswordCtrl.value.text);
    confirmValidate.value = confirmPassword;
    if (!confirmPassword && confirmPasswordCtrl.value.text.length > 0) {
      errorConfirmText.value = 'user_enter_a_password_of812_digits'.tr;
    } else if (newPasswordCtrl.value.text != confirmPasswordCtrl.value.text &&
        newPasswordCtrl.value.text.length > 0) {
      errorConfirmText.value =
          'user_passwords_entered_twice_are_inconsistent'.tr;
      errorNewText.value = '';
    } else {
      errorConfirmText.value = '';
      if (newPasswordCtrl.value.text.length > 0) errorNewText.value = '';
    }

    if (oldValidate.value &&
        (newPasswordCtrl.value.text.length > 7 &&
            newValidate.value &&
            errorNewText.value.isEmpty) &&
        (confirmPasswordCtrl.value.text.length > 7 &&
            confirmValidate.value &&
            errorConfirmText.value.isEmpty)) {
      validate.value = true;
    } else {
      validate.value = false;
    }
  }

  //密码显示开关
  void oldChangePassword() {
    isOldPassword.value = !isOldPassword.value;
  }

  void newChangePassword() {
    isNewPassword.value = !isNewPassword.value;
  }

  void confirmChangePassword() {
    isConfirmPassword.value = !isConfirmPassword.value;
  }
}
