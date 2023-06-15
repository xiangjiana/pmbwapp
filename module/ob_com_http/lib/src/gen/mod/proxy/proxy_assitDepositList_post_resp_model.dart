import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyAssitDepositListPostRespModel {
  ProxyAssitDepositListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyAssitDepositListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyAssitDepositListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyAssitDepositListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyAssitDepositListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyAssitDepositListPostRespModel(
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
  List<ProxyAssitDepositListPostRespModelRecord> record;
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

class ProxyAssitDepositListPostRespModelRecord {
  ProxyAssitDepositListPostRespModelRecord({
    required this.amount,
    required this.bizType,
    required this.createdAt,
    required this.eventTime,
    required this.inAccountType,
    required this.inMerchantId,
    required this.inRealName,
    required this.inUserId,
    required this.inUserName,
    required this.inUserType,
    required this.orderStatus,
    required this.outAccountType,
    required this.outEventId,
    required this.outMerchantId,
    required this.outRealName,
    required this.outUserId,
    required this.outUserLevel,
    required this.outUserName,
    required this.outUserType,
    required this.remark,
  });

  factory ProxyAssitDepositListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyAssitDepositListPostRespModelRecord(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        eventTime: jsonRes['eventTime'] == null
            ? ''
            : asT<String>("eventTime", jsonRes['eventTime'])!,
        inAccountType: jsonRes['inAccountType'] == null
            ? 0
            : asT<int>("inAccountType", jsonRes['inAccountType'])!,
        inMerchantId: jsonRes['inMerchantId'] == null
            ? 0
            : asT<int>("inMerchantId", jsonRes['inMerchantId'])!,
        inRealName: jsonRes['inRealName'] == null
            ? ''
            : asT<String>("inRealName", jsonRes['inRealName'])!,
        inUserId: jsonRes['inUserId'] == null
            ? 0
            : asT<int>("inUserId", jsonRes['inUserId'])!,
        inUserName: jsonRes['inUserName'] == null
            ? ''
            : asT<String>("inUserName", jsonRes['inUserName'])!,
        inUserType: jsonRes['inUserType'] == null
            ? 0
            : asT<int>("inUserType", jsonRes['inUserType'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        outAccountType: jsonRes['outAccountType'] == null
            ? 0
            : asT<int>("outAccountType", jsonRes['outAccountType'])!,
        outEventId: jsonRes['outEventId'] == null
            ? ''
            : asT<String>("outEventId", jsonRes['outEventId'])!,
        outMerchantId: jsonRes['outMerchantId'] == null
            ? 0
            : asT<int>("outMerchantId", jsonRes['outMerchantId'])!,
        outRealName: jsonRes['outRealName'] == null
            ? ''
            : asT<String>("outRealName", jsonRes['outRealName'])!,
        outUserId: jsonRes['outUserId'] == null
            ? 0
            : asT<int>("outUserId", jsonRes['outUserId'])!,
        outUserLevel: jsonRes['outUserLevel'] == null
            ? 0
            : asT<int>("outUserLevel", jsonRes['outUserLevel'])!,
        outUserName: jsonRes['outUserName'] == null
            ? ''
            : asT<String>("outUserName", jsonRes['outUserName'])!,
        outUserType: jsonRes['outUserType'] == null
            ? 0
            : asT<int>("outUserType", jsonRes['outUserType'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  double amount = 0.0;
  int bizType = 0;
  String createdAt = '';
  String eventTime = '';
  int inAccountType = 0;
  int inMerchantId = 0;
  String inRealName = '';
  int inUserId = 0;
  String inUserName = '';
  int inUserType = 0;
  int orderStatus = 0;
  int outAccountType = 0;
  String outEventId = '';
  int outMerchantId = 0;
  String outRealName = '';
  int outUserId = 0;
  int outUserLevel = 0;
  String outUserName = '';
  int outUserType = 0;
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'bizType': bizType,
        'createdAt': createdAt,
        'eventTime': eventTime,
        'inAccountType': inAccountType,
        'inMerchantId': inMerchantId,
        'inRealName': inRealName,
        'inUserId': inUserId,
        'inUserName': inUserName,
        'inUserType': inUserType,
        'orderStatus': orderStatus,
        'outAccountType': outAccountType,
        'outEventId': outEventId,
        'outMerchantId': outMerchantId,
        'outRealName': outRealName,
        'outUserId': outUserId,
        'outUserLevel': outUserLevel,
        'outUserName': outUserName,
        'outUserType': outUserType,
        'remark': remark,
      };
}
