import 'dart:async';

import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteNotification_post_resp_model.dart';

import 'bonus_record_controller.dart';
import 'invite_record_controller.dart';
import 'repository/invite_record_repository.dart';
import 'repository/ui_filter_tabs.dart';

class ActivityRecordControler extends GetxController {
  final repository = Get.find<InviteRecordRepository>();
  final RxBool isWalletType = true.obs;
  final RxBool isHintShowOrHide = false.obs;

  final RxString noticeMsg = ''.obs;

  final RxInt tabIndex = 0.obs;
  late Timer refreshTimer;
  final inviteRewardSendPosition = Get.arguments != null
      ? Get.arguments['inviteRewardSendPosition'] ?? 0
      : 0;
  final betRewardSendPosition =
      Get.arguments != null ? Get.arguments['betRewardSendPosition'] ?? 0 : 0;
  RxList<UiFilterTags> uiFilters = <UiFilterTags>[].obs;

  /// 邀请记录状态 1.未达标 2.已失效 3.审核中 4.已拒绝(已取消) 5.待领取 6.已领取 7.已过期 ;
  final Map<int, String> inviteLabel = {
    0: 'invite_activity_record_state_0'.tr,
    1: 'invite_activity_record_state_1'.tr,
    2: 'invite_activity_record_state_2'.tr,
    3: 'invite_activity_record_state_3'.tr,
    4: 'invite_activity_record_state_4'.tr,
    5: 'invite_activity_record_state_5'.tr,
    6: 'invite_activity_record_state_6'.tr,
    7: 'invite_activity_record_state_7'.tr,
  };

  /// 返利记录状态 1.未达标 2.进行中 3.已过期
  final Map<int, String> rebateLabel = {
    0: 'invite_activity_record_state_0'.tr,
    1: 'invite_activity_record_state_8'.tr,
    2: 'invite_activity_record_state_9'.tr,
    3: 'invite_activity_record_state_10'.tr,
  };

