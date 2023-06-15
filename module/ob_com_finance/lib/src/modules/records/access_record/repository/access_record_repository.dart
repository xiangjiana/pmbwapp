import 'dart:async';

import 'package:flutter/material.dart' hide PageController;
import 'package:intl/intl.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/dic.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/ui_access_record.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart';
import 'package:params/params.dart';
import 'package:record/record.dart';

class AccessRecordRepository {
  final recordApis = Get.find<RecordApi>();

  Future<PageResponse<UiAccessRecord>> getDepositRecord(
    String startTime,
    String endTime,
    int pageNum, {
    String status = '',
    int pageSize = 10,
  }) async {
    try {
      final completer = Completer<PageResponse<UiAccessRecord>>();
      SelectDepositParam param = SelectDepositParam(
        createdAtEnd: endTime,
        createdAtStart: startTime,
        orderStatus: status,
        pageNum: pageNum,
        pageSize: pageSize,
      );
      if (status.isEmpty) {
        param = SelectDepositParam(
          createdAtEnd: endTime,
          createdAtStart: startTime,
          pageNum: pageNum,
          pageSize: pageSize,
        );
      }

      await recordApis.selectDeposit(param).then((res) {
        completer.complete(
          PageResponse(
            res.pageNum,
            res.pageSize,
            res.record
                .map((e) => UiAccessRecord(
                      DateFormat('MM-dd').format(DateTime.parse(e.daily)),
                      e.details
                          .map(
                            (detail) => UiAccessRecordDetail(
                              bizType: BIZTYPE_DIC[detail.bizType] ?? '',
                              createdAt: detail.createdAt,
                              id: detail.thirdOrderNo,
                              orderAmount:
                                  (detail.orderAmount.toDouble()).fixed(2),
                              orderStatus:
                                  DEPOSIT_STATUS_DIC[detail.appStatus] ?? '',
                              payType:
                                  DEPOSIT_PAY_TYPE_DIC[detail.payType] ?? '',
                              remark: detail.remark,
                              iconUrl:
                                  Assets.images.icon.walletDepositWhite.path,
                              statusColor:
                                  DEPOSIT_STATUS_COLOR_DIC[detail.appStatus] ??
                                      Colors.white,
                              isWithdraw: false,
                              withdrawAccountNo: '--',
                              withdrawBank: '',
                              withdrawBankAddress: '',
                              depositType: detail.payType.toString(),
                              withdrawType: '',
                            ),
                          )
                          .toList(),
                    ))
                .toList(),
            res.totalPage,
            res.totalRecord,
          ),
        );
      }).catchError((code, msg) => completer.completeError(msg));
      return completer.future;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<PageResponse<UiAccessRecord>> getWithdrawRecord(
    String startTime,
    String endTime,
    int pageNum, {
    String status = '',
    int pageSize = 10,
  }) async {
    try {
      final completer = Completer<PageResponse<UiAccessRecord>>();

      await recordApis
          .selectWithdrawal(
        SelectWithdrawalParam(
          createdAtStart: startTime,
          createdAtEnd: endTime,
          clientStatus: status,
          pageNum: pageNum,
          pageSize: pageSize,
        ),
      )
          .then((res) {
        completer.complete(
          PageResponse(
            res.pageNum,
            res.pageSize,
            res.record
                .map((e) => UiAccessRecord(
                      DateFormat('MM-dd').format(DateTime.parse(e.daily)),
                      e.details
                          .map(
                            (detail) => UiAccessRecordDetail(
                              bizType: BIZTYPE_DIC[detail.bizType] ?? '',
                              createdAt: detail.createdAt,
                              id: detail.thirdOrderNo,
                              orderAmount:
                                  detail.orderAmount.toDouble().fixed(2),
                              orderStatus:
                                  WITHDRAW_STATUS_DIC[detail.appStatus] ?? '',
                              payType: WITHDRAWAL_TYPE_FILTER_DIC[
                                      '${detail.withdrawType}'] ??
                                  '',
                              remark: detail.remark,
                              iconUrl:
                                  Assets.images.icon.walletWithdrawalWhite.path,
                              statusColor:
                                  WITHDRAW_STATUS_COLOR_DIC[detail.appStatus] ??
                                      Colors.white,
                              isWithdraw: true,
                              withdrawAccountNo: detail.withdrawAccountNo,
                              withdrawBank: detail.withdrawBank,
                              withdrawBankAddress: detail.withdrawBankAddress,
                              depositType: '',
                              withdrawType: detail.withdrawType.toString(),
                            ),
                          )
                          .toList(),
                    ))
                .toList(),
            res.totalPage,
            res.totalRecord,
          ),
        );
      }).catchError((code, msg) => completer.completeError(msg));
      return completer.future;
    } catch (e) {
      return Future.error(e);
    }
  }
}
