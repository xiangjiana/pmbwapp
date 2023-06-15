import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyDepositRecordPostRespModel {
  ProxyProxyDepositRecordPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyDepositRecordPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyDepositRecordPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyDepositRecordPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyDepositRecordPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyDepositRecordPostRespModel(
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
  List<ProxyProxyDepositRecordPostRespModelRecord> record;
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

class ProxyProxyDepositRecordPostRespModelRecord {
  ProxyProxyDepositRecordPostRespModelRecord({
    required this.bizType,
    required this.createdAt,
    required this.eventId,
    required this.orderAmount,
    required this.orderStatus,
    required this.payType,
  });

  factory ProxyProxyDepositRecordPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyDepositRecordPostRespModelRecord(
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        eventId: jsonRes['eventId'] == null
            ? ''
            : asT<String>("eventId", jsonRes['eventId'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0
            : asT<int>("orderAmount", jsonRes['orderAmount'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        payType: jsonRes['payType'] == null
            ? 0
            : asT<int>("payType", jsonRes['payType'])!,
      );

  int bizType = 0;
  String createdAt = '';
  String eventId = '';
  int orderAmount = 0;
  int orderStatus = 0;
  int payType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bizType': bizType,
        'createdAt': createdAt,
        'eventId': eventId,
        'orderAmount': orderAmount,
        'orderStatus': orderStatus,
        'payType': payType,
      };
}
