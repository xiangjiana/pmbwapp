import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractAddContractPostReqModel {
  ProxyProxyContractAddContractPostReqModel({
    required this.accountType,
    required this.backNote,
    required this.commissionContractList,
    required this.createAccount,
    required this.dataSources,
    required this.parentProxyId,
    required this.parentProxyName,
    required this.rebateContractList,
    required this.signProxyId,
    required this.signProxyLevel,
    required this.signProxyLevelId,
    required this.signProxyName,
  });

  factory ProxyProxyContractAddContractPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractAddContractPostReqModelCommissionContractList>? commissionContractList =
        jsonRes['commissionContractList'] is List
            ? <ProxyProxyContractAddContractPostReqModelCommissionContractList>[]
            : null;
    if (commissionContractList != null) {
      for (final dynamic item in jsonRes['commissionContractList']!) {
        if (item != null) {
          commissionContractList.add(ProxyProxyContractAddContractPostReqModelCommissionContractList.fromJson(
              asT<Map<String, dynamic>>("commissionContractList", item)!));
        }
      }
    }

    final List<ProxyProxyContractAddContractPostReqModelRebateContractList>? rebateContractList =
        jsonRes['rebateContractList'] is List ? <ProxyProxyContractAddContractPostReqModelRebateContractList>[] : null;
    if (rebateContractList != null) {
      for (final dynamic item in jsonRes['rebateContractList']!) {
        if (item != null) {
          rebateContractList.add(ProxyProxyContractAddContractPostReqModelRebateContractList.fromJson(
              asT<Map<String, dynamic>>("rebateContractList", item)!));
        }
      }
    }
    return ProxyProxyContractAddContractPostReqModel(
      accountType: jsonRes['accountType'] == null
          ? 0
          : asT<int>("accountType", jsonRes['accountType'])!,
      backNote: jsonRes['backNote'] == null
          ? ''
          : asT<String>("backNote", jsonRes['backNote'])!,
      commissionContractList:
          commissionContractList == null ? [] : commissionContractList,
      createAccount: jsonRes['createAccount'] == null
          ? ''
          : asT<String>("createAccount", jsonRes['createAccount'])!,
      dataSources: jsonRes['dataSources'] == null
          ? 0
          : asT<int>("dataSources", jsonRes['dataSources'])!,
      parentProxyId: jsonRes['parentProxyId'] == null
          ? ''
          : asT<String>("parentProxyId", jsonRes['parentProxyId'])!,
      parentProxyName: jsonRes['parentProxyName'] == null
          ? ''
          : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
      rebateContractList: rebateContractList == null ? [] : rebateContractList,
      signProxyId: jsonRes['signProxyId'] == null
          ? ''
          : asT<String>("signProxyId", jsonRes['signProxyId'])!,
      signProxyLevel: jsonRes['signProxyLevel'] == null
          ? 0
          : asT<int>("signProxyLevel", jsonRes['signProxyLevel'])!,
      signProxyLevelId: jsonRes['signProxyLevelId'] == null
          ? 0
          : asT<int>("signProxyLevelId", jsonRes['signProxyLevelId'])!,
      signProxyName: jsonRes['signProxyName'] == null
          ? ''
          : asT<String>("signProxyName", jsonRes['signProxyName'])!,
    );
  }

  int accountType = 0;
  String backNote = '';
  List<ProxyProxyContractAddContractPostReqModelCommissionContractList> commissionContractList;
  String createAccount = '';
  int dataSources = 0;
  String parentProxyId = '';
  String parentProxyName = '';
  List<ProxyProxyContractAddContractPostReqModelRebateContractList> rebateContractList;
  String signProxyId = '';
  int signProxyLevel = 0;
  int signProxyLevelId = 0;
  String signProxyName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'backNote': backNote,
        'commissionContractList': commissionContractList,
        'createAccount': createAccount,
        'dataSources': dataSources,
        'parentProxyId': parentProxyId,
        'parentProxyName': parentProxyName,
        'rebateContractList': rebateContractList,
        'signProxyId': signProxyId,
        'signProxyLevel': signProxyLevel,
        'signProxyLevelId': signProxyLevelId,
        'signProxyName': signProxyName,
      };
}

