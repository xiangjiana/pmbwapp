import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class InviteInviteRecordsPostRespModel {
  InviteInviteRecordsPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory InviteInviteRecordsPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<InviteInviteRecordsPostRespModelRecord>? record = jsonRes['record'] is List ? <InviteInviteRecordsPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(InviteInviteRecordsPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return InviteInviteRecordsPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes['summary'] == null
          ? Map<String, dynamic>()
          : asT<Object>("summary", jsonRes['summary'])!,
      totalPage: jsonRes['totalPage'] == null
          ? 0
          : asT<int>("totalPage", jsonRes['totalPage'])!,
      totalRecord: jsonRes['totalRecord'] == null
          ? 0
          : asT<int>("totalRecord", jsonRes['totalRecord'])!,
    );
  }

  int pageNum = 0;
  int pageSize = 0;
  List<InviteInviteRecordsPostRespModelRecord> record;
  Object summary;
  int totalPage = 0;
  int totalRecord = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'record': record,
        'summary': summary,
        'totalPage': totalPage,
        'totalRecord': totalRecord,
      };
}

class InviteInviteRecordsPostRespModelRecord {
  InviteInviteRecordsPostRespModelRecord({
    required this.appId,
    required this.depositCountType,
    required this.firstDepositAmount,
    required this.firstDepositTime,
    required this.id,
    required this.inviteRewardAmount,
    required this.inviteRewardAt,
    required this.inviteRewardStatus,
    required this.inviteUserName,
    required this.inviteesRewardAmount,
    required this.inviteesRewardAt,
    required this.inviteesRewardStatus,
    required this.inviteesUserName,
    required this.merchantId,
    required this.registerAt,
    required this.registerDeviceNo,
    required this.registerIp,
    required this.rewardType,
    required this.taskDeposit,
    required this.totalDepositAmount,
  });

  factory InviteInviteRecordsPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => InviteInviteRecordsPostRespModelRecord(
        appId:
            jsonRes['appId'] == null ? 0 : asT<int>("appId", jsonRes['appId'])!,
        depositCountType: jsonRes['depositCountType'] == null
            ? 0
            : asT<int>("depositCountType", jsonRes['depositCountType'])!,
        firstDepositAmount: jsonRes['firstDepositAmount'] == null
            ? 0.0
            : asT<double>("firstDepositAmount", jsonRes['firstDepositAmount'])!,
        firstDepositTime: jsonRes['firstDepositTime'] == null
            ? ''
            : asT<String>("firstDepositTime", jsonRes['firstDepositTime'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        inviteRewardAmount: jsonRes['inviteRewardAmount'] == null
            ? 0.0
            : asT<double>("inviteRewardAmount", jsonRes['inviteRewardAmount'])!,
        inviteRewardAt: jsonRes['inviteRewardAt'] == null
            ? ''
            : asT<String>("inviteRewardAt", jsonRes['inviteRewardAt'])!,
        inviteRewardStatus: jsonRes['inviteRewardStatus'] == null
            ? 0
            : asT<int>("inviteRewardStatus", jsonRes['inviteRewardStatus'])!,
        inviteUserName: jsonRes['inviteUserName'] == null
            ? ''
            : asT<String>("inviteUserName", jsonRes['inviteUserName'])!,
        inviteesRewardAmount: jsonRes['inviteesRewardAmount'] == null
            ? 0
            : asT<int>(
                "inviteesRewardAmount", jsonRes['inviteesRewardAmount'])!,
        inviteesRewardAt: jsonRes['inviteesRewardAt'] == null
            ? ''
            : asT<String>("inviteesRewardAt", jsonRes['inviteesRewardAt'])!,
        inviteesRewardStatus: jsonRes['inviteesRewardStatus'] == null
            ? 0
            : asT<int>(
                "inviteesRewardStatus", jsonRes['inviteesRewardStatus'])!,
        inviteesUserName: jsonRes['inviteesUserName'] == null
            ? ''
            : asT<String>("inviteesUserName", jsonRes['inviteesUserName'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        registerAt: jsonRes['registerAt'] == null
            ? ''
            : asT<String>("registerAt", jsonRes['registerAt'])!,
        registerDeviceNo: jsonRes['registerDeviceNo'] == null
            ? ''
            : asT<String>("registerDeviceNo", jsonRes['registerDeviceNo'])!,
        registerIp: jsonRes['registerIp'] == null
            ? ''
            : asT<String>("registerIp", jsonRes['registerIp'])!,
        rewardType: jsonRes['rewardType'] == null
            ? 0
            : asT<int>("rewardType", jsonRes['rewardType'])!,
        taskDeposit: jsonRes['taskDeposit'] == null
            ? 0
            : asT<int>("taskDeposit", jsonRes['taskDeposit'])!,
        totalDepositAmount: jsonRes['totalDepositAmount'] == null
            ? 0
            : asT<int>("totalDepositAmount", jsonRes['totalDepositAmount'])!,
      );

  int appId = 0;
  int depositCountType = 0;
  double firstDepositAmount = 0.0;
  String firstDepositTime = '';
  String id = '';
  double inviteRewardAmount = 0.0;
  String inviteRewardAt = '';
  int inviteRewardStatus = 0;
  String inviteUserName = '';
  int inviteesRewardAmount = 0;
  String inviteesRewardAt = '';
  int inviteesRewardStatus = 0;
  String inviteesUserName = '';
  String merchantId = '';
  String registerAt = '';
  String registerDeviceNo = '';
  String registerIp = '';
  int rewardType = 0;
  int taskDeposit = 0;
  int totalDepositAmount = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appId': appId,
        'depositCountType': depositCountType,
        'firstDepositAmount': firstDepositAmount,
        'firstDepositTime': firstDepositTime,
        'id': id,
        'inviteRewardAmount': inviteRewardAmount,
        'inviteRewardAt': inviteRewardAt,
        'inviteRewardStatus': inviteRewardStatus,
        'inviteUserName': inviteUserName,
        'inviteesRewardAmount': inviteesRewardAmount,
        'inviteesRewardAt': inviteesRewardAt,
        'inviteesRewardStatus': inviteesRewardStatus,
        'inviteesUserName': inviteesUserName,
        'merchantId': merchantId,
        'registerAt': registerAt,
        'registerDeviceNo': registerDeviceNo,
        'registerIp': registerIp,
        'rewardType': rewardType,
        'taskDeposit': taskDeposit,
        'totalDepositAmount': totalDepositAmount,
      };
}
