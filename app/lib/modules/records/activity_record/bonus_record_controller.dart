import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'activity_record_controler.dart';
import 'repository/invite_record_repository.dart';
import 'repository/ui_bonus_record.dart';

class BonusRecordController extends GetxController
    with ObPageController<UiBonusRecord> {
  final repository = Get.find<InviteRecordRepository>();
  RxBool systemLoadingFail = false.obs;
  RxBool systemLoadingShow = true.obs;
  int tagIndex = 0;
  RxDouble todayRebateAmount = 0.0.obs;
  RxDouble totalRebateAmount = 0.0.obs;
  final RxBool isHintClose = true.obs;

  ActivityRecordControler? get parentController =>
      Get.isRegistered<ActivityRecordControler>()
          ? Get.find<ActivityRecordControler>()
          : null;

  BonusRecordController();

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
  Future<PageResponse<UiBonusRecord>> getPageList(int page) {
    String filter = tagIndex == 0 ? '' : '$tagIndex';
    return repository
        .getInviteRebateRecords(filter, page)
        .then<PageResponse<UiBonusRecord>>((value) {
      todayRebateAmount.value = value.summary.todayRebateAmount;
      totalRebateAmount.value = value.summary.totalRebateAmount;
      var uiBonusRecord = value.record
          .map((e) => UiBonusRecord(
                e.id,
                e.inviteesUserName,
                e.firstDepositTime.isEmpty,
                e.registerAt,
                e.firstDepositTime,
                e.endRebateTime,
                numberFormat(e.todayBetDetails.remainRebateAmount, comma: false),
                numberFormat(e.validBetAmount, comma: false),
                numberFormat(e.rebateAmount, comma: false),
                numberFormat(e.totalRebate, comma: false),
                e.status,
                statusTxt(e.betRecordStatus),
                statusColor(e.betRecordStatus),
                e.betCountType,
              ))
          .toList();

      return PageResponse<UiBonusRecord>(value.pageNum, value.pageSize,
          uiBonusRecord, value.totalPage, value.totalRecord);
    });
  }

  @override
  void onRefreshSuccess(PageResponse<UiBonusRecord>? data) {
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
        return 'invite_activity_record_state_9'.tr;
      default:
        return 'invite_activity_record_state_10'.tr;
    }
  }

  Color statusColor(int status) {
    switch (status) {
      case 1:
        return Color(0xFF48A5FF).withOpacity(.6);
      case 2:
        return Color(0xFF69E300).withOpacity(.6);
      default:
        return Color(0xFFFF5722).withOpacity(.6);
    }
  }
}