class ProxyProxyContractAddContractPostReqModelCommissionContractList {
  ProxyProxyContractAddContractPostReqModelCommissionContractList({
    required this.activeUsers,
    required this.dataSourceType,
    required this.effecactiveUsers,
    required this.level,
    required this.monthAddActiveCount,
    required this.netAmount,
    required this.parentProxyName,
    required this.rebateRate,
    required this.validBetAmount,
  });

  factory ProxyProxyContractAddContractPostReqModelCommissionContractList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyProxyContractAddContractPostReqModelCommissionContractList(
        activeUsers: jsonRes['activeUsers'] == null
            ? 0
            : asT<int>("activeUsers", jsonRes['activeUsers'])!,
        dataSourceType: jsonRes['dataSourceType'] == null
            ? 0
            : asT<int>("dataSourceType", jsonRes['dataSourceType'])!,
        effecactiveUsers: jsonRes['effecactiveUsers'] == null
            ? 0
            : asT<int>("effecactiveUsers", jsonRes['effecactiveUsers'])!,
        level:
            jsonRes['level'] == null ? 0 : asT<int>("level", jsonRes['level'])!,
        monthAddActiveCount: jsonRes['monthAddActiveCount'] == null
            ? 0
            : asT<int>("monthAddActiveCount", jsonRes['monthAddActiveCount'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        parentProxyName: jsonRes['parentProxyName'] == null
            ? ''
            : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
        rebateRate: jsonRes['rebateRate'] == null
            ? 0.0
            : asT<double>("rebateRate", jsonRes['rebateRate'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
      );

  int activeUsers = 0;
  int dataSourceType = 0;
  int effecactiveUsers = 0;
  int level = 0;
  int monthAddActiveCount = 0;
  double netAmount = 0.0;
  String parentProxyName = '';
  double rebateRate = 0.0;
  double validBetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activeUsers': activeUsers,
        'dataSourceType': dataSourceType,
        'effecactiveUsers': effecactiveUsers,
        'level': level,
        'monthAddActiveCount': monthAddActiveCount,
        'netAmount': netAmount,
        'parentProxyName': parentProxyName,
        'rebateRate': rebateRate,
        'validBetAmount': validBetAmount,
      };
}

class ProxyProxyContractAddContractPostReqModelRebateContractList {
  ProxyProxyContractAddContractPostReqModelRebateContractList({
    required this.activeUsers,
    required this.dataSourceType,
    required this.effecactiveUsers,
    required this.level,
    required this.monthAddActiveCount,
    required this.netAmount,
    required this.parentProxyName,
    required this.rebateRate,
    required this.validBetAmount,
  });

  factory ProxyProxyContractAddContractPostReqModelRebateContractList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyProxyContractAddContractPostReqModelRebateContractList(
        activeUsers: jsonRes['activeUsers'] == null
            ? 0
            : asT<int>("activeUsers", jsonRes['activeUsers'])!,
        dataSourceType: jsonRes['dataSourceType'] == null
            ? 0
            : asT<int>("dataSourceType", jsonRes['dataSourceType'])!,
        effecactiveUsers: jsonRes['effecactiveUsers'] == null
            ? 0
            : asT<int>("effecactiveUsers", jsonRes['effecactiveUsers'])!,
        level:
            jsonRes['level'] == null ? 0 : asT<int>("level", jsonRes['level'])!,
        monthAddActiveCount: jsonRes['monthAddActiveCount'] == null
            ? 0
            : asT<int>("monthAddActiveCount", jsonRes['monthAddActiveCount'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        parentProxyName: jsonRes['parentProxyName'] == null
            ? ''
            : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
        rebateRate: jsonRes['rebateRate'] == null
            ? 0
            : asT<int>("rebateRate", jsonRes['rebateRate'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
      );

  int activeUsers = 0;
  int dataSourceType = 0;
  int effecactiveUsers = 0;
  int level = 0;
  int monthAddActiveCount = 0;
  double netAmount = 0.0;
  String parentProxyName = '';
  int rebateRate = 0;
  double validBetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activeUsers': activeUsers,
        'dataSourceType': dataSourceType,
        'effecactiveUsers': effecactiveUsers,
        'level': level,
        'monthAddActiveCount': monthAddActiveCount,
        'netAmount': netAmount,
        'parentProxyName': parentProxyName,
        'rebateRate': rebateRate,
        'validBetAmount': validBetAmount,
      };
}
