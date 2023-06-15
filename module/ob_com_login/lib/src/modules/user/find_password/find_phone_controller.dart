import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:exception/exception.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';
import 'package:sign/sign.dart';

class FindPhoneController extends GetxController with KeyboardManager {
  PageController pagePhoneController = PageController(); //手机找回页面
  RxString findPasswordErrorText = "".obs; //找回密码异常提示文字
  TextEditingController textUsernameController = TextEditingController(); //账号
  TextEditingController textPhoneController = TextEditingController(); //密码
  TextEditingController textCodeController = TextEditingController(); //二次确认密码
  TextEditingController textPasswordController = TextEditingController(); //手机号
  TextEditingController textPasswordRepeatController =
      TextEditingController(); //验证码
  FocusNode textUsernameFocus = FocusNode();
  FocusNode textCodeFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  TimerUtil timerUtil = TimerUtil();

  RxBool textPhoneAutoFocus = false.obs;

  RxList stepPhoneLable = [
    'find_input_phone_1'.tr,
    'find_input_code'.tr,
    'find_password_update'.tr
  ].obs;
  RxString title = "".obs; //标题
  RxString areaCode = '+86'.obs; //区号 +86
  RxBool isShowPassword = false.obs; //是否显示密码
  RxBool isShowRepeatPassword = false.obs; //是否显示重复密码
  RxBool isUsernameEnableClean = false.obs;
  RxBool isPhoneNumClean = false.obs;
  RxInt pagePhoneInt = 1.obs; //当前手机步骤数
  RxBool isNext = false.obs; //是否允许下一步
  RxBool enabled = true.obs; //是否允许输入框输入
  RxBool repeat = true.obs;
  int currentPage = 0; //当前页面
  RxInt phoneMaxLength = 11.obs; //手机号允许输入的最大长度，根据国家代码动态修改
  
  final signApi = Get.find<SignApi>();

  @override
  void onInit() {
    super.onInit();
    areaCode.value = LocaleUtils.areaCode;
    title.value = stepPhoneLable[0];
    clean();
    textUsernameFocus.addListener(() {
      changeUserNameEnableClean();
    });
    phoneFocus.addListener(() {
      changePhoneNumberClean();
    });
  }

  @override
  void onClose() {
    phoneFocus.dispose();
    textCodeFocus.dispose();
    textUsernameController.dispose(); //账号
    textPasswordController.dispose(); //密码
    textPasswordRepeatController.dispose(); //二次确认密码
    textPhoneController.dispose(); //手机号
    textCodeController.dispose(); //验证码
    timerUtil.cancel();
    pagePhoneController.dispose();
    super.onClose();
  }

  int isLengthVerify() {
    return areaCode.value == "+86" ? 11 : 9;
  }

  void clean() {
    pagePhoneInt.value = 1;
    currentPage = 0;
    enabled.value = true;
    isNext.value = false;

    textUsernameController.clear();
    textPasswordController.clear();
    textPasswordRepeatController.clear();
    textPhoneController.clear();
    textCodeController.clear();
  }

  //步骤提示
  void stepTips() {
    title.value = stepPhoneLable[currentPage];
    pagePhoneController.jumpToPage(currentPage);
  }

  void findNextPage() {
    if (!isNext.value) {
      return;
    }
    //第一步验证手机
    if (pagePhoneInt.value == 1) {
      checkUser();
    }
    if (pagePhoneInt.value == 2) {
      gameIsVerifiedPost();
    }
    if (pagePhoneInt.value == 3) {
      gameResetPassWordPost();
    }
  }

  //密码显示开关
  void changePassword() {
    isShowPassword.value = !isShowPassword.value;
  }

  void changeRepeatPassword() {
    isShowRepeatPassword.value = !isShowRepeatPassword.value;
  }

  void cleanUsername() {
    textUsernameController.clear();
    isUsernameEnableClean.value = false;
    isNext.value = false;
    checkPhoneNext();
  }

  void cleanUserPhoneNumber() {
    textPhoneController.clear();
    isPhoneNumClean.value = false;
    isNext.value = false;
    checkPhoneNext();
  }

  void changeUserNameEnableClean() {
    if (textUsernameController.text.length > 0 && textUsernameFocus.hasFocus) {
      isUsernameEnableClean.value = true;
    } else {
      isUsernameEnableClean.value = false;
    }
  }

