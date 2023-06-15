import 'dart:async';

import 'package:get/get.dart';
import 'package:params/params.dart';
import 'package:sign/sign.dart';

class UpdatePasswordRepository {
  final signApi = Get.find<SignApi>();

  /// [newPassword] 新密码
  /// [password] 旧密码
  Future<void> postUpdatePassword(
      String newPassword, String password, String confirmPassword) {
    try {
      return signApi.updatePassword(EditPasswordParam(
        newPassword: newPassword,
        password: password,
        confirmPassword: confirmPassword,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }
}
