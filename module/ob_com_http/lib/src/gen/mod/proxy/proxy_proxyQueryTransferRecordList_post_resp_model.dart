import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyQueryTransferRecordListPostRespModel {
  ProxyProxyQueryTransferRecordListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyQueryTransferRecordListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyQueryTransferRecordListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyQueryTransferRecordListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyQueryTransferRecordListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyQueryTransferRecordListPostRespModel(
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
  List<ProxyProxyQueryTransferRecordListPostRespModelRecord> record;
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

class ProxyProxyQueryTransferRecordListPostRespModelRecord {
  ProxyProxyQueryTransferRecordListPostRespModelRecord({
    required this.accountType,
    required this.amount,
    required this.createdAt,
    required this.oderNo,
    required this.orderStatus,
    required this.remark,
    required this.transferUserName,
  });

  factory ProxyProxyQueryTransferRecordListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyQueryTransferRecordListPostRespModelRecord(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        oderNo: jsonRes['oderNo'] == null
            ? ''
            : asT<String>("oderNo", jsonRes['oderNo'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        transferUserName: jsonRes['transferUserName'] == null
            ? ''
            : asT<String>("transferUserName", jsonRes['transferUserName'])!,
      );

  int accountType = 0;
  double amount = 0.0;
  String createdAt = '';
  String oderNo = '';
  int orderStatus = 0;
  String remark = '';
  String transferUserName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'amount': amount,
        'createdAt': createdAt,
        'oderNo': oderNo,
        'orderStatus': orderStatus,
        'remark': remark,
        'transferUserName': transferUserName,
      };
}
