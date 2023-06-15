import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class InviteRebateRecordsPostRespModel {
  InviteRebateRecordsPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory InviteRebateRecordsPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<InviteRebateRecordsPostRespModelRecord>? record = jsonRes['record'] is List ? <InviteRebateRecordsPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(InviteRebateRecordsPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return InviteRebateRecordsPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? InviteRebateRecordsPostRespModelSummary.fromJson({})
          : InviteRebateRecordsPostRespModelSummary.fromJson(
              asT<Map<String, dynamic>>("summary", jsonRes["summary"])!),
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
  List<InviteRebateRecordsPostRespModelRecord> record;
  InviteRebateRecordsPostRespModelSummary summary;
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

class InviteRebateRecordsPostRespModelRecord {
  InviteRebateRecordsPostRespModelRecord({
    required this.activityId,
    required this.appId,
    required this.betRecordStatus,
    required this.createdAt,
    required this.endRebateTime,
    required this.eventId,
    required this.firstDepositTime,
    required this.id,
    required this.inviteUserId,
    required this.inviteUserName,
    required this.inviteesUserId,
    required this.inviteesUserName,
    required this.merchantId,
    required this.rebateAmount,
    required this.rebateValidity,
    required this.registerAt,
    required this.remainRebateAmount,
    required this.startRebateTime,
    required this.status,
    required this.todayBetDetails,
    required this.totalRebate,
    required this.updatedAt,
    required this.validBetAmount,
    required this.validityPeriodStatus,
    required this.betCountType,
  });

  factory InviteRebateRecordsPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => InviteRebateRecordsPostRespModelRecord(
        activityId: jsonRes['activityId'] == null
            ? ''
            : asT<String>("activityId", jsonRes['activityId'])!,
        appId:
            jsonRes['appId'] == null ? 0 : asT<int>("appId", jsonRes['appId'])!,
        betRecordStatus: jsonRes['betRecordStatus'] == null
            ? 0
            : asT<int>("betRecordStatus", jsonRes['betRecordStatus'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        endRebateTime: jsonRes['endRebateTime'] == null
            ? ''
            : asT<String>("endRebateTime", jsonRes['endRebateTime'])!,
        eventId: jsonRes['eventId'] == null
            ? ''
            : asT<String>("eventId", jsonRes['eventId'])!,
        firstDepositTime: jsonRes['firstDepositTime'] == null
            ? ''
            : asT<String>("firstDepositTime", jsonRes['firstDepositTime'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        inviteUserId: jsonRes['inviteUserId'] == null
            ? ''
            : asT<String>("inviteUserId", jsonRes['inviteUserId'])!,
        inviteUserName: jsonRes['inviteUserName'] == null
            ? ''
            : asT<String>("inviteUserName", jsonRes['inviteUserName'])!,
        inviteesUserId: jsonRes['inviteesUserId'] == null
            ? ''
            : asT<String>("inviteesUserId", jsonRes['inviteesUserId'])!,
        inviteesUserName: jsonRes['inviteesUserName'] == null
            ? ''
            : asT<String>("inviteesUserName", jsonRes['inviteesUserName'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        rebateAmount: jsonRes['rebateAmount'] == null
            ? 0.0
            : asT<double>("rebateAmount", jsonRes['rebateAmount'])!,
        rebateValidity: jsonRes['rebateValidity'] == null
            ? 0
            : asT<int>("rebateValidity", jsonRes['rebateValidity'])!,
        registerAt: jsonRes['registerAt'] == null
            ? ''
            : asT<String>("registerAt", jsonRes['registerAt'])!,
        remainRebateAmount: jsonRes['remainRebateAmount'] == null
            ? 0.0
            : asT<double>("remainRebateAmount", jsonRes['remainRebateAmount'])!,
        startRebateTime: jsonRes['startRebateTime'] == null
            ? ''
            : asT<String>("startRebateTime", jsonRes['startRebateTime'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        todayBetDetails: jsonRes["todayBetDetails"] == null
            ? InviteRebateRecordsPostRespModelTodayBetDetails.fromJson({})
            : InviteRebateRecordsPostRespModelTodayBetDetails.fromJson(asT<Map<String, dynamic>>(
                "todayBetDetails", jsonRes["todayBetDetails"])!),
        totalRebate: jsonRes['totalRebate'] == null
            ? 0.0
            : asT<double>("totalRebate", jsonRes['totalRebate'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
        validityPeriodStatus: jsonRes['validityPeriodStatus'] == null
            ? 0
            : asT<int>(
                "validityPeriodStatus", jsonRes['validityPeriodStatus'])!,
        betCountType: jsonRes['betCountType'] == null
            ? 0
            : asT<int>("betCountType", jsonRes['betCountType'])!,
      );

  String activityId = '';
  int appId = 0;
  int betRecordStatus = 0;
  String createdAt = '';
  String endRebateTime = '';
  String eventId = '';
  String firstDepositTime = '';
  String id = '';
  String inviteUserId = '';
  String inviteUserName = '';
  String inviteesUserId = '';
  String inviteesUserName = '';
  String merchantId = '';
  double rebateAmount = 0.0;
  int rebateValidity = 0;
  String registerAt = '';
  double remainRebateAmount = 0.0;
  String startRebateTime = '';
  int status = 0;
  InviteRebateRecordsPostRespModelTodayBetDetails todayBetDetails;
  double totalRebate = 0.0;
  String updatedAt = '';
  double validBetAmount = 0.0;
  int validityPeriodStatus = 0;
  int betCountType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityId': activityId,
        'appId': appId,
        'betRecordStatus': betRecordStatus,
        'createdAt': createdAt,
        'endRebateTime': endRebateTime,
        'eventId': eventId,
        'firstDepositTime': firstDepositTime,
        'id': id,
        'inviteUserId': inviteUserId,
        'inviteUserName': inviteUserName,
        'inviteesUserId': inviteesUserId,
        'inviteesUserName': inviteesUserName,
        'merchantId': merchantId,
        'rebateAmount': rebateAmount,
        'rebateValidity': rebateValidity,
        'registerAt': registerAt,
        'remainRebateAmount': remainRebateAmount,
        'startRebateTime': startRebateTime,
        'status': status,
        'todayBetDetails': todayBetDetails,
        'totalRebate': totalRebate,
        'updatedAt': updatedAt,
        'validBetAmount': validBetAmount,
        'validityPeriodStatus': validityPeriodStatus,
        'betCountType': betCountType,
      };
}

class InviteRebateRecordsPostRespModelTodayBetDetails {
  InviteRebateRecordsPostRespModelTodayBetDetails({
    required this.betRewardMax,
    required this.betRewardMin,
    required this.betRewardRate,
    required this.createdAt,
    required this.eventId,
    required this.id,
    required this.inviteBetId,
    required this.merchantId,
    required this.rebateAmount,
    required this.rebateTime,
    required this.rebateType,
    required this.remainRebateAmount,
    required this.validBetAmount,
  });

  factory InviteRebateRecordsPostRespModelTodayBetDetails.fromJson(Map<String, dynamic> jsonRes) =>
      InviteRebateRecordsPostRespModelTodayBetDetails(
        betRewardMax: jsonRes['betRewardMax'] == null
            ? 0
            : asT<int>("betRewardMax", jsonRes['betRewardMax'])!,
        betRewardMin: jsonRes['betRewardMin'] == null
            ? 0
            : asT<int>("betRewardMin", jsonRes['betRewardMin'])!,
        betRewardRate: jsonRes['betRewardRate'] == null
            ? 0
            : asT<int>("betRewardRate", jsonRes['betRewardRate'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        eventId: jsonRes['eventId'] == null
            ? ''
            : asT<String>("eventId", jsonRes['eventId'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        inviteBetId: jsonRes['inviteBetId'] == null
            ? 0
            : asT<int>("inviteBetId", jsonRes['inviteBetId'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        rebateAmount: jsonRes['rebateAmount'] == null
            ? 0.0
            : asT<double>("rebateAmount", jsonRes['rebateAmount'])!,
        rebateTime: jsonRes['rebateTime'] == null
            ? ''
            : asT<String>("rebateTime", jsonRes['rebateTime'])!,
        rebateType: jsonRes['rebateType'] == null
            ? 0
            : asT<int>("rebateType", jsonRes['rebateType'])!,
        remainRebateAmount: jsonRes['remainRebateAmount'] == null
            ? 0.0
            : asT<double>("remainRebateAmount", jsonRes['remainRebateAmount'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0
            : asT<int>("validBetAmount", jsonRes['validBetAmount'])!,
      );

  int betRewardMax = 0;
  int betRewardMin = 0;
  int betRewardRate = 0;
  String createdAt = '';
  String eventId = '';
  int id = 0;
  int inviteBetId = 0;
  int merchantId = 0;
  double rebateAmount = 0.0;
  String rebateTime = '';
  int rebateType = 0;
  double remainRebateAmount = 0.0;
  int validBetAmount = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betRewardMax': betRewardMax,
        'betRewardMin': betRewardMin,
        'betRewardRate': betRewardRate,
        'createdAt': createdAt,
        'eventId': eventId,
        'id': id,
        'inviteBetId': inviteBetId,
        'merchantId': merchantId,
        'rebateAmount': rebateAmount,
        'rebateTime': rebateTime,
        'rebateType': rebateType,
        'remainRebateAmount': remainRebateAmount,
        'validBetAmount': validBetAmount,
      };
}

class InviteRebateRecordsPostRespModelSummary {
  InviteRebateRecordsPostRespModelSummary({
    required this.todayRebateAmount,
    required this.totalRebateAmount,
  });

  factory InviteRebateRecordsPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) => InviteRebateRecordsPostRespModelSummary(
        todayRebateAmount: jsonRes['todayRebateAmount'] == null
            ? 0
            : asT<double>("todayRebateAmount", jsonRes['todayRebateAmount'])!,
        totalRebateAmount: jsonRes['totalRebateAmount'] == null
            ? 0
            : asT<double>("totalRebateAmount", jsonRes['totalRebateAmount'])!,
      );

  double todayRebateAmount = 0;
  double totalRebateAmount = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'todayRebateAmount': todayRebateAmount,
        'totalRebateAmount': totalRebateAmount,
      };
}
