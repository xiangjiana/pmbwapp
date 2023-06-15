import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerProxyAddPostReqModel {
  ProxyLowerProxyAddPostReqModel({
    required this.beginRate,
    required this.commissionContractList,
    required this.contractModel,
    required this.createAccount,
    required this.deviceNo,
    required this.endRate,
    required this.password,
    required this.rebateContractList,
    required this.registerReference,
    required this.userName,
  });

  factory ProxyLowerProxyAddPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyLowerProxyAddPostReqModelCommissionContractList>? commissionContractList =
        jsonRes['commissionContractList'] is List
            ? <ProxyLowerProxyAddPostReqModelCommissionContractList>[]
            : null;
    if (commissionContractList != null) {
      for (final dynamic item in jsonRes['commissionContractList']!) {
        if (item != null) {
          commissionContractList.add(ProxyLowerProxyAddPostReqModelCommissionContractList.fromJson(
              asT<Map<String, dynamic>>("commissionContractList", item)!));
        }
      }
    }

    final List<ProxyLowerProxyAddPostReqModelRebateContractList>? rebateContractList =
        jsonRes['rebateContractList'] is List ? <ProxyLowerProxyAddPostReqModelRebateContractList>[] : null;
    if (rebateContractList != null) {
      for (final dynamic item in jsonRes['rebateContractList']!) {
        if (item != null) {
          rebateContractList.add(ProxyLowerProxyAddPostReqModelRebateContractList.fromJson(
              asT<Map<String, dynamic>>("rebateContractList", item)!));
        }
      }
    }
    return ProxyLowerProxyAddPostReqModel(
      beginRate: jsonRes['beginRate'] == null
          ? 0.0
          : asT<double>("beginRate", jsonRes['beginRate'])!,
      commissionContractList:
          commissionContractList == null ? [] : commissionContractList,
      contractModel: jsonRes['contractModel'] == null
          ? 0
          : asT<int>("contractModel", jsonRes['contractModel'])!,
      createAccount: jsonRes['createAccount'] == null
          ? ''
          : asT<String>("createAccount", jsonRes['createAccount'])!,
      deviceNo: jsonRes['deviceNo'] == null
          ? ''
          : asT<String>("deviceNo", jsonRes['deviceNo'])!,
      endRate: jsonRes['endRate'] == null
          ? 0.0
          : asT<double>("endRate", jsonRes['endRate'])!,
      password: jsonRes['password'] == null
          ? ''
          : asT<String>("password", jsonRes['password'])!,
      rebateContractList: rebateContractList == null ? [] : rebateContractList,
      registerReference: jsonRes['registerReference'] == null
          ? ''
          : asT<String>("registerReference", jsonRes['registerReference'])!,
      userName: jsonRes['userName'] == null
          ? ''
          : asT<String>("userName", jsonRes['userName'])!,
    );
  }

  double beginRate = 0.0;
  List<ProxyLowerProxyAddPostReqModelCommissionContractList> commissionContractList;
  int contractModel = 0;
  String createAccount = '';
  String deviceNo = '';
  double endRate = 0.0;
  String password = '';
  List<ProxyLowerProxyAddPostReqModelRebateContractList> rebateContractList;
  String registerReference = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'beginRate': beginRate,
        'commissionContractList': commissionContractList,
        'contractModel': contractModel,
        'createAccount': createAccount,
        'deviceNo': deviceNo,
        'endRate': endRate,
        'password': password,
        'rebateContractList': rebateContractList,
        'registerReference': registerReference,
        'userName': userName,
      };
}

class ProxyLowerProxyAddPostReqModelCommissionContractList {
  ProxyLowerProxyAddPostReqModelCommissionContractList({
    required this.activeUsers,
    required this.dataSourceType,
    required this.effecactiveUsers,
    required this.level,
    required this.netAmount,
    required this.rebateRate,
    required this.validBetAmount,
  });

  factory ProxyLowerProxyAddPostReqModelCommissionContractList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyLowerProxyAddPostReqModelCommissionContractList(
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
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
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
  double netAmount = 0.0;
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
        'netAmount': netAmount,
        'rebateRate': rebateRate,
        'validBetAmount': validBetAmount,
      };
}

class ProxyLowerProxyAddPostReqModelRebateContractList {
  ProxyLowerProxyAddPostReqModelRebateContractList({
    required this.activeUsers,
    required this.dataSourceType,
    required this.effecactiveUsers,
    required this.level,
    required this.netAmount,
    required this.rebateRate,
    required this.validBetAmount,
  });

  factory ProxyLowerProxyAddPostReqModelRebateContractList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyLowerProxyAddPostReqModelRebateContractList(
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
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
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
  double netAmount = 0.0;
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
        'netAmount': netAmount,
        'rebateRate': rebateRate,
        'validBetAmount': validBetAmount,
      };
}
