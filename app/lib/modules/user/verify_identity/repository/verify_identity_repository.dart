import 'dart:async';

import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:params/params.dart';
import 'package:sign/sign.dart';

class VerifyIdentityRepository {
  final commonApi = Get.find<CommonApi>();
  final signApi = Get.find<SignApi>();

  Future<void> postSendPhoneCode(String phone) {
    try {
      return commonApi.sendCodeWithPhone(
        PhoneParam(
          phone: phone,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> postConfirmVerified(
    int sendType,
    String userName,
    String verifyCode,
  ) {
    try {
      return signApi.isVerified(
        VerificationCodeParam(
          sendType: sendType,
          userName: userName,
          verifica: verifyCode,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}
