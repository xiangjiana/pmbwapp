import 'dart:async';
import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';

import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:repository/utils/sqlite_service.dart';
import 'package:user/user.dart';

class UserController extends GetxController {
  RxString profitAndLoss = "--".obs;
  RxBool isShow = true.obs;
  final authService = Get.find<AuthService>();
  final repository = Get.find<HomeRepository>();

  bool get isAvatarHttpUrl => authService.isAvatarHttpUrl;

  String get userAvatarUrl => authService.userAvatarUrl;

  String get vipExperience => authService.vipExperience;

  String get vipLabel => authService.vipLabel;

  RxBool get isLogin => authService.isLogin.obs;

  late var getMemberMemberInfoAllPostFuture = _loadMemberInfoCacheAndQuery();
  late var getMemberUnReadAmountFuture = _loadMemberUnReadAmountCacheAndQuery();

  @override
  void onReady() {
    super.onReady();
    print("------------->用户信息");
    BalanceManager.syncAll();
  }

  Future<MemberInfoAll> _loadMemberInfoCacheAndQuery() async {
    try {
      Map<String, dynamic>? cache = null;
      if (!GetPlatform.isWeb) {
        cache = await NetCache.selectCache('/member/infoAll');
      }
      if (cache != null) {
        final data = jsonDecode(cache['soure']);
        final value = JsonMapper.fromMap<MemberInfoAll>({"data": data['data']})!;
        updateMemberInfo(value);
        getMemberMemberInfoAll();
        return value;
      } else {
        return getMemberMemberInfoAll();
      }
    } catch (_) {
      return getMemberMemberInfoAll();
    }
  }

  Future<RespectiveUnReadAmount> _loadMemberUnReadAmountCacheAndQuery() async {
    try {
      Map<String, dynamic>? cache = null;
      if (!GetPlatform.isWeb) {
        cache = await NetCache.selectCache('/message/selectRespectiveUnReadAmount');
      }
      if (cache != null) {
        final data = jsonDecode(cache['soure']);
        final value = RespectiveUnReadAmount.fromJson({"data": data['data']});
        updateUnReadAmount(value);
        getMemberUnReadAmount();
        return value;
      } else {
        return getMemberUnReadAmount();
      }
    } catch (_) {
      return getMemberUnReadAmount();
    }
  }

  Future<MemberInfoAll> getMemberMemberInfoAll() async {
    try {
      if (!authService.isLogin) {
        return JsonMapper.fromMap<MemberInfoAll>({})!;
      }
      MemberInfoAll resp = await Get.find<UserApi>().infoAll();
      updateMemberInfo(resp);
      return resp;
    } catch (_) {
      return JsonMapper.fromMap<MemberInfoAll>({})!;
    }
  }

  void updateMemberInfo(MemberInfoAll resp) {
    num todayProfit = resp.profitAndLossRespDto.todayProfit;
    String formatTodayProfit = AppCurrencyUtils.dealBalance("${todayProfit.toDouble()}");

    profitAndLoss.value = (todayProfit != 0
        ? (todayProfit > 0 ? '+$formatTodayProfit' : '$formatTodayProfit')
        : "home_no".tr); //今日盈亏为0或者今日盈亏抵消为0时，今日盈亏需要显示“暂无”
    /// VIP
    authService.vipExperience = resp.vipInfoVO.experience;
    authService.vipLabel = resp.vipInfoVO.grade;
    /// 用户更新
    Store.accountStatus.value = resp.memberInfoVO.accountStatus;
    /// 客服链接
    Store.agentCustomerUrl = resp.agentCustomerUrl;
    Store.memberCustomerUrl = resp.memberCustomerUrl;
  }

  ///获取用户未消息
  Future<RespectiveUnReadAmount> getMemberUnReadAmount() async {
    try {
      if (!authService.isLogin) {
        return RespectiveUnReadAmount.fromJson({});
      }
      final resp = await repository.getMemberUnReadAmount();
      updateUnReadAmount(resp);
      return resp;
    } catch (_) {
      return RespectiveUnReadAmount.fromJson({});
    }
  }

  void updateUnReadAmount(RespectiveUnReadAmount value) {
    Store.hasUnreadMessage.value = value.activityUnReadAmount +
            value.announceUnReadAmount +
            value.bonusUnReadAmount +
            value.noticeUnReadAmount >
        0;
    Store.hasUnreadMessageNum.value = value.activityUnReadAmount +
        value.announceUnReadAmount +
        value.bonusUnReadAmount +
        value.noticeUnReadAmount;
  }

  void showPop() {
    OBDialogUtil.show(
      ObDialog.alert(
        title: 'alert'.tr,
        content: 'home_user_total_wallet_balance'.tr,
        confirmText: 'user_profile_understood'.tr,
        onConfirmListener: () {
          Get.back();
        },
      ),
    );
  }
}
