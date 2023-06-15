import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyRebateListPagePostRespModel {
  ProxyRebateListPagePostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyRebateListPagePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyRebateListPagePostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyRebateListPagePostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyRebateListPagePostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyRebateListPagePostRespModel(
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
  List<ProxyRebateListPagePostRespModelRecord> record;
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

class ProxyRebateListPagePostRespModelRecord {
  ProxyRebateListPagePostRespModelRecord({
    required this.activeNum,
    required this.childRebateAmount,
    required this.contractId,
    required this.contractLevel,
    required this.effecactiveActiveNumNew,
    required this.maxLevels,
    required this.payoutStatus,
    required this.personRebateAmount,
    required this.proxyAccount,
    required this.proxyId,
    required this.proxyLevelId,
    required this.rebateAmount,
    required this.rebateRate,
    required this.reportDate,
    required this.totalAdjustBetAmount,
    required this.totalValidBetAmount,
    required this.totalRealBetAmount,
  });

  factory ProxyRebateListPagePostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyRebateListPagePostRespModelRecord(
        activeNum: jsonRes['activeNum'] == null
            ? 0
            : asT<int>("activeNum", jsonRes['activeNum'])!,
        childRebateAmount: jsonRes['childRebateAmount'] == null
            ? 0.0
            : asT<double>("childRebateAmount", jsonRes['childRebateAmount'])!,
        contractId: jsonRes['contractId'] == null
            ? ''
            : asT<String>("contractId", jsonRes['contractId'])!,
        contractLevel: jsonRes['contractLevel'] == null
            ? 0
            : asT<int>("contractLevel", jsonRes['contractLevel'])!,
        effecactiveActiveNumNew: jsonRes['effecactiveActiveNumNew'] == null
            ? 0
            : asT<int>(
                "effecactiveActiveNumNew", jsonRes['effecactiveActiveNumNew'])!,
        maxLevels: jsonRes['maxLevels'] == null
            ? 0
            : asT<int>("maxLevels", jsonRes['maxLevels'])!,
        payoutStatus: jsonRes['payoutStatus'] == null
            ? 0
            : asT<int>("payoutStatus", jsonRes['payoutStatus'])!,
        personRebateAmount: jsonRes['personRebateAmount'] == null
            ? 0.0
            : asT<double>("personRebateAmount", jsonRes['personRebateAmount'])!,
        proxyAccount: jsonRes['proxyAccount'] == null
            ? ''
            : asT<String>("proxyAccount", jsonRes['proxyAccount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        proxyLevelId: jsonRes['proxyLevelId'] == null
            ? 0
            : asT<int>("proxyLevelId", jsonRes['proxyLevelId'])!,
        rebateAmount: jsonRes['rebateAmount'] == null
            ? 0.0
            : asT<double>("rebateAmount", jsonRes['rebateAmount'])!,
        rebateRate: jsonRes['rebateRate'] == null
            ? 0.0
            : asT<double>("rebateRate", jsonRes['rebateRate'])!,
        reportDate: jsonRes['reportDate'] == null
            ? 0
            : asT<int>("reportDate", jsonRes['reportDate'])!,
        totalAdjustBetAmount: jsonRes['totalAdjustBetAmount'] == null
            ? 0.0
            : asT<double>(
                "totalAdjustBetAmount", jsonRes['totalAdjustBetAmount'])!,
        totalValidBetAmount: jsonRes['totalValidBetAmount'] == null
            ? 0.0
            : asT<double>(
                "totalValidBetAmount", jsonRes['totalValidBetAmount'])!,
        totalRealBetAmount: jsonRes['totalRealBetAmount'] == null
            ? 0.0
            : asT<double>("totalRealBetAmount", jsonRes['totalRealBetAmount'])!,
      );

  int activeNum = 0;
  double childRebateAmount = 0.0;
  String contractId = '';
  int contractLevel = 0;
  int effecactiveActiveNumNew = 0;
  int maxLevels = 0;
  int payoutStatus = 0;
  double personRebateAmount = 0.0;
  String proxyAccount = '';
  String proxyId = '';
  int proxyLevelId = 0;
  double rebateAmount = 0.0;
  double rebateRate = 0.0;
  int reportDate = 0;
  double totalAdjustBetAmount = 0.0;
  double totalValidBetAmount = 0.0;
  double totalRealBetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activeNum': activeNum,
        'childRebateAmount': childRebateAmount,
        'contractId': contractId,
        'contractLevel': contractLevel,
        'effecactiveActiveNumNew': effecactiveActiveNumNew,
        'maxLevels': maxLevels,
        'payoutStatus': payoutStatus,
        'personRebateAmount': personRebateAmount,
        'proxyAccount': proxyAccount,
        'proxyId': proxyId,
        'proxyLevelId': proxyLevelId,
        'rebateAmount': rebateAmount,
        'rebateRate': rebateRate,
        'reportDate': reportDate,
        'totalAdjustBetAmount': totalAdjustBetAmount,
        'totalValidBetAmount': totalValidBetAmount,
        'totalRealBetAmount': totalRealBetAmount,
      };
}
