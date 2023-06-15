import 'dart:async';

import 'package:activity/activity.dart';
import 'package:common/common.dart';
import 'package:config/config.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:params/params.dart';
import 'package:repository/utils/device_type.dart';
import 'package:sign/sign.dart';

class LoginRepository {
  final commonApi = Get.find<CommonApi>();
  final configApi = Get.find<ConfigApi>();
  final signApi = Get.find<SignApi>();
  final activityApi = Get.find<ActivityApi>();


  Future<String> getCountryName() async {
    try {
      return commonApi.getCountryName();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<LoginResp> postUserLogin(String username, String password) {
    try {
      return signApi.login(
        LoginParam(
          deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
          userName: username,
          userPwd: Tools.generateMd5(password),
          loginReference: '',
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<ThirdPlatformMember> postUserThirdLogin(
      String thirdPlatformId, String thirdType) {
    try {
      return signApi.thirdPartyLoginSdk(
        ThirdPartyLoginSdkParam(
          deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
          thirdPlatformId: thirdPlatformId,
          thirdType: thirdType,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<LoginResp> postUserRegister(
    String username,
    String password,
    String registerReference,
    String invitationCode,
    String friendInvitationCode, [
    String? thirdPlatformId,
    String? thirdPlatform,
  ]) {
    try {
      return signApi.register(
        RegisterParam(
          userName: username,
          deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
          userPwd: Tools.generateMd5(password),
          invitationCode: invitationCode,
          thirdType: thirdPlatform,
          thirdPlatformId: thirdPlatformId,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> postGeetestSecondValidate(
    String challenge,
    String seccode,
    String validate,
  ) async {
    try {
      return commonApi.secondValidate(GeetestSecondValidateParam(
        challenge: challenge,
        seccode: seccode,
        validate: validate,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> postGeetestFirstRegister() async {
    try {
      return commonApi.firstRegister();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<LoginResp> postUserTryMemberLogin() async {
    try {
      return signApi.tryMemberLogin(BwTryMemberLoginParam());
    } catch (e) {
      return Future.error(e);
    }
  }

  ///  banner/字典/银行卡列表
  Future<ClientConfigResp> getConfigClientConfigAll() async {
    try {
      return configApi.clientConfigAll(
        ClientConfigParam(
          resourcesType: "0",
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  ///活动标签
  Future<List<ObConfigActivityType>> getActivityType() {
    try {
      return activityApi.activityType();
    } catch (e) {
      return Future.error(e);
    }

  }

  ///教程数据
  Future<HelpResp> getHelpAllInfo() {
    try {
      return configApi.helpAll();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> getSupportPhoneCode() async {
    try {
      return commonApi.getCommonDict();
    } catch (e) {
      return Future.error(e);
    }
  }

  ///获取合营
  Future<String> configGetProxyCodePost(String key) async {
    try {
      return configApi.getProxyCode(
        ProxyCode(var1: key),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}
