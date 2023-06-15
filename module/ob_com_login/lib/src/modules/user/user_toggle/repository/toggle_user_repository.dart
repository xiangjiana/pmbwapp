import 'dart:async';

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:user/user.dart';
class UserToggleRepository {

  final userApi = Get.find<UserApi>();

  Future<MemberInfo> getUserInfo() async {
    MemberInfo res = await Get.find<UserApi>().info();
    return res;
  }

  Future<MemberInfoAll> getMemberMemberInfoAll() {
    try {
      return userApi.infoAll();
    } catch (e) {
      return Future.error(e);
    }
  }
}
