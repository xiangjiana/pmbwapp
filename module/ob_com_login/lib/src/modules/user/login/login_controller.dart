import 'dart:async';
import 'dart:convert';

import 'package:exception/exception.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_mixin.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_repository.dart';
import 'package:ob_com_login/src/modules/user/login/repository/reset_info.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/repository/ui_toggle_item_user.dart';
import 'package:params/params.dart';
import 'package:sign/sign.dart';
import 'package:sp_util/sp_util.dart';
import 'package:repository/utils/device_type.dart';
import 'package:vendor_auth/vendor_auth.dart';
import 'package:dio/dio.dart';

bool isAppFirstLaunch = true;

class LoginController extends GetxController with KeyboardManager, LoginMixin {
  final repository = Get.find<LoginRepository>();
  final signApi = Get.find<SignApi>();
  RxBool isPassword = false.obs; //登录 是否显示密码
  RxBool isRegPassword = false.obs; //注册 是否显示密码
  RxBool isRegRepeatPassword = false.obs; //注册 是否显示重复密码
  RxBool isRememberPassword = true.obs; //是记住密码
  RxBool isLoginPage = true.obs; //是否是登录页面
  RxBool isRegisterProtocol = false.obs; //注册协议是否同意
  RxBool isBlindmanMode = false.obs; //显示隐藏 查看密码眼睛
  RxBool isRegBlindmanMode = true.obs; //显示隐藏 查看密码眼睛  注册
  RxBool isUsernameEnableClean = false.obs;
  RxBool isPasswordEnableClean = false.obs;
  RxBool isRegUsernameEnableClean = false.obs;
  RxBool isRegPasswordEnableClean = false.obs;
  RxBool isRegRptPasswordEnableClean = false.obs;
  RxBool isAgentCodeEnableClean = false.obs;
  RxBool isCaptchaVisible = false.obs;
  RxString errorTextUsername = "".obs;
  RxString errorTextPassword = "".obs;
  RxString errorTextPassword2 = "".obs;
  RxString errorTextAgentcode = "".obs;

  // String invitationCode = '';
  // String friendInvitationCode = '';
  // String registerReference = '';
  TextEditingController singInUsernameController = TextEditingController(); //账号
  TextEditingController signInPasswordController = TextEditingController(); //密码
  TextEditingController signUpPasswordRepeatController =
      TextEditingController(); //重复密码（注册）
  TextEditingController signUpUsernameController =
      TextEditingController(); //账号（注册）
  TextEditingController signUpPasswordController =
      TextEditingController(); //密码（注册）
  TextEditingController agentCodeController = TextEditingController(); //密码（注册）
  ObPopupMenuController menuController = ObPopupMenuController();
  FocusNode focusNodeSingInUsername = FocusNode();
  FocusNode focusNodeSingInPassword = FocusNode();
  FocusNode focusNodeSingUpUsername = FocusNode();

  FocusNode focusNodeSingUpPassword = FocusNode();
  FocusNode focusNodeSingUpRptPassword = FocusNode();
  FocusNode focusNodeAgentCode = FocusNode();

