import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerMemberDiscountRecordsPostRespModel {
  ProxyLowerMemberDiscountRecordsPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyLowerMemberDiscountRecordsPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyLowerMemberDiscountRecordsPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyLowerMemberDiscountRecordsPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyLowerMemberDiscountRecordsPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyLowerMemberDiscountRecordsPostRespModel(
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
  List<ProxyLowerMemberDiscountRecordsPostRespModelRecord> record;
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

class ProxyLowerMemberDiscountRecordsPostRespModelRecord {
  ProxyLowerMemberDiscountRecordsPostRespModelRecord({
    required this.amount,
    required this.id,
    required this.playerName,
    required this.receiveTime,
    required this.remark,
    required this.type,
  });

  factory ProxyLowerMemberDiscountRecordsPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyLowerMemberDiscountRecordsPostRespModelRecord(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        playerName: jsonRes['playerName'] == null
            ? ''
            : asT<String>("playerName", jsonRes['playerName'])!,
        receiveTime: jsonRes['receiveTime'] == null
            ? ''
            : asT<String>("receiveTime", jsonRes['receiveTime'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  double amount = 0.0;
  String id = '';
  String playerName = '';
  String receiveTime = '';
  String remark = '';
  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'id': id,
        'playerName': playerName,
        'receiveTime': receiveTime,
        'remark': remark,
        'type': type,
      };
}
