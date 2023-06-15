import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'activity_record_controler.dart';
import 'repository/invite_record_repository.dart';
import 'repository/ui_invite_record.dart';

class InviteRecordController extends GetxController
    with ObPageController<UiInviteRecord> {
  final repository = Get.find<InviteRecordRepository>();
  RxBool systemLoadingFail = false.obs;
  RxBool systemLoadingShow = true.obs;
  int tagIndex = 0;
  final RxBool isHintClose = true.obs;

  ActivityRecordControler? get parentController =>
      Get.isRegistered<ActivityRecordControler>()
          ? Get.find<ActivityRecordControler>()
          : null;

  InviteRecordController();

  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  @override
  void onClose() {
    super.onClose();
    onRefresh();
  }

  @override
  Future<PageResponse<UiInviteRecord>> getPageList(int page) {
    String filter = tagIndex == 0 ? '' : '$tagIndex';
    return repository
        .getInviteRecords(filter, page)
        .then<PageResponse<UiInviteRecord>>((value) {
      var uiInviteRecord = value.record
          .map((e) => UiInviteRecord(
                e.id,
                e.inviteesUserName,
                e.registerAt,
                numberFormat(e.firstDepositAmount, point: 2),
                numberFormat(e.inviteRewardAmount, point: 2),
                e.inviteRewardStatus,
                statusTxt(e.inviteRewardStatus),
                statusColor(e.inviteRewardStatus),
              ))
          .toList();

      return PageResponse<UiInviteRecord>(value.pageNum, value.pageSize,
          uiInviteRecord, value.totalPage, value.totalRecord);
    });
  }

  @override
  void onRefreshSuccess(PageResponse<UiInviteRecord>? data) {
    super.onRefreshSuccess(data);
    systemLoadingFail.value = false;
    systemLoadingShow.value = false;
  }

  @override
  void onRefreshFailed(e) {
    super.onRefreshFailed(e);
    systemLoadingFail.value = true;
    systemLoadingShow.value = false;
  }

  String statusTxt(int status) {
    switch (status) {
      case 1:
        return 'invite_activity_record_state_1'.tr;
      case 2:
        return 'invite_activity_record_state_2'.tr;
      case 3:
        return 'invite_activity_record_state_3'.tr;
      case 4:
        return 'invite_activity_record_state_4'.tr;
      case 5:
        return 'invite_activity_record_state_5'.tr;
      case 6:
        return 'invite_activity_record_state_6'.tr;
      case 7:
        return 'invite_activity_record_state_7'.tr;
      default:
        return 'invite_activity_record_state_2'.tr;
    }
  }

  Color statusColor(int status) {
    switch (status) {
      case 1:
        return Color(0xFF48A5FF).withOpacity(.6);
      case 2:
        return ColorName.white.withOpacity(.6);
      case 3:
      case 4:
        return Color(0xFFFF5722).withOpacity(.6);
      case 5:
        return Color(0xFFE1A100).withOpacity(.6);
      case 6:
        return Color(0xFF69E300).withOpacity(.6);
      case 7:
        return Color(0xFFFF5722).withOpacity(.6);
      default:
        return ColorName.white.withOpacity(.6);
    }
  }
}
