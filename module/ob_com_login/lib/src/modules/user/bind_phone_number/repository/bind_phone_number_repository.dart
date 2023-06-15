import 'dart:async';

import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:params/params.dart';
import 'package:user/user.dart';

class BindPhoneNumberRepository {
  final commonApi = Get.find<CommonApi>();
  final userApi = Get.find<UserApi>();

  Future<bool> postSendVerifyCode(String mobile) async {
    try {
      return commonApi.sendCodeWithPhone(
        PhoneParam(phone: mobile),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> postConfirmVerifyCode(String mobile, String v) {
    try {
      return userApi.phoneBinding(
        UserPhoneParam(phone: mobile, v: v),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}