  void changePhoneNumberClean() {
    if (textPhoneController.text.length > 0 && phoneFocus.hasFocus) {
      isPhoneNumClean.value = true;
    } else {
      isPhoneNumClean.value = false;
    }
  }

  void inputCheck(String text) {
    if (pagePhoneController.hasClients &&
        (pagePhoneController.page!.round() == 0)) {
      checkPhoneNext();
    }
    if (pagePhoneController.hasClients &&
        (pagePhoneController.page!.round() == 1)) {
      checkCodeNext();
    }
    if (pagePhoneController.hasClients &&
        (pagePhoneController.page!.round() == 2)) {
      checkPasswordNext();
    }
  }

  void checkPhoneNext() {
    //清空判断
    if (textUsernameController.value.text.length == 0 &&
        textPhoneController.value.text.length == 0) {
      findPasswordErrorText.value = "";
    }
    changeUserNameEnableClean();
    changePhoneNumberClean();
    bool username = RegExp(r'^(?=.*\d)[a-zA-Z].{3,10}$')
        .hasMatch(textUsernameController.value.text);
    bool phoneOk = false;
    UiCallingCode uiCallingCode = Store.callingCode
        .firstWhere((element) => element.code == areaCode.value);
    int phoneLen = uiCallingCode.lenLimits.length;
    //获取输入长度最大最小范围值
    int lenLimitsMax = phoneLen >= 2
        ? max(uiCallingCode.lenLimits[0], uiCallingCode.lenLimits[phoneLen - 1])
        : uiCallingCode.lenLimits[0];
    int lenLimitsMin = phoneLen >= 2
        ? min(uiCallingCode.lenLimits[0], uiCallingCode.lenLimits[phoneLen - 1])
        : uiCallingCode.lenLimits[0];
    phoneMaxLength.value = lenLimitsMax;
    if (textPhoneController.value.text.length >= lenLimitsMin &&
        textPhoneController.value.text.length <= lenLimitsMax) {
      phoneOk = true;
    }

    if (textUsernameFocus.hasFocus) {
      checkUserName(phoneOk, username);
    } else {
      checkPhoneNum(phoneOk, username);
    }
    if (phoneOk && username) {
      isNext.value = true;
    } else {
      isNext.value = false;
    }
  }

  checkPhoneNum(bool phoneOk, bool username) {
    if (!phoneOk && (textPhoneController.value.text.length > 0)) {
      findPasswordErrorText.value = "plz_enter_valid_number".tr;
      isNext.value = false;
    } else {
      if (phoneOk && username) {
        findPasswordErrorText.value = "";
      } else if (phoneOk) {
        findPasswordErrorText.value = "";
      }
      if (textPhoneController.text.isEmpty &&
          textUsernameController.text.isNotEmpty) {
        checkUserName(phoneOk, username);
      }
    }
  }

  checkUserName(bool phoneOk, bool username) {
    print("username=${username}");
    if (!username && (textUsernameController.value.text.length > 0)) {
      findPasswordErrorText.value =
          "find_please_enter_a_username_letters_and_numbers".tr;
      isNext.value = false;
    } else {
      if (username) {
        findPasswordErrorText.value = "";
      }
      if (textUsernameController.text.isEmpty &&
          textPhoneController.text.isNotEmpty) {
        checkPhoneNum(phoneOk, username);
      }
    }
  }

  void checkCodeNext() {
    if (textCodeController.value.text.length == 0) {
      findPasswordErrorText.value = "";
    }
    bool code = (textCodeController.value.text.length == 6);
    if (!code && (textCodeController.value.text.length > 0)) {
      findPasswordErrorText.value = "find_please_enter_verification_code".tr;
      isNext.value = false;
    } else {
      if (code) {
        findPasswordErrorText.value = "";
      }
    }
    if (textCodeController.value.text.length == 6) {
      isNext.value = true;
    } else {
      isNext.value = false;
    }
  }

