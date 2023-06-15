import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyFundsRecordsAccountChangePostRespModel {
  ProxyProxyFundsRecordsAccountChangePostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyFundsRecordsAccountChangePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyFundsRecordsAccountChangePostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyFundsRecordsAccountChangePostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyFundsRecordsAccountChangePostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyFundsRecordsAccountChangePostRespModel(
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
  List<ProxyProxyFundsRecordsAccountChangePostRespModelRecord> record;
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

class ProxyProxyFundsRecordsAccountChangePostRespModelRecord {
  ProxyProxyFundsRecordsAccountChangePostRespModelRecord({
    required this.amount,
    required this.changeAfter,
    required this.appType,
    required this.eventId,
    required this.occurDt,
    required this.appTypeName,
    required this.remark,
  });

  factory ProxyProxyFundsRecordsAccountChangePostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyFundsRecordsAccountChangePostRespModelRecord(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        changeAfter: jsonRes['changeAfter'] == null
            ? 0.0
            : asT<double>("changeAfter", jsonRes['changeAfter'])!,
        appType: jsonRes['appType'] == null
            ? 0
            : asT<int>("appType", jsonRes['appType'])!,
        appTypeName: jsonRes['appTypeName'] == null
            ? ''
            : asT<String>("appTypeName", jsonRes['appTypeName'])!,
        eventId: jsonRes['eventId'] == null
            ? ''
            : asT<String>("eventId", jsonRes['eventId'])!,
        occurDt: jsonRes['occurDt'] == null
            ? ''
            : asT<String>("occurDt", jsonRes['occurDt'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  double amount = 0.0;
  double changeAfter = 0.0;
  int appType = 0;
  String appTypeName = "";
  String eventId = '';
  String occurDt = '';
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'changeAfter': changeAfter,
        'appType': appType,
        'eventId': eventId,
        'occurDt': occurDt,
        'remark': remark,
      };
}