  @override
  void onInit() {
    super.onInit();
    initFilter();
    getInviteNotification();
    refreshTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      getInviteNotification();
    });
  }

  @override
  void onClose() {
    refreshTimer.cancel();
    super.onClose();
  }

  ///消息通知 条数。
  void getInviteNotification() async {
    await runCatch(() async {
      final int index = tabIndex.value;

      ///消息类型 1.邀请任务红利中心 2.邀请任务中心钱包 3.投注任务红利中心 4.投注任务中心钱包
      ///目前只传1、3即可
      var msgContent =
          await repository.getInviteNotification(index == 0 ? 1 : 3);
      getHintTxt(index, msgContent);
    });
  }

  void getHintTxt(int index, InviteInviteNotificationPostRespModel msgContent) {
    isHintShowOrHide.value = msgContent.number > 0 && index == tabIndex.value;

    /// 红利发送位置: 1-中心钱包 2-红利中心
    isWalletType.value =
        msgContent.rewardSendPosition == 1 && msgContent.number == 0;
    if (index == 0) {
      noticeMsg.value = isWalletType.value
          ? 'invite_title_tab_warning'.tr
          : 'invite_title_tab_hint'.tr.replaceAll('xx', '${msgContent.number}');
    } else {
      noticeMsg.value = isWalletType.value
          ? 'bonus_title_tab_warning'.tr
          : 'bonus_title_tab_hint'.tr.replaceAll('xx', '${msgContent.number}');
    }
  }

  String getHintIcon() {
    if (tabIndex.value != 0) {
      return isWalletType.value
          ? Assets.images.icon.comTipsFanli.path
          : Assets.images.icon.comFanli.path;
    } else {
      return isWalletType.value
          ? Assets.images.icon.comTipsCaijin.path
          : Assets.images.icon.comQianbao.path;
    }
  }

  void onJumpPage() {
    if (isWalletType.value) {
      // Get.toNamed(AppRoutes.MY_WALLET);
    } else {
      Store.messageTabIndex.value = 3;
      Get.toNamed(AppRoutes.MESSAGE, arguments: {"index": 3});
    }
  }

  void onCloseTitle() {
    if (tabIndex.value == 0) {
      var inviteRecordController = Get.findOrNull<InviteRecordController>();
      if (inviteRecordController != null) {
        inviteRecordController.isHintClose.value = false;
      }
    } else {
      var bonusRecordController = Get.findOrNull<BonusRecordController>();
      if (bonusRecordController != null) {
        bonusRecordController.isHintClose.value = false;
      }
    }
    update();
  }

  bool get hintClose {
    if (tabIndex.value == 0) {
      var inviteRecordController = Get.findOrNull<InviteRecordController>();
      if (inviteRecordController != null) {
        return inviteRecordController.isHintClose.value;
      }
    } else {
      var bonusRecordController = Get.findOrNull<BonusRecordController>();
      if (bonusRecordController != null) {
        return bonusRecordController.isHintClose.value;
      }
    }
    return true;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    isHintShowOrHide.value = false;
    getInviteNotification();
    initFilter();
  }

  void initFilter() {
    Map<int, String> labels = getFilterLabels();
    uiFilters.clear();
    labels.forEach((k, v) {
      uiFilters.add(UiFilterTags(
        k,
        v,
        ColorName.white.withOpacity(0.04),
        ColorName.colorMain.withOpacity(0.10),
      ));
    });
  }

  /// 邀请记录状态 1.未达标 2.已失效 3.审核中 4.已拒绝(已取消) 5.待领取 6.已领取 7.已过期 ;
  /// 返利记录状态 1.未达标 2.进行中 3.已过期
  Map<int, String> getFilterLabels() {
    return rebateLabel;

    // if (tabIndex.value != 0) {
    //   return rebateLabel;
    // }
    // if (null == Store.inviteConfig) {
    //   return inviteLabel;
    // }

    /// activityInvite/inviteConfig 读取配置
    /// -inviteRewardSendPosition 红利发送位置: 1-中心钱包 2-红利中心
    /// -inviteRewardAuditFlag 红利审核标志: 0-无需审核 1-需要审核
    /// 1.发放红利中心且不审核：含全部、已领取、待领取、已过期、未达标、已失效6个按钮
    /// 2.发放红利中心且审核：含全部、已领取、待领取、已过期、未达标、已失效、审核中、已取消（后台：已拒绝） 8个按钮
    /// 3.发放中心钱包且不审核：含全部、已领取、未达标、已失效4个按钮
    /// 4.发放中心钱包且审核：含全部、已领取、未达标、已失效、审核中、已取消（后台：已拒绝） 6个按钮
    // final bool isWallet = Store.inviteConfig!.inviteRewardSendPosition == 1;
    // final bool neededAudit = Store.inviteConfig!.inviteRewardAuditFlag == 1;
    // if (isWallet) {
    //   if (neededAudit) {
    //     return {
    //       0: 'invite_activity_record_state_0'.tr,
    //       6: 'invite_activity_record_state_6'.tr,
    //       1: 'invite_activity_record_state_1'.tr,
    //       2: 'invite_activity_record_state_2'.tr,
    //       3: 'invite_activity_record_state_3'.tr,
    //       4: 'invite_activity_record_state_4'.tr,
    //     };
    //   } else {
    //     return {
    //       0: 'invite_activity_record_state_0'.tr,
    //       6: 'invite_activity_record_state_6'.tr,
    //       1: 'invite_activity_record_state_1'.tr,
    //       2: 'invite_activity_record_state_2'.tr,
    //     };
    //   }
    // } else {
    //   if (neededAudit) {
    //     return {
    //       0: 'invite_activity_record_state_0'.tr,
    //       6: 'invite_activity_record_state_6'.tr,
    //       5: 'invite_activity_record_state_5'.tr,
    //       7: 'invite_activity_record_state_7'.tr,
    //       1: 'invite_activity_record_state_1'.tr,
    //       2: 'invite_activity_record_state_2'.tr,
    //       3: 'invite_activity_record_state_3'.tr,
    //       4: 'invite_activity_record_state_4'.tr,
    //     };
    //   } else {
    //     return {
    //       0: 'invite_activity_record_state_0'.tr,
    //       6: 'invite_activity_record_state_6'.tr,
    //       5: 'invite_activity_record_state_5'.tr,
    //       7: 'invite_activity_record_state_7'.tr,
    //       1: 'invite_activity_record_state_1'.tr,
    //       2: 'invite_activity_record_state_2'.tr,
    //     };
    //   }
    // }
  }

  int get curTagIndex {
    if (tabIndex.value == 0) {
      var inviteRecordController = Get.findOrNull<InviteRecordController>();
      if (inviteRecordController != null) {
        return inviteRecordController.tagIndex;
      }
    } else {
      var bonusRecordController = Get.findOrNull<BonusRecordController>();
      if (bonusRecordController != null) {
        return bonusRecordController.tagIndex;
      }
    }
    return 0;
  }

  void changeTagIndex(int id) {
    if (tabIndex.value == 0) {
      var inviteRecordController = Get.findOrNull<InviteRecordController>();
      if (inviteRecordController != null) {
        inviteRecordController.tagIndex = id;
        inviteRecordController.onRefresh();
      }
    } else {
      var bonusRecordController = Get.findOrNull<BonusRecordController>();
      if (bonusRecordController != null) {
        bonusRecordController.tagIndex = id;
        bonusRecordController.onRefresh();
      }
    }
    update();
    Get.back();
  }
}
