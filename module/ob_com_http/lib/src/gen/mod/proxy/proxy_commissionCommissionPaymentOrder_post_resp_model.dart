import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyCommissionCommissionPaymentOrderPostRespModel {
  ProxyCommissionCommissionPaymentOrderPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyCommissionCommissionPaymentOrderPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyCommissionCommissionPaymentOrderPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyCommissionCommissionPaymentOrderPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyCommissionCommissionPaymentOrderPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyCommissionCommissionPaymentOrderPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? ProxyCommissionCommissionPaymentOrderPostRespModelSummary.fromJson({})
          : ProxyCommissionCommissionPaymentOrderPostRespModelSummary.fromJson(
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
  List<ProxyCommissionCommissionPaymentOrderPostRespModelRecord> record;
  ProxyCommissionCommissionPaymentOrderPostRespModelSummary summary;
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

class ProxyCommissionCommissionPaymentOrderPostRespModelRecord {
  ProxyCommissionCommissionPaymentOrderPostRespModelRecord({
    required this.orderNo,
    required this.proxyAccount,
    required this.proxyId,
    required this.transAmount,
    required this.transDate,
    required this.transStatus,
  });

  factory ProxyCommissionCommissionPaymentOrderPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyCommissionCommissionPaymentOrderPostRespModelRecord(
        orderNo: jsonRes['orderNo'] == null
            ? ''
            : asT<String>("orderNo", jsonRes['orderNo'])!,
        proxyAccount: jsonRes['proxyAccount'] == null
            ? ''
            : asT<String>("proxyAccount", jsonRes['proxyAccount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        transAmount: jsonRes['transAmount'] == null
            ? 0.0
            : asT<double>("transAmount", jsonRes['transAmount'])!,
        transDate: jsonRes['transDate'] == null
            ? ''
            : asT<String>("transDate", jsonRes['transDate'])!,
        transStatus: jsonRes['transStatus'] == null
            ? 0
            : asT<int>("transStatus", jsonRes['transStatus'])!,
      );

  String orderNo = '';
  String proxyAccount = '';
  String proxyId = '';
  double transAmount = 0.0;
  String transDate = '';
  int transStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderNo': orderNo,
        'proxyAccount': proxyAccount,
        'proxyId': proxyId,
        'transAmount': transAmount,
        'transDate': transDate,
        'transStatus': transStatus,
      };
}

class ProxyCommissionCommissionPaymentOrderPostRespModelSummary {
  ProxyCommissionCommissionPaymentOrderPostRespModelSummary({
    required this.paidAmount,
    required this.unPayAmount,
  });

  factory ProxyCommissionCommissionPaymentOrderPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) => ProxyCommissionCommissionPaymentOrderPostRespModelSummary(
        paidAmount: jsonRes['paidAmount'] == null
            ? 0.0
            : asT<double>("paidAmount", jsonRes['paidAmount'])!,
        unPayAmount: jsonRes['unPayAmount'] == null
            ? 0.0
            : asT<double>("unPayAmount", jsonRes['unPayAmount'])!,
      );

  double paidAmount = 0.0;
  double unPayAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'paidAmount': paidAmount,
        'unPayAmount': unPayAmount,
      };
}
