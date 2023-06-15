import 'dart:async';

import 'package:models/models.dart';
import 'package:ob_package/utils/web_util2.dart';
import 'package:ob_com_base/ob_com_base.dart';
// import 'package:agent_ob_ui/agent_n/public/agent_n_agent_login_utils/agent_n_agent_login_utils.dart';
// import 'package:agent_ob_ui/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_component/ob_component.dart';
import 'package:user/user.dart';

bool isFirstMount = true;

class MineController extends GetxController {
  final AuthService authService;
  // TODO: Agent
  // final AgentNAgentLoginUtils loginUtils = AgentNAgentLoginUtils();
  final repository = Get.find<HomeRepository>();

  MineController(this.authService);

  final _obscureAmount = false.obs;
  RxBool isShowToolbar = false.obs;

  late InviteInviteConfigPostRespModel inviteConfig;

  int isActivityUnstarted = 0;

  RxBool get isAgent => authService.isAgent;

  bool get isTryPlay => authService.isTryPlay;

  bool get isActivityEntry {
    return Store.checkInviteActivityEntry > 0 && !isTryPlay;
  }

  ScrollController scrollController = ScrollController();

  List<Map> listTies = [
    {
      'title': 'bet_history_title',
      'icon': Assets.images.icon.myHomeOrder.path,
      'onPress': () => Get.toNamed(AppRoutes.BET_HISTORY),
    },
    {
      'title': 'ledger_detail_quota_record',
      'icon': Assets.images.icon.myHomeAccess.path,
      'onPress': () => Get.toNamed(AppRoutes.LEDGER_RECORD),
    },

    // {
    //   'title': 'join_us',
    //   'icon': Assets.images.icon.myHomeJoin.path,
    //   'onPress': () {
    //     eventBus.fire(FloatBonusEvent(show: false));
    //     jumpToAgent();
    //   }
    // },
  ];

  //隐藏显示余额
  bool get obscureAmount => _obscureAmount.value;

  void toggleObscure() => _obscureAmount.value = !obscureAmount;

  String get vipLevel => authService.vipLevel;

  String get userName => authService.userName;

  bool get isAvatarHttpUrl => authService.isAvatarHttpUrl;

  String get userAvatarUrl => authService.userAvatarUrl;

  String get vipExperience => authService.vipExperience;

  String get vipLabel => authService.vipLabel;

  double get vipExperienceNum => authService.vipExperienceNum;

  bool get disabledAnimate => isFirstMount == false;

  void jumpToUserProfile() {
    authService.syncUser();
    Get.toNamed(AppRoutes.USER_PROFILE);
  }

  void jumpToAgent() async {
    // TODO: Agent
    // bool agentEnable = await checkAgentEnable();
    // if (agentEnable) {
    //   loginUtils.loginAgent();
    // } else {
    //   Get.toNamed(AgentAppRoutes.JOIN_US_AGENT);
    // }
  }

  Future<bool> checkAgentEnable() async {
    MemberInfo resp = await Get.find<UserApi>().info();
     return  resp.entryAuthority == '1';
  }

  void refreshInfo() {
    BalanceManager.syncAll();
    update();
  }

  ///邀请活动配置
  void jumpToInviteActivity() async {
    if (GetPlatform.isWeb) {
      WebUtil.jumpToOffice();
      return;
    }

    runCatch(() async {
      if (Store.checkInviteActivityEntry.value == 1) {
        warnDialog('mine_activity_state_1'.tr);
        return;
      }

      if (Store.checkInviteActivityEntry.value == 2) {
        warnDialog('mine_activity_state_2'.tr);
        return;
      }

      inviteConfig = await repository.getInviteInviteConfigPost();
      //Store.inviteConfig = inviteConfig;

      Get.toNamed(AppRoutes.INVITE_DETAIL, arguments: inviteConfig);
    });
  }

  void warnDialog(String tipMsg) {
    OBDialogUtil.show(
      ObDialog.alert(
        title: 'alert'.tr,
        content: tipMsg,
        cancelText: 'confirm'.tr,
        onCancelListener: () {
          Get.back();
        },
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      isShowToolbar.value = scrollController.offset > 40;
    });
    BalanceManager.syncAll();
    if (kIsWeb) {
      isFirstMount = false;
    }
    if (AppMerchantUtils.loadCurMerchantBy(OBModules.kAccessRecord))
      listTies.add({
        'title': 'mine_deposit_and_withdrawal_records',
        'icon': Assets.images.icon.myHomeDeal.path,
        'onPress': () => Get.toNamed(AppRoutes.ACCESS_RECORD),
      });
    if (AppMerchantUtils.loadCurMerchantBy(OBModules.kAccount))
      listTies.add({
        'title': 'account_management',
        'icon': Assets.images.icon.myHomeAccount.path,
        'onPress': () => Get.toNamed(AppRoutes.ACCOUNT),
      });
  }

  @override
  void onClose() {
    scrollController.dispose();
    isFirstMount = false;
    super.onClose();
  }
}
