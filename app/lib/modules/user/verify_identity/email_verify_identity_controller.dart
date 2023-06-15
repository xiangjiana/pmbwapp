import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/user/verify_identity/repository/verify_identity_repository.dart';
import 'package:params/params.dart';
import 'package:sp_util/sp_util.dart';
import 'package:user/user.dart';

class EmailVerifyIdentityController extends GetxController
    with FormValidate, KeyboardManager {
  final VerifyIdentityRepository repository;
  final AuthService authService;
  final codeCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final TimerUtil timerUtil = TimerUtil();
  var buttonIsOk = false.obs; //按钮是否亮起
  RxString errorVerifyCodeText = "".obs;
  RxString autoCodeText = "login_error_get_code".tr.obs;
  int mTimeCount = 0;
  int totalTime = 59 * 1000;
  final userApi = Get.find<UserApi>();


  EmailVerifyIdentityController(this.repository, this.authService);

  @override
  void onInit() {
    super.onInit();
    hideKeyboard();
    initTimer();
    if (authService.authState is LoggedIn) {
      final user = (authService.authState as LoggedIn).uiUser;
      if (user.email!.isNotEmpty) {
        final index = user.email!.indexOf('@');
        if (index != -1) {
          var length = user.email!.substring(0, index).length;
          if (length > 4) {
            emailCtrl.text = user.email!.replaceRange(4, index, '****');
          } else {
            emailCtrl.text = user.email!.replaceRange(length, index, '****');
          }
        }
      }
    }
  }

  @override
  void onClose() {
    codeCtrl.dispose();
    emailCtrl.dispose();
    timerUtil.cancel();
    super.onClose();
  }

  Future<void> sendCode() async {
    try {
      if (authService.authState is LoggedIn) {
        showLoading();
        final user = (authService.authState as LoggedIn).uiUser;
        await userApi.sendEmailCode(EmailParam(userEmail: user.email ?? ''));
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
          2,
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
