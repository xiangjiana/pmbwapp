import 'package:common_utils/common_utils.dart';
import 'package:exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';
import 'package:sign/sign.dart';

class FindEmailController extends GetxController with KeyboardManager {
  PageController pageEmailController = PageController(); //邮箱找回页面
  RxString findPasswordErrorText = "".obs; //找回密码异常提示文字
  TextEditingController textUsernameController = TextEditingController(); //账号
  TextEditingController textPasswordController = TextEditingController(); //邮箱号
  TextEditingController textPasswordRepeatController = TextEditingController(); //验证码
  TextEditingController textEmailController = TextEditingController(); //密码
  TextEditingController textCodeController = TextEditingController(); //二次确认密码

  FocusNode textUsernameFocus = FocusNode();
  FocusNode textEmailFocus = FocusNode();
  FocusNode textCodeFocus = FocusNode();
  TimerUtil timerUtil = TimerUtil();

  RxList stepEmailLable = ['find_input_email_vail'.tr, 'find_input_code'.tr, 'find_password_update'.tr].obs;
  RxString title = "".obs; //标题
  RxBool isShowPassword = false.obs; //是否显示密码
  RxBool isShowRepeatPassword = false.obs; //是否显示重复密码
  RxBool isUsernameEnableClean = false.obs;
  RxBool isEmailEnableClean = false.obs;
  RxInt pageEmailInt = 1.obs; //当前邮箱步骤数
  RxBool isNext = false.obs; //是否允许下一步
  RxBool enabled = true.obs; //是否允许输入框输入
  int currentPage = 0;
  
  final signApi = Get.find<SignApi>();



  @override
  void onInit() {
    super.onInit();
    title.value = stepEmailLable[0]; //标题
    clean();
    textEmailFocus.addListener(() {
      if (GetPlatform.isAndroid) {
        if (textEmailFocus.hasFocus) {
          //用于兼容部分android手机不呼出键盘问题
          SystemChannels.textInput.invokeMethod('TextInput.show');
        } else {
          textEmailFocus.unfocus();
        }
      }
    });
    textUsernameFocus.addListener(() {
      changeUserNameEnableClean();
    });
    textEmailFocus.addListener(() {
      changeEmailEnableClean();
    });
  }

  @override
  void onClose() {
    textUsernameController.dispose(); //账号
    textEmailController.dispose(); //邮箱号
    textCodeController.dispose(); //验证码
    textPasswordController.dispose(); //密码
    textPasswordRepeatController.dispose(); //二次确认密码
    textEmailFocus.dispose();
    textCodeFocus.dispose();
    timerUtil.cancel();
    pageEmailController.dispose();
    super.onClose();
  }


  void clean() {
    pageEmailInt.value = 1;
    currentPage = 0;
    enabled.value = true;
    isNext.value = false;

    textUsernameController.clear();
    textPasswordController.clear();
    textPasswordRepeatController.clear();
    textEmailController.clear();
    textCodeController.clear();
  }

  //步骤提示
  void stepTips() {
    title.value = stepEmailLable[currentPage];
    pageEmailController.jumpToPage(currentPage);
  }