  RxBool buttonIsOk = false.obs; //按钮是否亮起
  VoidCallback? obRemoveListenerDeInit;
  RegExp usnRegExp = RegExp(r'^(?=.*\d)[a-zA-Z].{3,10}$');
  RegExp usnRegFirstExp = RegExp(r'^[a-zA-Z]');
  RegExp psdRegExp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$');
  StreamSubscription? loginListener;
  List<Map<String, String>> supportLang =
      Flavor.I.getObject(MERCHANT_SUPPORT_LANG)! as List<Map<String, String>>;
  @override
  void onInit() {
    super.onInit();
    Store.init();
    Constants.init();

    isLoginPage.value = Get.arguments?["isLoginPage"] ?? true;

    LoginX.instance.loginCallback?.WelcomeManager_init();

    hideKeyboard();
    //根据需求暂时隐藏电竞的账号切换功能
    if (Store.clientId != Store.clientIdDJ) {
      initSpAccount();
    }
    //获取鸿蒙系统
    ///OBChannelManager.instance.sendEventToNative(NativeEvent.systeminfo, {});
    LoginX.instance.loginCallback?.OBChannelManager_systemInfo();
    //初始化默认选未状态
    if (SpUtil.getString("isRemember")?.isEmpty ?? true) {
      isRememberPassword.value =
          SpUtil.getBool("isRememberPassword", defValue: true) ?? true;
    } else {
      isRememberPassword.value = SpUtil.getBool("isRememberPassword") ?? false;
    }
    initSpTextData();
    initInputFocusNode();

    loginListener = eventBus.on<LoginModuleEvent>().listen((event) {
      if (isLoginPage.value == false) {
        if (Invitation.isGoodInvitationCode(Store.invitationCode.value)) {
          agentCodeController.text = Store.invitationCode.value;
        }
        verifySignUpPage();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    if (isAppFirstLaunch && !kDebugMode) {
      UpdateUtil.checkUpdateVersion();
    }

    ///WelcomeManager.getConfigStartPagePost();
    LoginX.instance.loginCallback?.WelcomeManager_getConfigStartPagePost();
    initSupportPhoneCode();
  }

  void initInputFocusNode() {
    focusNodeSingInUsername.addListener(() {
      changeUserNameEnableClean();
    });
    focusNodeSingInPassword.addListener(() {
      changePassWordEnableClean();
    });
    focusNodeSingUpUsername.addListener(() {
      changeRegUsernameEnableClean();
    });
    focusNodeSingUpPassword.addListener(() {
      changeRegPasswordEnableClean();
    });
    focusNodeSingUpRptPassword.addListener(() {
      changeRegRptPasswordEnableClean();
    });
    focusNodeAgentCode.addListener(() {
      changeAgentCodeEnableClean();
    });
  }

  ///初始化页面数据
  void initSpTextData() {
    String userNameSp = SpUtil.getString("userName") ?? '';
    String passwordSp = SpUtil.getString("userPassword") ?? '';
    // 暂时去掉AES
    // try {
    //   //为了兼容之前base64存储的密码，尝试aes解密，如果不成功那么还按base64处理
    //   String passwordSpDecrypted=Tools.decryptAes(passwordSp);
    //   if(passwordSpDecrypted.isNotEmpty){
    //     passwordSp=passwordSpDecrypted;
    //   }
    // } catch (e) {
    //   print("aes解密失败");
    // }
    singInUsernameController.text = userNameSp;
    if (singInUsernameController.text.isNotEmpty &&
        passwordSp.isNotEmpty &&
        isRememberPassword.value) {
      if (Tools.isBase64Encrypted(passwordSp)) {
        signInPasswordController.text = Tools.base64Decode(passwordSp);
      } else {
        signInPasswordController.text = "";
      }
    }
    String userName = singInUsernameController.text;
    String password = signInPasswordController.text;

    if (isRememberPassword.value) {
      isBlindmanMode.value = password.isEmpty;
    } else {
      isBlindmanMode.value = false;
    }
    buttonIsOk.value = userName.isNotEmpty && password.isNotEmpty;
  }

  ///获取渠道码
  // void getInvitationData() async {
  //   try {
  //     String obCode = 'obcode';
  //     String inviteCode = 'inviteCode';
  //     final channelData = await Clipboard.getData(Clipboard.kTextPlain);
  //     if (channelData != null && channelData.text != null) {
  //       List<String> channel = channelData.text!.split('&');
  //       channel.forEach((e) {
  //         if (e.startsWith(obCode)) {
  //           getCode(e, obCode);
  //         } else if (e.contains('i_code')) {
  //           getCode(e, obCode);
  //         } else if (e.startsWith(inviteCode)) {
  //           getInviteCode(e, inviteCode);
  //         }
  //       });
  //     }
  //   } catch (_) {
  //     invitationCode = '';
  //     registerReference = '';
  //     friendInvitationCode = '';
  //   }
  // }
  //
  // void getCode(String channelData, String obCode) {
  //   registerReference = ''; //暂时传空来源，目前取不到
  //   final codeData = channelData.split("=");
  //   if (codeData.length >= 2) {
  //     invitationCode = codeData[1];
  //   }
  // }
  //
  // void getInviteCode(String channelData, String inviteCode) {
  //   final codeData = channelData.split("=");
  //   if (codeData.length >= 2) {
  //     friendInvitationCode = codeData[1];
  //   }
  // }

  ///开启用户清除
  void changeUserNameEnableClean() {
    if (singInUsernameController.text.isNotEmpty &&
        focusNodeSingInUsername.hasFocus) {
      isUsernameEnableClean.value = true;
    } else {
      isUsernameEnableClean.value = false;
    }
  }

  ///开启密码清除
  void changePassWordEnableClean() {
    if (signInPasswordController.text.isNotEmpty &&
        focusNodeSingInPassword.hasFocus) {
      isPasswordEnableClean.value = true;
    } else {
      isPasswordEnableClean.value = false;
    }
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

  void cleanUsername() {
    singInUsernameController.clear();
    errorTextUsername.value = "";
    isUsernameEnableClean.value = false;
    buttonIsOk.value = false;
  }

  void cleanPassword() {
    signInPasswordController.clear();
    errorTextPassword.value = "";
    isPasswordEnableClean.value = false;
    isBlindmanMode.value = false;
    buttonIsOk.value = false;
  }

  void cleanRegUsername() {
    signUpUsernameController.clear();
    errorTextUsername.value = "";
    isRegUsernameEnableClean.value = false;
    buttonIsOk.value = false;
  }

  void cleanRegPassword() {
    signUpPasswordController.clear();
    errorTextPassword.value = "";
    isRegPasswordEnableClean.value = false;
    buttonIsOk.value = false;
  }

  void cleanRegRptPassword() {
    signUpPasswordRepeatController.clear();
    errorTextPassword2.value = "";
    isRegRptPasswordEnableClean.value = false;
    buttonIsOk.value = false;
  }

  void cleanAgentCode() {
    agentCodeController.clear();
    errorTextAgentcode.value = "";
    isAgentCodeEnableClean.value = false;
  }

  ///登录 密码显示开关
  void changePassword() {
    isPassword.value = !isPassword.value;
  }

  ///注册 密码显示开关
  void changeRegPassword() {
    isRegPassword.value = !isRegPassword.value;
  }

  ///注册 重复密码显示开关
  void changeRegRepeatPassword() {
    isRegRepeatPassword.value = !isRegRepeatPassword.value;
  }

  ///是否记住密码
  void changeRememberPassword(bool value) {
    isRememberPassword.value = value;
    SpUtil.putBool("isRememberPassword", isRememberPassword.value);
    SpUtil.putString("isRemember", "isRememberSet");
    changePassWordEnableClean();
  }

  void removeUser(int index) {
    String userNameSp = SpUtil.getString("userName") ?? '';
    UIToggleItemUser itemUser = userLists[index];
    if (userNameSp == itemUser.username) {
      singInUsernameController.clear();
      signInPasswordController.clear();
      isUsernameEnableClean.value = false;
    }
    removeSpUser(index);
    if (userLists.length == 1) {
      chooseUser(0);
    }
    update();
  }

  void chooseUser(int index) {
    UIToggleItemUser itemUser = userLists[index];
    singInUsernameController.text = itemUser.username;
    String passwordSp = itemUser.password;
    // 暂时去掉AES
    // try {
    //   //为了兼容之前base64存储的密码，尝试aes解密，如果不成功那么还按base64处理
    //   String passwordSpDecrypted=Tools.decryptAes(passwordSp);
    //   if(passwordSpDecrypted.isNotEmpty){
    //     passwordSp=passwordSpDecrypted;
    //   }
    // } catch (e) {
    //   print("aes解密失败");
    // }
    if (itemUser.isRemember) {
      signInPasswordController.text = Tools.base64Decode(passwordSp);
    } else {
      signInPasswordController.clear();
    }
    if (isRememberPassword.value) {
      isBlindmanMode.value = signInPasswordController.text.isEmpty;
    } else {
      isBlindmanMode.value = false;
    }
    clearAllErrorText();
    isPassword.value = false;
    isPasswordEnableClean.value = false;
    buttonIsOk.value = singInUsernameController.text.isNotEmpty &&
        signInPasswordController.text.isNotEmpty;
    update();
  }

  ///是否同意注册协议
  void changeRegisterProtocol() {
    isRegisterProtocol.value = !isRegisterProtocol.value;

    //合营码可以不传但是传了需要正确
    if (!agentCodeController.text.isEmpty) {
      if (!Invitation.isGoodInvitationCode(agentCodeController.text) &&
          !Invitation.isGoodInvitationCode(Store.invitationCode.value)) {
        return;
      }
    }
    if (errorTextUsername.value.isEmpty &&
        errorTextPassword.value.isEmpty &&
        errorTextAgentcode.value.isEmpty &&
        signUpUsernameController.text.isNotEmpty &&
        signUpPasswordController.text.isNotEmpty)
      buttonIsOk.value = isRegisterProtocol.value;
  }

  //把所有错误提示清楚
  void clearAllErrorText() {
    errorTextUsername.value = "";
    errorTextPassword.value = "";
    errorTextPassword2.value = "";
    errorTextAgentcode.value = "";
  }

  ///登录注册切换
  void changeIsLoginPage() {
    hideKeyboard();
    //登录 注册切换
    isLoginPage.value = !isLoginPage.value;
    //登录 重制显示密码状态
    isPassword.value = false;
    //注册 重制是否显示重复密码状态
    isRegPassword.value = false;
    isRegRepeatPassword.value = false;
    //注册 清空
    signUpPasswordRepeatController.clear();
    signUpUsernameController.clear();
    signUpPasswordController.clear();
    buttonIsOk.value = false;
    clearAllErrorText();

    //登录 记住密码
    if (isLoginPage.value) {
      isBlindmanMode.value = signInPasswordController.text.isEmpty;
      if (signInPasswordController.text.isNotEmpty) {
        changeTextUsernameAndPassword('');
      }
      if (singInUsernameController.text.isEmpty) {
        signInPasswordController.clear();
      }
    } else {
      isBlindmanMode.value = false;
      if (singInUsernameController.text.isEmpty) {
        signInPasswordController.clear();
      }
    }
  }

  void goResetPasswordPage() async {
    String passWord = await Get.toNamed(
      AppRoutes.RESET_PASSWORD,
      arguments: ResetInfo(
        singInUsernameController.text,
        signInPasswordController.text,
      ),
    );
    if (passWord.isNotEmpty) {
      signInPasswordController.text = passWord;
      sendLogin();
    }
  }

  ///发送登录请求
  void sendLogin() {
    if (buttonIsOk.value) {
      if (singInUsernameController.text == "") {
        errorTextUsername.value = 'plz_enter_account'.tr;
        return;
      }
      if (signInPasswordController.text == "") {
        errorTextPassword.value = 'plz_enter_password'.tr;
        return;
      }
      hideKeyboard();
      if (isRememberPassword.value) {
        SpUtil.putString(
            "userName", singInUsernameController.text.toLowerCase());
        SpUtil.putString(
            "userPassword", Tools.base64Encode(signInPasswordController.text)
            //Tools.encryptAes(Tools.base64Encode(signInPasswordController.text)),
            );
      } else {
        SpUtil.putString(
            "userName", singInUsernameController.text.toLowerCase());
        SpUtil.putString("userPassword", "");
      }
      //发送登录请求
      postUserLogin(
        singInUsernameController.text,
        signInPasswordController.text,
      );
    }
  }

  Future<void> _configGetProxyCodePost() async {
    await runCatch(() async {
      final res = await loginRepository.configGetProxyCodePost(
        '352B371A25809D9490CBAFD885B565C1',
      );
    }, onError: (e) {});
  }

  ///发送试玩登录请求
  Future<void> sendTryPlayLogin() async {
    try {
      if (CoolDownManager.handler(
          key: 'kCoolDownTryPlayLogin', duration: 1000)) {
        hideKeyboard();
        showLoading();
        final res = await repository.postUserTryMemberLogin();
        onSignInSuccess(
          res.memberInfo.userName,
          res.memberInfo,
          res.token,
          onWarnText: (error) {
            errorTextUsername.value = error;
          },
          onComplete: (userInfo) {
            clearAllErrorText();
            gotoHomePage();
          },
        );
      }
    } on Map catch (e) {
      onSignInFail(e['code'], e['message'], '', 'login_trial_users'.tr);
    }
  }

  ///手势与密码共用请求
  Future<void> postUserLogin(String username, String password) async {
    try {
      if (CoolDownManager.handler(key: 'kCoolDownLogin', duration: 1000)) {
        showLoading();
        final res = await signApi.login(
          LoginParam(
            deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
            loginReference: 'loginReference',
            userName: username,
            userPwd: Tools.generateMd5(password),
          ),
        );
        //final res = await repository.postUserLogin(username, password);
        onSignInSuccess(
          res.memberInfo.userName,
          res.memberInfo,
          res.token,
          onWarnText: (error) {
            errorTextUsername.value = error;
          },
          onSaveData: () {
            //修改问题：如果没有记住密码，手势密码无法登录
            if (signInPasswordController.text.isNotEmpty) {
              SpUtil.putString(
                "gesture_user_password",
                Tools.base64Encode(password),
              );
            }
            SpUtil.putString(
                "m_userName", singInUsernameController.text.toLowerCase());
          },
          onComplete: (userInfo) {
            errorTextUsername.value = '';
            checkSpAccount(
              res.memberInfo.id,
              username,
              password,
              res.token,
              userAvatarUrl: userInfo!.avatarUrl ?? '',
              isRemember: isRememberPassword.value,
            );
            Store.userPassword =
                Tools.base64Encode(signInPasswordController.text);
            gotoHomePage();
          },
        );
      }
    } on ServerException catch (e) {
      onSignInFail(e.code, e.message, username, password, onFailError: (error) {
        if (e.code != 503) {
          //{"code":100047,"msg":"合营码无效，请确认后重新提交","data":null}
          //合营码无效的时候 让用户手动输入合营码
          if (e.code == 100047 || e.code == 100049 || e.code == 100046) {
            Store.invitationCode.value = '';
          }
          if (e.code != 333333) {
            errorTextUsername.value = error.toString();
          }
        }
        if (e.code == 333333) {
          goResetPasswordPage();
        }
      });
    } catch (e) {
      try {
        String message = (e as dynamic).error.message;
        int code = (e as dynamic).error.code;
        onSignInFail(code, message, username, password, onFailError: (error) {
          if (code != 503) {
            //{"code":100047,"msg":"合营码无效，请确认后重新提交","data":null}
            //合营码无效的时候 让用户手动输入合营码
            if (code == 100047 || code == 100049 || code == 100046) {
              Store.invitationCode.value = '';
            }
            if (code != 333333) {
              errorTextUsername.value = error.toString();
            }
          }
          if (code == 333333) {
            goResetPasswordPage();
          }
        });
      } catch (e) {}
      print(e.toString());
    }
  }

  /// 三方:1 facebook ; 2 zalo
  Future<void> postUserThirdSdk(int platformType) async {
    switch (platformType) {
      case 1:
        try {
          final vendorRes =
              await VendorAuth.instance.login(VendorPlatform.facebook);
          final httpRes = await signApi.thirdPartyLoginSdk(
              ThirdPartyLoginSdkParam(
                  deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
                  thirdPlatformId: vendorRes.userId,
                  thirdType: '2'));
          if (httpRes.flag) {
            onSignInSuccess(
              httpRes.memberVO.memberInfo.userName,
              httpRes.memberVO.memberInfo,
              httpRes.memberVO.token,
              onComplete: (user) {
                gotoHomePage();
              },
            );
          } else {
            Get.toNamed(
              AppRoutes.THIRD_PARTY,
              arguments: {
                "platform": "1",
                "platformId": httpRes.thirdPlatformId
              },
            );
          }
        } on VendorAuthException catch (e) {
          showToast('auth_failed'.tr);
        } on Map catch (e) {
          // TODO 异常找回需要用户名和密码 暂时给了空字符串
          onSignInFail(e['code'], e['message'], '', '', onFailError: (error) {
            if (e['code'] != 503) {
              //{"code":100047,"msg":"合营码无效，请确认后重新提交","data":null}
              //合营码无效的时候 让用户手动输入合营码
              if (e['code'] == 100047 ||
                  e['code'] == 100049 ||
                  e['code'] == 100046) {
                Store.invitationCode.value = '';
              }
              if (e['code'] != 333333) {
                errorTextUsername.value = error.toString();
              }
            }
            if (e['code'] == 333333) {
              goResetPasswordPage();
            }
          });
        } catch (e) {
          // TODO h5 日记 后面查询
          print(e.toString());
        }
        break;
      case 2:
        try {
          final vendorRes =
              await VendorAuth.instance.login(VendorPlatform.zalo);
          final httpRes = await signApi.thirdPartyLoginSdk(
              ThirdPartyLoginSdkParam(
                  deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
                  thirdPlatformId: vendorRes.userId,
                  thirdType: '2'));
          if (httpRes.flag) {
            onSignInSuccess(
              httpRes.memberVO.memberInfo.userName,
              httpRes.memberVO.memberInfo,
              httpRes.memberVO.token,
              onComplete: (user) {
                gotoHomePage();
              },
            );
          } else {
            Get.toNamed(
              AppRoutes.THIRD_PARTY,
              arguments: {
                "platform": "2",
                "platformId": httpRes.thirdPlatformId
              },
            );
          }
        } on VendorAuthException catch (e) {
          showToast('auth_failed'.tr);
        } on Map catch (e) {
          // TODO 异常找回需要用户名和密码 暂时给了空字符串
          onSignInFail(e['code'], e['message'], '', '', onFailError: (error) {
            if (e['code'] != 503) {
              //{"code":100047,"msg":"合营码无效，请确认后重新提交","data":null}
              //合营码无效的时候 让用户手动输入合营码
              if (e['code'] == 100047 ||
                  e['code'] == 100049 ||
                  e['code'] == 100046) {
                Store.invitationCode.value = '';
              }
              if (e['code'] != 333333) {
                errorTextUsername.value = error.toString();
              }
            }
            if (e['code'] == 333333) {
              goResetPasswordPage();
            }
          });
        } catch (e) {
          // TODO h5 日记 后面查询
          print(e.toString());
        }
        break;
    }
  }

  ///输入信息 验证
  void changeTextUsernameAndPassword(String text) {
    if (isLoginPage.value) {
      verifyLoginPage();
    } else {
      verifySignUpPage();
    }
  }

  ///注册 输入信息 验证
  void verifySignUpPage() {
    changeRegUsernameEnableClean();
    changeRegPasswordEnableClean();
    changeRegRptPasswordEnableClean();
    changeAgentCodeEnableClean();
    bool userNameLength = signUpUsernameController.text.isNotEmpty;
    bool passWordLength = signUpPasswordController.text.isNotEmpty;
    bool agentCodeLength = agentCodeController.text.isNotEmpty;
    bool userNameReg = usnRegExp.hasMatch(signUpUsernameController.text);
    bool passWordReg = psdRegExp.hasMatch(signUpPasswordController.text);

    bool userNameFirst = false;
    if (userNameLength) {
      String letters = signUpUsernameController.text.substring(0, 1);
      userNameFirst = usnRegFirstExp.hasMatch(letters);
    }

    if (!userNameFirst) {
      errorTextUsername.value = "find_please_enter_a_username_letters_first".tr;
      buttonIsOk.value = false;
      return;
    } else if (!userNameReg) {
      errorTextUsername.value =
          "find_please_enter_a_username_letters_and_numbers_2".tr;
      buttonIsOk.value = false;
      return;
    } else if (!userNameReg && userNameLength) {
      errorTextUsername.value =
          "find_please_enter_a_username_letters_and_numbers".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (!userNameLength) {
        errorTextUsername.value =
            "find_please_enter_a_username_letters_and_numbers".tr;
        buttonIsOk.value = false;
        return;
      } else if (userNameReg) {
        //检测字符是否报包含数字
        errorTextUsername.value = "";
      }
    }
    if (!passWordReg && passWordLength) {
      errorTextPassword.value =
          "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
      buttonIsOk.value = false;
      return;
    } else {
      if (!passWordLength && userNameReg) {
        errorTextPassword.value =
            "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
        buttonIsOk.value = false;
        return;
      } else if (passWordReg && userNameReg) {
        errorTextPassword.value = "";
      }
    }

    if (agentCodeController.text.isNotEmpty) {
      if (!Invitation.isGoodInvitationCode(agentCodeController.text) &&
          !Invitation.isGoodInvitationCode(Store.invitationCode.value)) {
        if (agentCodeLength) {
          errorTextAgentcode.value = 'plz_enter_seven_number'.tr;
        } else {
          errorTextAgentcode.value = "";
        }
        buttonIsOk.value = false;
        return;
      }
      if (errorTextAgentcode.value.isNotEmpty && Invitation.isGoodInvitationCode(agentCodeController.text)) {
        errorTextAgentcode.value = "";
      }
    } else {
      errorTextAgentcode.value = "";
    }

    if (userNameReg && passWordReg && isRegisterProtocol.value) {
      clearAllErrorText();
      buttonIsOk.value = true;
    } else {
      if (!userNameLength && !passWordLength) {
        clearAllErrorText();
        buttonIsOk.value = false;
        return;
      }
    }
  }

  ///登录 输入信息 验证
  void verifyLoginPage() {
    changeUserNameEnableClean();
    changePassWordEnableClean();
    //账号密码清空
    if (singInUsernameController.text.isEmpty &&
        signInPasswordController.text.isEmpty) {
      clearAllErrorText();
    }
    //手动清空密码显示 密码眼睛
    if (signInPasswordController.text.isEmpty) {
      isBlindmanMode.value = false;
    }
    bool userNameLength = singInUsernameController.text.isNotEmpty;
    bool passWordLength = signInPasswordController.text.isNotEmpty;
    bool username = usnRegExp.hasMatch(singInUsernameController.text);
    bool password = psdRegExp.hasMatch(signInPasswordController.text);
    if (!username && (singInUsernameController.text.isNotEmpty)) {
      errorTextUsername.value =
          "find_please_enter_a_username_letters_and_numbers".tr;
    } else {
      errorTextUsername.value = "";
    }

    if (!password && (signInPasswordController.text.isNotEmpty)) {
      errorTextPassword.value =
          "find_please_enter_passworda_combination_of_letters_and_numbers".tr;
    } else {
      errorTextPassword.value = "";
    }
    //登陆
    if (username && password) {
      clearAllErrorText();
      buttonIsOk.value = true;
    } else {
      buttonIsOk.value = false;
    }
  }

  ///注册 触发图开形验证码，step one
  void signUpStepOneCheck() {
    if (buttonIsOk.value) {
      if (signUpUsernameController.text == "") {
        errorTextPassword.value = "login_registration_failed_empty_account".tr;
        return;
      }
      if (signUpPasswordController.text == "") {
        errorTextUsername.value = "login_registration_failed_empty_password".tr;
        return;
      }
      signUpStepTwoShowCaptcha();
    }
  }

  ///注册 图开形验证码 组件 step two
  Future<void> signUpStepTwoShowCaptcha() async {
    //await VideoManager.instance.safePause();
    isCaptchaVisible.value = true;
  }

  Future<void> hideCaptcha() async {
    isCaptchaVisible.value = false;
    //await VideoManager.instance.safeStart();
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
      errorTextUsername.value = e['message'].toString();
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

      final res = await signApi.register(RegisterParam(
        deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
        invitationCode: invitationCode,
        userName: signUpUsernameController.text,
        userPwd: Tools.generateMd5(signUpPasswordController.text),
      ));
      clearAllErrorText();
      showToast("login_registration_success".tr);
      hideKeyboard(); // 这个位置不能变  fix: OB-5166【兼容-注册】Android_APP在注册的滑动模块页面停留30秒，APP出现卡死并且闪退
      onSignInSuccess(
        res.memberInfo.userName,
        res.memberInfo,
        res.token,
        isFromLogin: false,
        onWarnText: (error) {
          errorTextUsername.value = error.toString();
        },
        onSaveData: () {
          //修改问题：如果没有记住密码，手势密码无法登录
          if (signInPasswordController.text.isNotEmpty) {
            SpUtil.putString(
              "gesture_user_password",
              Tools.base64Encode(signUpPasswordController.text),
            );
          }
          SpUtil.putString(
              "m_userName", signUpUsernameController.text.toLowerCase());
          SpUtil.putString(
              "userName", signUpUsernameController.text.toLowerCase());
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
          clearAllErrorText();
          checkSpAccount(
            res.memberInfo.id,
            signUpUsernameController.text,
            signUpPasswordController.text,
            res.token,
            userAvatarUrl: userInfo!.avatarUrl ?? '',
            isRemember: isRememberPassword.value,
          );
          Store.userPassword =
              Tools.base64Encode(signUpPasswordController.text);
          Invitation.updateInvitationCode(invitationCode);
          gotoHomePage();
        },
      );
    } on DioError catch (e) {
      try {
        final serviceException = e.error as ServerException;
        if (serviceException.code != 503) {
          if (serviceException.code == 100047 ||
              serviceException.code == 100049 ||
              serviceException.code == 100046) {
            Store.invitationCode.value = '';
            verifySignUpPage();
          }
          if (serviceException.code != 333333) {
            errorTextUsername.value = serviceException.message;
          }
        }
      } catch (e) {
        print(e);
      }
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
    }
  }

  @override
  void onClose() {
    focusNodeSingInUsername.dispose();
    focusNodeSingInPassword.dispose();
    singInUsernameController.dispose();
    signInPasswordController.dispose();
    signUpPasswordRepeatController.dispose();
    signUpUsernameController.dispose();
    signUpPasswordController.dispose();
    menuController.dispose();
    focusNodeAgentCode.dispose();
    agentCodeController.dispose();

    obRemoveListenerDeInit?.call();
    loginListener?.cancel();
    isAppFirstLaunch = false;
    super.onClose();
  }
}
