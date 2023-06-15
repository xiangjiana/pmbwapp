import 'package:common_utils/common_utils.dart';
import 'package:exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_mixin.dart';
import 'package:params/params.dart';
import 'package:repository/utils/device_type.dart';
import 'package:sign/sign.dart';

class LoginErrorController extends GetxController
    with KeyboardManager, LoginMixin {
  TextEditingController textPhoneController = TextEditingController(); //手机号
  TextEditingController textCodeController = TextEditingController(); //验证码
  FocusNode codeFocusNode = FocusNode();

  final TimerUtil timerUtil = TimerUtil();
  final RxBool buttonIsOk = false.obs; //按钮是否亮起
  final String phoneNum = Get.arguments['phoneNum'] ?? '';
  final String userName = Get.arguments['userName'] ?? '';
  final String password = Get.arguments['password'] ?? '';
  late String sendType = ''; //发送方式 1-手机;2-邮箱
  RxString areaCode = '+86'.obs; //区号 +86
  
  final signApi = Get.find<SignApi>();

  @override
  void onInit() {
    super.onInit();
    Store.init();
    Constants.init();
    areaCode.value = LocaleUtils.areaCode;
    initTextEditingController();
  }

  //初始化手手机号与验证码controller
  void initTextEditingController() {
    try {
      var type = phoneNum.isNotEmpty ? phoneNum : "";
      if (GetUtils.isEmail(phoneNum)) {
        sendType = '2';
        final index = type.indexOf('@');
        if (index != -1) {
          var length = type.substring(0, index).length;
          if (length > 4) {
            textPhoneController.text = type.replaceRange(4, index, '****');
          } else {
            textPhoneController.text = type.replaceRange(length, index, '****');
          }
        }
      } else {
        sendType = '1';
        var phoneNo = type.split('-');
        if (phoneNo.length >= 2) {
          areaCode.value = phoneNo[0];
          textPhoneController.text = phoneNo[1].length > 0
              ? phoneNo[1].replaceRange(3, 7, '****')
              : "";
        } else {
          textPhoneController.text =
              type.length > 0 ? type.replaceRange(3, 7, '****') : '';
        }
      }
    } catch (e) {}
  }

  void sendCode() async {
    try {
      showLoading(msg: "please_wait".tr);
      await signApi.sendMobileMessages(SendVerificationCodeParam(
          telephoneNum: phoneNum, findType: 1, username: userName));
      showToast("sent_successfully".tr);
      timerUtil.startCountDown();

      dismissLoading();
    } on ServerException catch (e) {
      dismissLoading();
      showToast(e.message);
    } catch (e) {
      dismissLoading();
    }
  }

  //goBackLoginPage返回登录页面
  void goBackLoginPage() {
    Get.back();
  }

  ///发送验证
  void sendVaildate() async {
    try {
      hideKeyboard();
      if (textCodeController.text.length == 0) {
        showToast('login_error_code'.tr);
        return;
      }
      showLoading(msg: "please_wait".tr);
      var username = userName;
      var textCode = textCodeController.value.text;
      LoginResp res = await signApi.verificationCodeLogin(
          VerificationCodeAndLoginParam(
              appType: InstallDeviceType.platFormInfo.browserName ?? "",
              appVersion: InstallDeviceType.platFormInfo.version ?? "",
              deviceNo: InstallDeviceType.platFormInfo.deviceId ?? "",
              loginReference: "588326785867908888",
              sendType: int.tryParse(sendType) ?? 0,
              userName: username,
              verifica: textCode));
      onSignInSuccess(
        userName,
        res.memberInfo,
        res.token,
        onWarnText: (error) {
          showToast(error);
        },
        onComplete: (userInfo) {
          gotoHomePage();
        },
      );
    } on ServerException catch (e) {
      dismissLoading();
      showToast(e.message);
    } catch (e) {
      dismissLoading();
    }
  }

  //验证输入验证码 六位的纯数字
  void changeTextCode(String text) {
    bool codeReg = RegExp(r'^\d{6}$').hasMatch(textCodeController.value.text);
    if (!codeReg && (textCodeController.value.text.length > 0)) {
      buttonIsOk.value = false;
    } else {
      if (codeReg) {
        buttonIsOk.value = true;
      }
    }
  }

  @override
  void onClose() {
    textPhoneController.dispose();
    textCodeController.dispose();
    timerUtil.cancel();
    super.onClose();
  }
}
