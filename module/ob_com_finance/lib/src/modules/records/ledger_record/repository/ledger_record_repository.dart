import 'dart:async';

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:record/record.dart';

class LedgerRecordRepository {
  final recordApis = Get.find<RecordApi>();

  Future<PageResponse<MemberAccountRecording>> getDepositRecord(
    String createdAtStart,
    String createdAtEnd,
    String type,
    int pageNum, {
    int pageSize = 10,
  }) async {
    try {
      return recordApis.selectMemberAccount(
        UserAccountChangeRecordParam(
          pageNum: pageNum,
          pageSize: pageSize,
          occurDtStart: createdAtStart,
          occurDtEnd: createdAtEnd,
          clientType: type.isEmpty ? null : type,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}
