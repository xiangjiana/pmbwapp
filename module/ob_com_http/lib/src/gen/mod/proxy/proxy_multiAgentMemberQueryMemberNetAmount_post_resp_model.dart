import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentMemberQueryMemberNetAmountPostRespModel {
  ProxyMultiAgentMemberQueryMemberNetAmountPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyMultiAgentMemberQueryMemberNetAmountPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyMultiAgentMemberQueryMemberNetAmountPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelSummary.fromJson({})
          : ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelSummary.fromJson(
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
  List<ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord> record;
  ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelSummary summary;
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

class ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord {
  ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord({
    required this.betAmount,
    required this.memberId,
    required this.netAmount,
    required this.parentProxyId,
    required this.totalNetAmount,
    required this.userName,
  });

  factory ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelRecord(
        betAmount: jsonRes['betAmount'] == null
            ? 0.0
            : asT<double>("betAmount", jsonRes['betAmount'])!,
        memberId: jsonRes['memberId'] == null
            ? ''
            : asT<String>("memberId", jsonRes['memberId'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        parentProxyId: jsonRes['parentProxyId'] == null
            ? ''
            : asT<String>("parentProxyId", jsonRes['parentProxyId'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  double betAmount = 0.0;
  String memberId = '';
  double netAmount = 0.0;
  String parentProxyId = '';
  double totalNetAmount = 0.0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'memberId': memberId,
        'netAmount': netAmount,
        'parentProxyId': parentProxyId,
        'totalNetAmount': totalNetAmount,
        'userName': userName,
      };
}

class ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelSummary {
  ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelSummary({
    required this.betAmount,
    required this.netAmount,
    required this.totalNetAmount,
  });

  factory ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) => ProxyMultiAgentMemberQueryMemberNetAmountPostRespModelSummary(
        betAmount: jsonRes['betAmount'] == null
            ? 0.0
            : asT<double>("betAmount", jsonRes['betAmount'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
      );

  double betAmount = 0.0;
  double netAmount = 0.0;
  double totalNetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'netAmount': netAmount,
        'totalNetAmount': totalNetAmount,
      };
}
