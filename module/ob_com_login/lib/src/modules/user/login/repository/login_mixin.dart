import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:models/models.dart';

import 'package:ob_com_login/src/login_x.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/repository/ui_toggle_item_user.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:repository/utils/net.dart';
import 'package:repository/utils/sqlite_service.dart';
import 'package:sp_util/sp_util.dart';

import 'login_repository.dart';

typedef OnFailCallback = void Function(String txt);
typedef OnFinallyCallback = void Function(UiUser? userInfo);

List<UIToggleItemUser> synchronousUser = <UIToggleItemUser>[];

void onUpdataUserData(String username, {String? userAvatarUrl}) {
  synchronousUser.forEach((e) {
    if (e.username == username) {
      e.userAvatarUrl = userAvatarUrl ?? e.userAvatarUrl;
    }
  });
  String userInfo = json.encode(synchronousUser);
  CacheUtil.saveAll('user_toggle', userInfo);
}

mixin LoginMixin on GetxController {
  final loginRepository = Get.find<LoginRepository>();
  RxList<UIToggleItemUser> userLists = <UIToggleItemUser>[].obs;
  final numberRegExp =
      RegExp(r'^(\\+\\d{2}-)?(\\d{2,3}-)?([1][3,4,5,7,8][0-9]\\d{8})$');

  ///默认调用
  VoidCallback defaultCall = () {};

  ///初始化Sp账号
  void initSpAccount() {
    try {
      String userJson = CacheUtil.getAll('user_toggle');
      List jsons = json.decode(userJson);
      userLists.value = jsons.map((e) => UIToggleItemUser.fromJson(e)).toList();
      synchronousUser = userLists;
    } catch (_) {
      //测试 addCurrentUser();
    }
  }

//670994086843080780
  ///取出sp记录过登录的用户信息
  bool checkSpAccount(String id, String username, String password, String token,
      {bool isRemember = false, String userAvatarUrl = ""}) {
    int isUserExist = userLists.indexWhere((e) => e.id == id);
    if (isUserExist >= 0 && isUserExist < userLists.length) {
      userLists.removeAt(isUserExist);
    }
    userLists.add(UIToggleItemUser(
      id: id,
      username: username,
      password: password.isNotEmpty ? Tools.base64Encode(password) : '',
      isCurrentLogin: true,
      userAvatarUrl: userAvatarUrl,
      isRemember: isRemember,
    ));
    if (userLists.length > 6) {
      userLists.removeAt(0);
    }
    updateAccountStatus(
      username,
      password: password,
      token: token,
      isRemember: isRemember,
      userAvatarUrl: userAvatarUrl,
    );
    return isUserExist == -1;
  }

  void updateAccountStatus(
    username, {
    String? token,
    String? password,
    bool? isRemember,
    String? userAvatarUrl,
  }) {
    for (var e in userLists) {
      if (e.username.toLowerCase() == username.toString().toLowerCase()) {
        e.password = password != null
            ? Tools.base64Encode(password)
            : e.password; //Tools.encryptAes(Tools.base64Encode(password))
        e.token = token ?? e.token;
        e.isRemember = isRemember ?? e.isRemember;
        e.userAvatarUrl = userAvatarUrl ?? e.userAvatarUrl;
        e.isCurrentLogin = true;
      } else {
        e.isCurrentLogin = false;
      }
    }
    synchronousUser = userLists;
    String userInfo = json.encode(userLists);
    CacheUtil.saveAll('user_toggle', userInfo);
  }

  void removeSpUser(int index) {
    UIToggleItemUser itemUser = userLists[index];
    if (itemUser.isCurrentLogin) {
      SpUtil.putString("userName", "");
      SpUtil.putString("userPassword", "");
    }
    userLists.removeAt(index);
    synchronousUser = userLists;
    String userInfo = json.encode(userLists);
    CacheUtil.saveAll('user_toggle', userInfo);
  }

  ///登录与注册成功后共用下分处理逻辑
  Future<void> onSignInSuccess(
    String userName,
    var memberInfo,
    String token, {
    ValueChanged<String>? onWarnText,
    VoidCallback? onSaveData,
    OnFinallyCallback? onComplete,
    bool isFromLogin = true,
    bool isFromToggle = false,
  }) async {
    UiUser? uiUserInfo;
    try {
      if (token.isEmpty) {
        onWarnText != null
            ? onWarnText("failed_to_get_token".tr)
            : defaultCall();
        LoginX.instance.loginCallback
            ?.onObLoginFailed(0, "failed_to_get_token".tr);
        return;
      }
      if (!isFromLogin) {
        showLoading();
      }
      LoginX.instance.loginCallback?.onObLoginSuccess(token);

      /// Sentry / Net / NetCache 放前面顺序不要动
      await SpUtil.putString("userid", '${memberInfo.id}');
      await SpUtil.putString("token", token);
      await SpUtil.putBool("isRenewPassword", false);
      // Sentry.configureScope(
      //   (scope) {
      //     scope.setUser(SentryUser(
      //       username: userName,
      //       id: SpUtil.getString("sentryId", defValue: ""),
      //     ));
      //   },
      // );
      Net().setHeader = {"X-Request-Token": token}; //新增一个token头添加
      NetCache.userid = memberInfo.id; //用来区分 多用户缓存 不要删-todd

      /// 更新用户信息
      bool isAutoTransferOpen = memberInfo.noTransfer == 1;
      //bool isTryPlay = memberInfo.accountType == 1;
      bool isTryPlay = false; //包网没有试玩

      uiUserInfo = UiUser(
        '${memberInfo.id}',
        memberInfo.userName,
        isAutoTransferOpen,
        memberInfo.email,
        memberInfo.mobile,
        memberInfo.birthday,
        //这里原来是memberInfo.birth，但是接口没有返回这个字段了
        memberInfo.birthday,
        memberInfo.realName,
        memberInfo.topImagesUrl,
        '${memberInfo.gender}',
        '${memberInfo.merchantId}',
        '',
        //这里原来是memberInfo.vipSerialNum，但是接口没有返回这个字段了
        memberInfo.totalWithdrawNum,
        isTryPlay,
      );

      Get.find<AuthService>().updateAuthState(
        LoggedIn(uiUserInfo), /*试玩=1*/
      );

      if (!isTryPlay) {
        onSaveData != null ? onSaveData() : defaultCall();
        //登录成功 设置代理密码校验弹窗
        ///AgentTools.resetAgentPayPasswordKey();
        LoginX.instance.loginCallback?.AgentTools_resetAgentPayPasswordKey();
      }
    } catch (e) {
      // showError(e.toString());
    } finally {
      Store.isLogin.value = true;

      ///HomeGameManager.instance.refreshAllData();
      LoginX.instance.loginCallback?.HomeGameManager_refreshAllData();
      initClientConfig();
      initActivityType();
      initHelpAllInfo();
      initCountry();

      if (isFromToggle) {
        Bus.instance.fire(RxEvent.refreshHomeModule);
      }
      dismissLoading();
      onComplete != null ? onComplete(uiUserInfo) : defaultCall();
    }
  }

  ///ip异常的处理 DIFFERENT_IP(42110, "登录IP不是常用IP，需要手机号码验证"),
  void onSignInFail(
    int code,
    String message,
    String username,
    String password, {
    OnFailCallback? onFailError,
  }) {
    LoginX.instance.loginCallback?.onObLoginFailed(code, message);

    dismissLoading();
    if (code == 42110) {
      Map<String, String> paras = {
        "phoneNum": message,
        "userName": username,
        "password": password,
      };
      Get.toNamed(AppRoutes.LOGIN_ERROE, arguments: paras);
    } else if (code == 403) {
      showToast(message);
    } else if (code == 999) {
      onFailError != null ? onFailError("") : defaultCall();
      if (!OBDialogUtil.isShowing) {
        OBDialogUtil.isShowing = true;
        OBDialogUtil.show(
          ObaseDialog.alert(
              title: 'alert'.tr,
              content: message,
              confirmText: 'confirm'.tr,
              onConfirmListener: () {
                Get.back();
              },
              cancelText: "cancel".tr),
        ).whenComplete(() {
          OBDialogUtil.isShowing = false;
        });
      }
    } else {
      onFailError != null ? onFailError(message) : defaultCall();
    }
  }

  void initClientConfig() {
    LoginX.instance.loginCallback?.initClientConfig();
  }

  void initActivityType() {
    // runCatch(() async {
    //   Store.activityTypes = await loginRepository.getActivityType();
    // }, onError: (_) async {
    //   Store.activityTypes = await loginRepository.getActivityType();
    // });

    ///LoginX.instance.loginCallback?.initActivityType();
  }

  void initHelpAllInfo() {
    LoginX.instance.loginCallback?.initHelpAllInfo();
  }

  void initCountry() {
    // runCatch(() async {
    //   String abridge = await loginRepository.getCountryName();
    //   Store.isBaimhWithdraw = !['CN'].contains(abridge);
    // }, onError: (_) async {
    //   try {
    //     String abridge = await loginRepository.getCountryName();
    //     Store.isBaimhWithdraw = !['CN'].contains(abridge);
    //   } catch (_) {}
    // });
  }

  ///跳转首页面处理
  void gotoHomePage() {
    LoginX.instance.loginCallback?.gotoHomePage();
  }

  ///跳转我的页面处理
  void gotoMinePage() {
    LoginX.instance.loginCallback?.gotoMinePage();
  }

  void initSupportPhoneCode() {
    runCatch(() async {
      final resps = await loginRepository.getSupportPhoneCode();
      List<CommonDict> resp = (jsonDecode(resps) as List)
          .map((e) => CommonDict.fromJson(e))
          .toList();
      Store.callingCode = resp
          .map((e) => UiCallingCode(e.code.toString(), e.code.toString(),
              e.code.toString(), e.len ?? []))
          .toList();
    }, onError: (e) async {
      final resps = await loginRepository.getSupportPhoneCode();
      List<CommonDict> resp = (jsonDecode(resps) as List)
          .map((e) => CommonDict.fromJson(e))
          .toList();
      Store.callingCode = resp
          .map((e) => UiCallingCode(e.code.toString(), e.code.toString(),
              e.code.toString(), e.len ?? []))
          .toList();
    });
  }
}