  void findNextPage() {
    if (!isNext.value) {
      return;
    }
    //第一步验邮箱
    if (pageEmailInt.value == 1) {
      checkUser();
    }
    if (pageEmailInt.value == 2) {
      gameIsVerifiedPost();
    }
    if (pageEmailInt.value == 3) {
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
    checkEmailNext();
  }
  void cleanEmail(){
    textEmailController.clear();
    isEmailEnableClean.value = false;
    checkEmailNext();
  } //当前页面
  void changeUserNameEnableClean() {
    if (textUsernameController.text.length > 0 &&
        textUsernameFocus.hasFocus) {
      isUsernameEnableClean.value = true;
    } else {
      isUsernameEnableClean.value = false;
    }
  }

  void changeEmailEnableClean() {
    if (textEmailController.text.length > 0 &&
        textEmailFocus.hasFocus) {
      isEmailEnableClean.value = true;
    } else {
      isEmailEnableClean.value = false;
    }
  }

  void inputCheck(String text) {
    if (pageEmailController.hasClients &&
        (pageEmailController.page!.round() == 0)) {
      checkEmailNext();
    }
    if (pageEmailController.hasClients &&
        (pageEmailController.page!.round() == 1)) {
      checkCodeNext();
    }
    if (pageEmailController.hasClients &&
        (pageEmailController.page!.round() == 2)) {
      checkPasswordNext();
    }
  }

  void checkEmailNext() {
    if (textUsernameController.value.text.length == 0 &&
        textEmailController.value.text.length == 0) {
      findPasswordErrorText.value = "";
    }
    changeUserNameEnableClean();
    changeEmailEnableClean();

    bool username = RegExp(r'^(?=.*\d)[a-zA-Z].{3,10}$')
        .hasMatch(textUsernameController.value.text);

    bool email = RegExp(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$')
        .hasMatch(textEmailController.value.text);
    if(textUsernameFocus.hasFocus){
      checkUserName(username,email);
    }else{ 
      checkEmialFormat(username,email);
    }

    if (email && username) {
      isNext.value = true;
    }else{
      isNext.value = false;
    }
  }
  void checkUserName(bool username, bool email){
    if (!username && (textUsernameController.value.text.length > 0)) {
      findPasswordErrorText.value = "find_please_enter_a_username_letters_and_numbers".tr;
      isNext.value = false;
    } else {
      if (username) {
        findPasswordErrorText.value = "";
      }
      if(textUsernameController.text.isEmpty&&textEmailController.text.isNotEmpty) {
        checkEmialFormat(username, email);
      }else if(username&&textEmailController.text.isEmpty) {
        findPasswordErrorText.value = "find_please_enter_your_vaild_email".tr;
      }
    }

  }
  void checkEmialFormat(bool username, bool email){

    if (!email && (textEmailController.value.text.length > 0)) {
      findPasswordErrorText.value = "find_please_enter_your_vaild_email".tr;
      isNext.value = false;
    } else {
      if (email & username) {
        findPasswordErrorText.value = "";
      }
      if(textEmailController.text.isEmpty&&textUsernameController.text.isNotEmpty) {
        checkUserName(username, email);
      }else if(email&&textUsernameController.text.isEmpty) {
        findPasswordErrorText.value = "find_please_enter_a_username_letters_and_numbers".tr;
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
      findPasswordErrorText.value = "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
      isNext.value = false;
    } else {
      if (l) {
        findPasswordErrorText.value = "";
      }
    }

    if (!r && (textPasswordRepeatController.value.text.length > 0)) {
      findPasswordErrorText.value = "find_the_two_password_entries_are_inconsistent".tr;
      isNext.value = false;
    } else {
      if (r) {
        findPasswordErrorText.value = "";
      }
    }
    if (l && r) {
      findPasswordErrorText.value = "";
      isNext.value = true;
    } else {
      isNext.value = false;
    }
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
          emailAddr: textEmailController.value.text,
          sendType: 2,
          userName: username,
          verifica: textCode));
      dismissLoading();
      title.value = stepEmailLable[pageEmailInt.value];
      isNext.value = false;
      enabled.value = false;
      pageEmailController.animateToPage(
        pageEmailInt.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      pageEmailInt.value++;
    } on ServerException catch (e) {
      dismissLoading();
      findPasswordErrorText.value = e.message;
      showToast(e.message);
    } catch (e) {
      dismissLoading();
    }
  }

  //发送验证码
  void sendCode() async {
    try {
      showLoading(msg: "please_wait".tr);
      await signApi.sendMobileMessages(SendVerificationCodeParam(
          emailAddr: textEmailController.value.text,
          findType: 2,
          username: textUsernameController.value.text));
      showToast("sent_successfully".tr);
      findPasswordErrorText.value = '';
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
      //邮箱找回
      await signApi.checkUser(RecoverPasswordParam(
          emailAddr: textEmailController.value.text,
          findType: 2,
          username: textUsernameController.value.text));
      hideKeyboard();
      dismissLoading();
      title.value = stepEmailLable[pageEmailInt.value];
      isNext.value = false;
      enabled.value = false;
      pageEmailController.animateToPage(
        pageEmailInt.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      pageEmailInt.value++;
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