  void checkPasswordNext() {
    bool l = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$')
        .hasMatch(textPasswordController.value.text);
    bool r = (textPasswordController.value.text ==
        textPasswordRepeatController.value.text);

    if (!l && (textPasswordController.value.text.length > 0)) {
      findPasswordErrorText.value =
          "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
    }
    if (!r && (textPasswordRepeatController.value.text.length > 0)) {
      findPasswordErrorText.value =
          "find_the_two_password_entries_are_inconsistent".tr;
    }

    if ((textPasswordController.text.isEmpty &&
        textPasswordRepeatController.text.isEmpty)) {
      findPasswordErrorText.value = "";
    }

    if (l && r) {
      findPasswordErrorText.value = "";
      isNext.value = true;
    } else {
      isNext.value = false;
    }

    // if (!l && (textPasswordController.value.text.length > 0)) {
    //   findPasswordErrorText.value = "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
    //   isNext.value = false;
    // } else {
    //   if (l) {
    //     findPasswordErrorText.value = "";
    //   }
    // }
    //
    // if (!r && (textPasswordRepeatController.value.text.length > 0)) {
    //   findPasswordErrorText.value = "find_the_two_password_entries_are_inconsistent".tr;
    //   isNext.value = false;
    // } else {
    //   if (r) {
    //     findPasswordErrorText.value = "";
    //   }
    // }
    // if (l && r) {
    //   findPasswordErrorText.value = "";
    //   isNext.value = true;
    // } else {
    //   isNext.value = false;
    // }
  }

  //重制密码(三)
  void gameResetPassWordPost() async {
    try {
      showLoading(msg: "please_wait".tr);
      await signApi.resetPassWord(ResetPasswordParam(
          confirmPassWord: generateMd5(textPasswordRepeatController.value.text),
          passWord: generateMd5(textPasswordController.value.text),
          username: textUsernameController.value.text));
      dismissLoading();
      findPasswordErrorText.value = "";
      showToast("find_password_retrieved_successfully".tr);
      clean();
      stepTips();
      Get.back();
    } on ServerException catch (e) {
      dismissLoading();
      findPasswordErrorText.value = e.message;
    } catch (e) {
      dismissLoading();
    }
  }

  //验证是否合法(二)
  void gameIsVerifiedPost() async {
    try {
      showLoading(msg: "please_wait".tr);
      //这个处理的原因是：当用户发送完手机验证码后没有焦点验证码输入框进行输入，但是输入的被植入到用户名输入框里。提交时出现问题
      var username = textUsernameController.value.text;
      var textCode = textCodeController.value.text;
      if (username.contains(textCode)) {
        int index = username.indexOf(textCode);
        if (index != -1) {
          username = username.substring(0, index);
        }
      }
      await signApi.isVerified(VerificationCodeParam(
          sendType: 1,
          userName: username,
          verifica: textCode,
          telephoneNum: '$areaCode-${textPhoneController.value.text}'));
      dismissLoading();
      title.value = stepPhoneLable[pagePhoneInt.value];
      isNext.value = false;
      enabled.value = false;
      textCodeFocus.unfocus();
      showToast("find_phone_verification_succeeded".tr);
      pagePhoneController.animateToPage(
        pagePhoneInt.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      pagePhoneInt.value++;
    } on ServerException catch (e) {
      dismissLoading();
      findPasswordErrorText.value = e.message;
    } catch (e) {
      dismissLoading();
    }
  }

  //发送验证码
  void sendCode() async {
    try {
      showLoading(msg: "please_wait".tr);
      await signApi.sendMobileMessages(SendVerificationCodeParam(
          telephoneNum: '$areaCode-${textPhoneController.value.text}',
          findType: 1,
          username: textUsernameController.value.text));
      showToast("sent_successfully".tr);
      findPasswordErrorText.value = "";
      textCodeFocus.requestFocus();
      timerUtil.startCountDown();
      dismissLoading();
    } on ServerException catch (e) {
      dismissLoading();
      findPasswordErrorText.value = e.message;
    } catch (e) {
      dismissLoading();
    }
  }

  // 17702258575
  //校验是否合法
  void checkUser() async {
    try {
      showLoading(msg: "please_wait".tr);
      await signApi.checkUser(RecoverPasswordParam(
          telephoneNum: '$areaCode-${textPhoneController.value.text}',
          findType: 1,
          username: textUsernameController.value.text));
      hideKeyboard();
      dismissLoading();
      title.value = stepPhoneLable[pagePhoneInt.value];
      isNext.value = false;
      enabled.value = false;
      pagePhoneController.animateToPage(
        pagePhoneInt.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      pagePhoneInt.value++;
    } on ServerException catch (e) {
      dismissLoading();
      findPasswordErrorText.value = e.message;
    } catch (e) {
      dismissLoading();
    }
  }

  String generateMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toUpperCase();
  }
}
