import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModel {
  ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelSummary.fromJson({})
          : ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelSummary.fromJson(
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
  List<ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord> record;
  ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelSummary summary;
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

class ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord {
  ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord({
    required this.betAmount,
    required this.maxLevels,
    required this.netAmount,
    required this.proxyId,
    required this.proxyLevelId,
    required this.proxyName,
    required this.rushNet,
    required this.totalNetAmount,
  });

  factory ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelRecord(
        betAmount: jsonRes['betAmount'] == null
            ? 0.0
            : asT<double>("betAmount", jsonRes['betAmount'])!,
        maxLevels: jsonRes['maxLevels'] == null
            ? 0
            : asT<int>("maxLevels", jsonRes['maxLevels'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        proxyLevelId: jsonRes['proxyLevelId'] == null
            ? 0
            : asT<int>("proxyLevelId", jsonRes['proxyLevelId'])!,
        proxyName: jsonRes['proxyName'] == null
            ? ''
            : asT<String>("proxyName", jsonRes['proxyName'])!,
        rushNet: jsonRes['rushNet'] == null
            ? 0.0
            : asT<double>("rushNet", jsonRes['rushNet'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
      );

  double betAmount = 0.0;
  int maxLevels = 0;
  double netAmount = 0.0;
  String proxyId = '';
  int proxyLevelId = 0;
  String proxyName = '';
  double rushNet = 0.0;
  double totalNetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'maxLevels': maxLevels,
        'netAmount': netAmount,
        'proxyId': proxyId,
        'proxyLevelId': proxyLevelId,
        'proxyName': proxyName,
        'rushNet': rushNet,
        'totalNetAmount': totalNetAmount,
      };
}

class ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelSummary {
  ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelSummary({
    required this.betAmount,
    required this.directBetAmount,
    required this.directNetAmount,
    required this.directTotalNetAmount,
    required this.netAmount,
    required this.proxyAccountPath,
    required this.proxyId,
    required this.proxyName,
    required this.rushNet,
    required this.totalNetAmount,
  });

  factory ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? proxyAccountPath =
        jsonRes['proxyAccountPath'] is List ? <String>[] : null;
    if (proxyAccountPath != null) {
      for (final dynamic item in jsonRes['proxyAccountPath']!) {
        if (item != null) {
          proxyAccountPath.add(asT<String>("proxyAccountPath", item)!);
        }
      }
    }
    return ProxyMultiAgentProxyQueryProxyNetAmountListPostRespModelSummary(
      betAmount: jsonRes['betAmount'] == null
          ? 0.0
          : asT<double>("betAmount", jsonRes['betAmount'])!,
      directBetAmount: jsonRes['directBetAmount'] == null
          ? 0.0
          : asT<double>("directBetAmount", jsonRes['directBetAmount'])!,
      directNetAmount: jsonRes['directNetAmount'] == null
          ? 0.0
          : asT<double>("directNetAmount", jsonRes['directNetAmount'])!,
      directTotalNetAmount: jsonRes['directTotalNetAmount'] == null
          ? 0.0
          : asT<double>(
              "directTotalNetAmount", jsonRes['directTotalNetAmount'])!,
      netAmount: jsonRes['netAmount'] == null
          ? 0.0
          : asT<double>("netAmount", jsonRes['netAmount'])!,
      proxyAccountPath: proxyAccountPath == null ? [] : proxyAccountPath,
      proxyId: jsonRes['proxyId'] == null
          ? ''
          : asT<String>("proxyId", jsonRes['proxyId'])!,
      proxyName: jsonRes['proxyName'] == null
          ? ''
          : asT<String>("proxyName", jsonRes['proxyName'])!,
      rushNet: jsonRes['rushNet'] == null
          ? 0.0
          : asT<double>("rushNet", jsonRes['rushNet'])!,
      totalNetAmount: jsonRes['totalNetAmount'] == null
          ? 0.0
          : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
    );
  }

  double betAmount = 0.0;
  double directBetAmount = 0.0;
  double directNetAmount = 0.0;
  double directTotalNetAmount = 0.0;
  double netAmount = 0.0;
  List<String> proxyAccountPath;
  String proxyId = '';
  String proxyName = '';
  double rushNet = 0.0;
  double totalNetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'directBetAmount': directBetAmount,
        'directNetAmount': directNetAmount,
        'directTotalNetAmount': directTotalNetAmount,
        'netAmount': netAmount,
        'proxyAccountPath': proxyAccountPath,
        'proxyId': proxyId,
        'proxyName': proxyName,
        'rushNet': rushNet,
        'totalNetAmount': totalNetAmount,
      };
}
