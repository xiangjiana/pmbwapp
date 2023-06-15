import 'dart:math';

import 'package:common/common.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';

import 'repository/bind_phone_number_repository.dart';

class BindPhoneNumberController extends GetxController
    with FormValidate, KeyboardManager {
  final commonApi = Get.find<CommonApi>();
  RxString autoCodeText = "login_error_get_code".tr.obs;
  RxInt timeCount = 0.obs;
  RxInt totalTime = (59 * 1000).obs;
  RxString errorPhoneText = "".obs;
  RxString errorVerifyCodeText = "".obs;
  RxBool errorPhoneValidate = false.obs;
  RxBool errorCodeValidate = false.obs;
  RxBool isvalidate = false.obs;
  RxString areaCode = '+86'.obs; //区号 +86
  RxBool isLoadingStatus = false.obs;
  final BindPhoneNumberRepository repository;
  final AuthService authService;
  RxInt phoneMaxLength = 11.obs; //手机号允许输入的最大长度，根据国家代码动态修改

  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController verifyCodeCtrl = TextEditingController();
  late TimerUtil timerUtil = TimerUtil();
  FocusNode phoneNumberFocus = FocusNode();
  FocusNode codeFocus = FocusNode();

  BindPhoneNumberController(this.repository, this.authService);

  int isLengthVerify() {
    return areaCode.value == "+86" ? 11 : 9;
  }

  Future<void> sendCode() async {
    if (timerUtil.isActive()) return;
    if (phoneNumberCtrl.text.isEmpty || phoneNumberCtrl.text.isEmpty) {
      showToast("user_member_mobile_number_is_not_allowed_to_be_empty".tr);
      return;
    }

    try {
      var cancel = showLoading();
      await commonApi.sendCodeWithPhone(
        PhoneParam(
          phone: '$areaCode-${phoneNumberCtrl.value.text}',
        ),
      ).then((value) {
        showToast("sent_successfully".tr);
        cancel();
        timerUtil.startCountDown();
      }).catchError((code, msg) {
        cancel();
        if (code == 100019) {
          int sec = secondMsg(msg);
          if (sec > 0) {
            timerUtil.setTotalTime(sec);
            timerUtil.startCountDown();
          }
          showToast(msg);
        } else if (code == -10000) {
        } else {
          showToast(msg);
        }
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  void apply() {
    if (CoolDownManager.handler(key: 'kCoolDownApplyDeposit', duration: 1000)) {
      hideKeyboard();
      phoneNumberFocus.unfocus();
      codeFocus.unfocus();
      isLoadingStatus.value = true;
      runCatch(() async {
        await repository.postConfirmVerifyCode(
            areaCode.value + "-" + phoneNumberCtrl.text,
            verifyCodeCtrl.value.text);
        if (authService.authState is LoggedIn) {
          final logged = (authService.authState as LoggedIn);
          authService.updateAuthState(LoggedIn(
            logged.uiUser.copyWith(phone: phoneNumberCtrl.text),
          ));
        }
        isLoadingStatus.value = false;
        showToast("bind_successfully".tr);
        Get.back();
      }, onError: (e) {
        isLoadingStatus.value = false;
        showToast(e.error.message);
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    areaCode.value = LocaleUtils.areaCode;
    timerDown();
    phoneNumberCtrl.clear();
    verifyCodeCtrl.clear();
    autoCodeText.value = 'login_error_get_code'.tr;
  }

  @override
  void onClose() {
    phoneNumberCtrl.dispose();
    verifyCodeCtrl.dispose();
    timerUtil.cancel();
    phoneNumberFocus.dispose();
    codeFocus.dispose();
    super.onClose();
  }

  void changePhoneNo(String text) {
    bool phoneReg = false;

    UiCallingCode uiCallingCode = Store.callingCode
        .firstWhere((element) => element.code == areaCode.value);
    //获取输入长度最大最小范围值
    int lenLimitsMax = uiCallingCode.lenLimits.length > 1
        ? max(uiCallingCode.lenLimits[0],
            uiCallingCode.lenLimits[uiCallingCode.lenLimits.length - 1])
        : uiCallingCode.lenLimits[0];
    int lenLimitsMin = uiCallingCode.lenLimits.length > 1
        ? min(uiCallingCode.lenLimits[0],
            uiCallingCode.lenLimits[uiCallingCode.lenLimits.length - 1])
        : uiCallingCode.lenLimits[0];
    phoneMaxLength.value = lenLimitsMax;
    if (phoneNumberCtrl.value.text.length >= lenLimitsMin &&
        phoneNumberCtrl.value.text.length <= lenLimitsMax) {
      phoneReg = true;
    }

    if (!phoneReg && (phoneNumberCtrl.text.isNotEmpty)) {
      errorPhoneText.value = "plz_enter_valid_number".tr;
      errorPhoneValidate.value = false;
    } else {
      if (phoneReg) {
        errorPhoneText.value = "";
        errorPhoneValidate.value = true;
      } else if (phoneNumberCtrl.value.text.isEmpty) {
        errorPhoneText.value = "";
        errorPhoneValidate.value = false;
      }
    }

    if (errorPhoneValidate.value && errorCodeValidate.value) {
      isvalidate.value = true;
    } else {
      isvalidate.value = false;
    }
  }

  void changeVerifyCode(String text) {
    bool codeReg = RegExp(r'^\d{6}$').hasMatch(verifyCodeCtrl.value.text);
    if (!codeReg && (verifyCodeCtrl.value.text.isNotEmpty)) {
      errorVerifyCodeText.value =
          "user_incorrect_format_of_verification_code".tr;
      errorCodeValidate.value = false;
    } else {
      if (codeReg) {
        errorVerifyCodeText.value = "";
        errorCodeValidate.value = true;
      } else if (verifyCodeCtrl.value.text.isEmpty) {
        errorVerifyCodeText.value = "";
        errorCodeValidate.value = false;
      }
    }

    if (errorPhoneValidate.value && errorCodeValidate.value) {
      isvalidate.value = true;
    } else {
      isvalidate.value = false;
    }
  }

  void timerDown() {
    if (timerUtil.isActive()) {
      timerUtil.startCountDown();
    } else {
      timerUtil.setInterval(1000);
      timerUtil.setTotalTime(totalTime.value);
      timerUtil.setOnTimerTickCallback((int tick) {
        double _tick = tick / 1000;
        if (_tick.toInt() == 0) {
          autoCodeText.value = "bind_email_reacquire".tr;
          timerUtil.setTotalTime(totalTime.value);
          timerUtil.cancel();
        } else {
          autoCodeText.value = "${_tick.toInt()}" + 's';
        }
        timeCount.value = _tick.toInt();
        update();
      });
    }
  }
}
