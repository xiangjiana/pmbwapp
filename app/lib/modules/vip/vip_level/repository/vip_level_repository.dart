import 'dart:async';

import 'package:capital/capital.dart';
import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:main/main.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:user/user.dart';
import 'package:vip/vip.dart';

class VipLevelRepository {
  final vipApis = Get.find<VipApi>();
  final userApi = Get.find<UserApi>();
  final commonApi = Get.find<CommonApi>();
  final mainApi = Get.find<MainApi>();
  final capitalApi = Get.find<CapitalApi>();

  Future<MemberVipListResp> getUserApiSelectVipInfo(String userName) async {
    final completer = Completer<MemberVipListResp>();
    await vipApis
        .selectVipInfo(VipParam(username: userName))
        .then((res) => completer.complete(res))
        .catchError((code, msg) => completer.completeError(msg));

    return completer.future;
  }

  Future<VipInfoResp> getUserApiSelectVipLevel(String userName) async {
    final completer = Completer<VipInfoResp>();
    await vipApis
        .selectVipLevel(VipParam(username: userName))
        .then((res) => completer.complete(res))
        .catchError((code, msg) => completer.completeError(msg));
    return completer.future;
  }

  Future<List<MerchantVenueInfo>> getAccountMoneyMerchantGame() async {
    final completer = Completer<List<MerchantVenueInfo>>();
    await mainApi
        .venueByMerchant()
        .then((res) => completer.complete(res))
        .catchError((code, msg) => completer.completeError(msg));

    return completer.future;
  }

  Future<UserAccountBalanceWithBilling> getCenterBalance() async {
    final completer = Completer<UserAccountBalanceWithBilling>();
    await capitalApi
        .balanceWithBilling()
        .then((res) => completer.complete(res))
        .catchError((code, msg) => completer.completeError(msg));
    return completer.future;
  }

  Future<String> commonGetSystemConfigurationValuePost({String key = 'member.venues.next.config'}) async {
    try {
      return commonApi.getSystemConfigurationValue(
        QueryKeyParam(
          key: key,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}
