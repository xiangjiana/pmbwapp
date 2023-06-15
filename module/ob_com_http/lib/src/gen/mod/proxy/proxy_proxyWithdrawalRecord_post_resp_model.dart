import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyWithdrawalRecordPostRespModel {
  ProxyProxyWithdrawalRecordPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyWithdrawalRecordPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyWithdrawalRecordPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyWithdrawalRecordPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyWithdrawalRecordPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyWithdrawalRecordPostRespModel(
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
  List<ProxyProxyWithdrawalRecordPostRespModelRecord> record;
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

class ProxyProxyWithdrawalRecordPostRespModelRecord {
  ProxyProxyWithdrawalRecordPostRespModelRecord({
    required this.createdAt,
    required this.eventId,
    required this.orderAmount,
    required this.orderStatus,
    required this.userName,
    required this.withdrawAccountName,
    required this.withdrawAccountNo,
    required this.withdrawBank,
    required this.withdrawBankAddress,
    required this.withdrawType,
    required this.remark,
  });

  factory ProxyProxyWithdrawalRecordPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyWithdrawalRecordPostRespModelRecord(
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
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
        withdrawAccountName: jsonRes['withdrawAccountName'] == null
            ? ''
            : asT<String>(
                "withdrawAccountName", jsonRes['withdrawAccountName'])!,
        withdrawAccountNo: jsonRes['withdrawAccountNo'] == null
            ? ''
            : asT<String>("withdrawAccountNo", jsonRes['withdrawAccountNo'])!,
        withdrawBank: jsonRes['withdrawBank'] == null
            ? ''
            : asT<String>("withdrawBank", jsonRes['withdrawBank'])!,
        withdrawBankAddress: jsonRes['withdrawBankAddress'] == null
            ? ''
            : asT<String>(
                "withdrawBankAddress", jsonRes['withdrawBankAddress'])!,
        withdrawType: jsonRes['withdrawType'] == null
            ? 0
            : asT<int>("withdrawType", jsonRes['withdrawType'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  String createdAt = '';
  String eventId = '';
  int orderAmount = 0;
  int orderStatus = 0;
  String userName = '';
  String withdrawAccountName = '';
  String withdrawAccountNo = '';
  String withdrawBank = '';
  String withdrawBankAddress = '';
  int withdrawType = 0;
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'eventId': eventId,
        'orderAmount': orderAmount,
        'orderStatus': orderStatus,
        'userName': userName,
        'withdrawAccountName': withdrawAccountName,
        'withdrawAccountNo': withdrawAccountNo,
        'withdrawBank': withdrawBank,
        'withdrawBankAddress': withdrawBankAddress,
        'withdrawType': withdrawType,
        'remark': remark,
      };
}
