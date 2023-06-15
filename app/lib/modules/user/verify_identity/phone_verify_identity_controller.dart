import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/user/verify_identity/repository/verify_identity_repository.dart';
import 'package:sp_util/sp_util.dart';

class PhoneVerifyIdentityController extends GetxController
    with FormValidate, KeyboardManager {
  final VerifyIdentityRepository repository;
  final AuthService authService;
  final codeCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final TimerUtil timerUtil = TimerUtil();
  RxString areaCode = '+86'.obs; //区号 +86
  var buttonIsOk = false.obs; //按钮是否亮起
  RxString errorVerifyCodeText = "".obs;
  RxString autoCodeText = "login_error_get_code".tr.obs;
  int mTimeCount = 0;
  int totalTime = 59 * 1000;

  PhoneVerifyIdentityController(this.repository, this.authService);

  @override
  void onInit() {
    super.onInit();
    hideKeyboard();
    initTimer();
    if (authService.authState is LoggedIn) {
      final user = (authService.authState as LoggedIn).uiUser;
      final phone = user.phone ?? "";
      var phoneNo = phone.split('-');
      if (phoneNo.length >= 2) {
        areaCode.value = phoneNo[0];
        phoneCtrl.text =
            phoneNo[1].length > 0 ? phoneNo[1].replaceRange(3, 7, '****') : "";
      } else {
        phoneCtrl.text =
            phone.length > 0 ? phone.replaceRange(3, 7, '****') : "";
      }
    }
  }

  @override
  void onClose() {
    codeCtrl.dispose();
    phoneCtrl.dispose();
    timerUtil.cancel();
    super.onClose();
  }


  int isLengthVerify() {
    return areaCode.value == "+86" ? 11 : 9;
  }

  Future<void> sendCode() async {
    try {
      if (authService.authState is LoggedIn) {
        showLoading();
        final user = (authService.authState as LoggedIn).uiUser;
        await repository.postSendPhoneCode(user.phone ?? '');
        dismissLoading();
        showToast("sent_successfully".tr);
        timerUtil.startCountDown();
      }
    } on Map catch (e) {
      dismissLoading();
      showToast(e['message']);
      // if (e['code'] == 100019) {
      //   int sec = secondMsg(e['message']);
      //   if (sec > 0) {
      //     timerUtil.setTotalTime(sec);
      //     timerUtil.startCountDown();
      //   }
      // }
    }
  }

  void apply() {
    runCatch(() async {
      if (CoolDownManager.handler(
          key: 'CoolDownConfirmVerified', duration: 1000)) {
        showGaLoading();
        await repository.postConfirmVerified(
          1,
          SpUtil.getString('m_userName') ?? '',
          codeCtrl.text,
        );
        dismissLoading();
        Get.offAndToNamed(AppRoutes.UPDATE_PASSWORD);
      }
    });
  }

  //验证输入验证码 六位的纯数字
  void changeTextCode(String text) {
    bool codeReg = RegExp(r'^\d{6}$').hasMatch(codeCtrl.value.text);
    if (!codeReg && codeCtrl.value.text.length > 0) {
      errorVerifyCodeText.value = 'verification_code_does_not_meet_the_rules'.tr;
      buttonIsOk.value = false;
    } else {
      if (codeReg) {
        errorVerifyCodeText.value = "";
        buttonIsOk.value = true;
      }
    }
  }

  void initTimer() {
    if (timerUtil.isActive()) {
      timerUtil.startCountDown();
    } else {
      timerUtil.setInterval(1000);
      timerUtil.setTotalTime(totalTime);
    }
    timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      if (_tick.toInt() == 0) {
        autoCodeText.value = "bind_email_reacquire".tr;
        mTimeCount = 0;
        timerUtil.setTotalTime(totalTime);
        timerUtil.cancel();
      } else {
        autoCodeText.value = "${_tick.toInt()}" + 's';
      }
      mTimeCount = _tick.toInt();
      update();
    });
  }
}
