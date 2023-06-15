import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:models/models.dart';
import 'package:user/user.dart';
class TransferRepository {

  Future<MemberInfo> getUserMemberInfo({String id = ''}) async {
    MemberInfo res = await Get.find<UserApi>().info();
    return res;
  }
}
