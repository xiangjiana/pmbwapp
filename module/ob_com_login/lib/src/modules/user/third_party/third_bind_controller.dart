import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_mixin.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_repository.dart';
import 'package:params/params.dart';
import 'package:sign/sign.dart';
import 'package:sp_util/sp_util.dart';
import 'package:repository/utils/device_type.dart';

class ThirdBindController extends GetxController
    with KeyboardManager, LoginMixin {
  final repository = Get.find<LoginRepository>();
  final signApi = Get.find<SignApi>();

  TextEditingController signUpUsernameController =
      TextEditingController(); //账号（注册）
  TextEditingController signUpPasswordController =
      TextEditingController(); //密码（注册）
  TextEditingController signUpPasswordRepeatController =
      TextEditingController(); //重复密码（注册）
  TextEditingController agentCodeController = TextEditingController(); //密码（注册）

  FocusNode focusNodeSingUpUsername = FocusNode();
  FocusNode focusNodeSingUpPassword = FocusNode();
  FocusNode focusNodeSingUpRptPassword = FocusNode();
  FocusNode focusNodeAgentCode = FocusNode();

  RxBool isRegPassword = false.obs; //注册 是否显示密码
  RxBool isRegRepeatPassword = false.obs; //注册 是否显示重复密码
  RxBool isRegUsernameEnableClean = false.obs;
  RxBool isRegPasswordEnableClean = false.obs;
  RxBool isRegRptPasswordEnableClean = false.obs;
  RxBool isAgentCodeEnableClean = false.obs;
  RxBool buttonIsOk = false.obs; //按钮是否亮起
  RxString errorText = "".obs;

  RxBool isCaptchaVisible = false.obs;

  RegExp usnRegExp = RegExp(r'^(?=.*\d)[a-zA-Z].{3,10}$');
  RegExp psdRegExp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$');

  var arguments = Get.arguments;

  late String platformId;
  late String platform;

  @override
  void onInit() {
    super.onInit();
    if (arguments != null) {
      platform = Get.arguments["platform"];
      platformId = Get.arguments["platformId"];
    }
  }

  @override
  void onClose() {
    signUpUsernameController.dispose();
    signUpPasswordController.dispose();
    signUpPasswordRepeatController.dispose();
    agentCodeController.dispose();

    focusNodeSingUpUsername.dispose();
    focusNodeSingUpPassword.dispose();
    focusNodeSingUpRptPassword.dispose();
    focusNodeAgentCode.dispose();

    super.onClose();
  }

  void cleanRegUsername() {
    signUpUsernameController.clear();
    errorText.value = "";
    isRegUsernameEnableClean.value = false;
    buttonIsOk.value = false;
  }

  void cleanRegPassword() {
    signUpPasswordController.clear();
    errorText.value = "";
    isRegPasswordEnableClean.value = false;
    buttonIsOk.value = false;
  }

  void cleanRegRptPassword() {
    signUpPasswordRepeatController.clear();
    errorText.value = "";
    isRegRptPasswordEnableClean.value = false;
    buttonIsOk.value = false;
  }

  void cleanAgentCode() {
    agentCodeController.clear();
    errorText.value = "";
    isAgentCodeEnableClean.value = false;
  }

  ///注册 密码显示开关
  void changeRegPassword() {
    isRegPassword.value = !isRegPassword.value;
  }

  ///注册 重复密码显示开关
  void changeRegRepeatPassword() {
    isRegRepeatPassword.value = !isRegRepeatPassword.value;
  }

  void changeRegUsernameEnableClean() {
    if (signUpUsernameController.text.isNotEmpty &&
        focusNodeSingUpUsername.hasFocus) {
      isRegUsernameEnableClean.value = true;
    } else {
      isRegUsernameEnableClean.value = false;
    }
  }

  void changeRegPasswordEnableClean() {
    if (signUpPasswordController.text.isNotEmpty &&
        focusNodeSingUpPassword.hasFocus) {
      isRegPasswordEnableClean.value = true;
    } else {
      isRegPasswordEnableClean.value = false;
    }
  }

  void changeRegRptPasswordEnableClean() {
    if (signUpPasswordRepeatController.text.isNotEmpty &&
        focusNodeSingUpRptPassword.hasFocus) {
      isRegRptPasswordEnableClean.value = true;
    } else {
      isRegRptPasswordEnableClean.value = false;
    }
  }

  void changeAgentCodeEnableClean() {
    if (agentCodeController.text.isNotEmpty && focusNodeAgentCode.hasFocus) {
      isAgentCodeEnableClean.value = true;
    } else {
      isAgentCodeEnableClean.value = false;
    }
  }

  ///输入信息 验证
  void changeTextUsernameAndPassword(String text) {
    changeRegUsernameEnableClean();
    changeRegPasswordEnableClean();
    changeRegRptPasswordEnableClean();
    changeAgentCodeEnableClean();
    bool userNameLength = signUpUsernameController.text.isNotEmpty;
    bool passWordLength = signUpPasswordController.text.isNotEmpty;
    bool repatPasswordLength = signUpPasswordRepeatController.text.isNotEmpty;
    bool userNameReg = usnRegExp.hasMatch(signUpUsernameController.text);
    bool passWordReg = psdRegExp.hasMatch(signUpPasswordController.text);
    bool repatPasswordSame =
        signUpPasswordController.text == signUpPasswordRepeatController.text;

    if (!userNameReg && userNameLength) {
      errorText.value = "find_please_enter_a_username_letters_and_numbers".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (!userNameLength) {
        errorText.value = "find_please_enter_a_username_letters_and_numbers".tr;
        buttonIsOk.value = false;
        return;
      } else if (userNameReg) {
        //检测字符是否报包含数字
        errorText.value = "";
      }
    }
    if (!passWordReg && passWordLength) {
      errorText.value =
          "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (!passWordLength && userNameReg) {
        errorText.value =
            "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
        buttonIsOk.value = false;
        return;
      } else if (passWordReg && userNameReg) {
        errorText.value = "";
      }
    }

    if (!repatPasswordSame && repatPasswordLength) {
      errorText.value = "find_the_two_password_entries_are_inconsistent".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (repatPasswordSame && passWordReg && userNameReg) {
        errorText.value = "";
      }
    }
    /*if (!Invitation.isGoodInvitationCode(agentCodeController.text)&&!Invitation.isGoodInvitationCode(Store.invitationCode.value)) {
      if (agentCodeLength) {
        errorText.value = 'plz_enter_seven_number'.tr;
      } else {
        errorText.value = "";
      }
      buttonIsOk.value = false;
      return;
    }*/

    if (userNameReg && passWordReg && repatPasswordSame) {
      errorText.value = "";
      buttonIsOk.value = true;
    } else {
      if (!userNameLength && !passWordLength && !repatPasswordLength) {
        errorText.value = "";
        buttonIsOk.value = false;
        return;
      }
    }
  }

  Future<void> hideCaptcha() async {
    isCaptchaVisible.value = false;
    //await VideoManager.instance.safeStart();
  }

  Future<void> signUpStepTwoShowCaptcha() async {
    //await VideoManager.instance.safePause();
    isCaptchaVisible.value = true;
  }

  ///注册 图开形验证码 验证成功逻辑 step three
  Future<bool?> signUpStepThreeVerifyCaptcha(String params) async {
    try {
      var json = const JsonDecoder().convert(params);
      await repository.postGeetestSecondValidate(
        json["geetest_challenge"],
        json["geetest_seccode"],
        json["geetest_validate"],
      );
      hideCaptcha();
      signUpStepFinalRegister();
      return true;
    } on Map catch (e) {
      hideCaptcha();
      showToast(e['message']);
      return false;
    }
  }

  ///发送注册请求 step four
  Future<void> signUpStepFinalRegister() async {
    try {
      final String invitationCode;
      if (agentCodeController.text.length >= 7) {
        invitationCode = agentCodeController.text;
      } else {
        invitationCode = Store.invitationCode.value;
      }

      final res = await signApi.register(
        RegisterParam(deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '', invitationCode: invitationCode, 
        userName: signUpUsernameController.text, userPwd: signUpPasswordController.text,thirdPlatformId: platformId)
      );
      errorText.value = "";
      showToast("login_registration_success".tr);
      hideKeyboard(); // 这个位置不能变  fix: OB-5166【兼容-注册】Android_APP在注册的滑动模块页面停留30秒，APP出现卡死并且闪退
      onSignInSuccess(
        res.memberInfo.userName,
        res.memberInfo,
        res.token,
        isFromLogin: false,
        onWarnText: (error) {
          errorText.value = error;
        },
        onSaveData: () {
          SpUtil.putString("m_userName", signUpUsernameController.text.toLowerCase());
          SpUtil.putString("userName", signUpUsernameController.text.toLowerCase());
          SpUtil.putString(
            "userPassword",
            Tools.base64Encode(signUpPasswordController.text),
          );
        },
        onComplete: (userInfo) {
          LoginX.instance.loginCallback?.onObRegister(
              signUpUsernameController.text,
              Store.registerReference.value,
              invitationCode,
              Store.friendInvitationCode.value);
          errorText.value = '';
          checkSpAccount(
            res.memberInfo.id,
            signUpUsernameController.text,
            signUpPasswordController.text,
            res.token,
            userAvatarUrl: userInfo!.avatarUrl ?? '',
          );
          Store.userPassword =
              Tools.base64Encode(signUpPasswordController.text);
          Invitation.updateInvitationCode(invitationCode);
          gotoHomePage();
        },
      );
    } on Map catch (e) {
      if (e['code'] != 503) {
        if (e['code'] == 100047 || e['code'] == 100049 || e['code'] == 100046) {
          Store.invitationCode.value = '';
          verifySignUpPage();
        }
        if (e['code'] != 333333) {
          errorText.value = e['message'];
        }
      }
    }
  }

  ///注册 触发图开形验证码，step one
  void signUpStepOneCheck() {
    if (buttonIsOk.value) {
      if (signUpUsernameController.text == "") {
        errorText.value = "login_registration_failed_empty_account".tr;
        return;
      }
      if (signUpPasswordController.text == "") {
        errorText.value = "login_registration_failed_empty_password".tr;
        return;
      }
      signUpStepTwoShowCaptcha();
    }
  }

  ///注册 图开形验证码 请求逻辑
  Future<String?> getCaptcha() async {
    try {
      final res = await repository.postGeetestFirstRegister();
      final json = jsonDecode(res);
      final data = Map.from(json);
      data["success"] = json["success"] == 1;
      return jsonEncode(data);
    } catch (e) {
      hideCaptcha();
      showToast(e.toString());
    }
  }

  void changeIsLoginPage() {
    Get.back();
  }

  ///注册 输入信息 验证
  void verifySignUpPage() {
    changeRegUsernameEnableClean();
    changeRegPasswordEnableClean();
    changeRegRptPasswordEnableClean();
    changeAgentCodeEnableClean();
    bool userNameLength = signUpUsernameController.text.isNotEmpty;
    bool passWordLength = signUpPasswordController.text.isNotEmpty;
    bool repatPasswordLength = signUpPasswordRepeatController.text.isNotEmpty;
    bool agentCodeLength = agentCodeController.text.isNotEmpty;
    bool userNameReg = usnRegExp.hasMatch(signUpUsernameController.text);
    bool passWordReg = psdRegExp.hasMatch(signUpPasswordController.text);
    bool repatPasswordSame =
        signUpPasswordController.text == signUpPasswordRepeatController.text;

    if (!userNameReg && userNameLength) {
      errorText.value = "find_please_enter_a_username_letters_and_numbers".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (!userNameLength) {
        errorText.value = "find_please_enter_a_username_letters_and_numbers".tr;
        buttonIsOk.value = false;
        return;
      } else if (userNameReg) {
        //检测字符是否报包含数字
        errorText.value = "";
      }
    }
    if (!passWordReg && passWordLength) {
      errorText.value =
          "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (!passWordLength && userNameReg) {
        errorText.value =
            "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
        buttonIsOk.value = false;
        return;
      } else if (passWordReg && userNameReg) {
        errorText.value = "";
      }
    }

    if (!repatPasswordSame && repatPasswordLength) {
      errorText.value = "find_the_two_password_entries_are_inconsistent".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (repatPasswordSame && passWordReg && userNameReg) {
        errorText.value = "";
      }
    }
    /*if (!Invitation.isGoodInvitationCode(agentCodeController.text)&&!Invitation.isGoodInvitationCode(Store.invitationCode.value)) {
      if (agentCodeLength) {
        errorText.value = 'plz_enter_seven_number'.tr;
      } else {
        errorText.value = "";
      }
      buttonIsOk.value = false;
      return;
    }*/

    if (userNameReg && passWordReg && repatPasswordSame) {
      errorText.value = "";
      buttonIsOk.value = true;
    } else {
      if (!userNameLength && !passWordLength && !repatPasswordLength) {
        errorText.value = "";
        buttonIsOk.value = false;
        return;
      }
    }
  }
}
