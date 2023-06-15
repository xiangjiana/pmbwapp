import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';
import 'package:user/user.dart';

class BindEmailController extends GetxController
    with FormValidate, KeyboardManager {
  final AuthService authService;
  final TimerUtil timerUtil = TimerUtil();
  final emailCtrl = TextEditingController();
  final verifyCodeCtrl = TextEditingController();

  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  RxString emailErr = ''.obs;
  RxString codeErr = ''.obs;
  RxBool buttonIsOk = false.obs; //按钮是否亮起
  RxBool isLoadingStatus = false.obs;
  RxBool verifyEmail = false.obs;
  RxBool verifyCode = false.obs;
  RxBool isEnableEmailCodeSend = false.obs;
  RxString autoCodeText = "login_error_get_code".tr.obs;
  FocusNode emailFocus = FocusNode();
  FocusNode codeFocus = FocusNode();

  int mTimeCount = 0;
  int totalTime = 59 * 1000;

  BindEmailController(this.authService);

  final userApi = Get.find<UserApi>();

  @override
  void onInit() {
    super.onInit();
    emailCtrl.clear();
    verifyCodeCtrl.clear();
    initCountDown();
  }

  @override
  void onClose() {
    timerUtil.cancel();
    emailCtrl.dispose();
    verifyCodeCtrl.dispose();
    emailFocus.dispose();
    codeFocus.dispose();
    super.onClose();
  }

  void initCountDown() {
    if (timerUtil.isActive()) {
      timerUtil.startCountDown();
    } else {
      timerUtil.setInterval(1000);
      timerUtil.setTotalTime(totalTime);
      timerUtil.setOnTimerTickCallback((int tick) {
        double _tick = tick / 1000;
        if (_tick.toInt() == 0) {
          autoCodeText.value = 'login_again_get_code'.tr;
          mTimeCount = 0;
          timerUtil.setTotalTime(totalTime);
          timerUtil.cancel();
        } else {
          autoCodeText.value = "${_tick.toInt()}" + 's';
        }
        mTimeCount = _tick.toInt();
      });
    }
  }

  void sendCode() {
    if (timerUtil.isActive()) return;
    final email = emailCtrl.text;
    if (isEmail(email)) {
      runCatch(() async {
        var cancel = showLoading();
        await userApi.sendEmailCode(EmailParam(userEmail: emailCtrl.text));
        cancel();
        showToast("sent_successfully".tr);
        timerUtil.startCountDown();
      });
    } else {
      showToast("email_error_cannot_get_verification_code".tr);
    }
  }

  void apply() {
    if (CoolDownManager.handler(key: 'kCoolDownApplyDeposit', duration: 1000)) {
      if (emailCtrl.value.text.length == 0) {
        showToast('email_cannot_be_empty'.tr);
        return;
      }
      if (verifyCodeCtrl.value.text.length == 0) {
        showToast('bind_verification_code_cannot_be_empty'.tr);
        return;
      }
      runCatch(() async {
        isLoadingStatus.value = true;
        await userApi.emailBinding(
          UserEmailParam(
            email: emailCtrl.text,
            v: verifyCodeCtrl.text,
          ),
        );
        if (authService.authState is LoggedIn) {
          final logged = (authService.authState as LoggedIn);
          authService.updateAuthState(
            LoggedIn(logged.uiUser.copyWith(email: emailCtrl.text)),
          );
        }
        isLoadingStatus.value = false;
        showToast("bind_successfully".tr);
        Get.back();
      }, handleError: (e) {
        isLoadingStatus.value = false;
        showToast(e.error.message);
      });
    }
  }

  /// 检查邮箱格式
  bool isEmail(String input) {
    if (input.isEmpty) return false;
    // 邮箱正则
    String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    return RegExp(regexEmail).hasMatch(input);
  }

  void changeEmailValidator(String text) {
    if (emailCtrl.value.text.length == 0) {
      emailErr.value = "";
      verifyEmail.value = false;
      return;
    }

    RegExp emaiRExpl = RegExp(regexEmail);
    bool email = emaiRExpl.hasMatch(emailCtrl.value.text);
    if (!email) {
      emailErr.value = 'email_address_does_not_conform'.tr;
      buttonIsOk.value = false;
    } else {
      emailErr.value = '';
      verifyEmail.value = true;
      isEnableEmailCodeSend.value = true;
    }

    if (verifyEmail.value && verifyCode.value) {
      codeErr.value = emailErr.value = "";
      buttonIsOk.value = true;
    } else {
      buttonIsOk.value = false;
    }
  }

  void changeCodeValidator(String text) {
    bool codeReg = RegExp(r'^\d{6}$').hasMatch(verifyCodeCtrl.value.text);
    if (!codeReg && (verifyCodeCtrl.value.text.length > 0)) {
      codeErr.value = "verification_code_does_not_meet_the_rules".tr;
      verifyCode.value = false;
    } else {
      if (codeReg) {
        codeErr.value = "";
        verifyCode.value = true;
      } else if (verifyCodeCtrl.value.text.length == 0) {
        codeErr.value = "";
        verifyCode.value = false;
      }
    }

    if (verifyEmail.value && verifyCode.value) {
      buttonIsOk.value = true;
    } else {
      buttonIsOk.value = false;
    }
  }
}
