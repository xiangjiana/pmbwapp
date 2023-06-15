import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractResendContractPostReqModel {
  ProxyProxyContractResendContractPostReqModel({
    required this.contractDetailRespList,
    required this.contractId,
    required this.proxyId,
  });

  factory ProxyProxyContractResendContractPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractResendContractPostReqModelContractDetailRespList>? contractDetailRespList =
        jsonRes['contractDetailRespList'] is List
            ? <ProxyProxyContractResendContractPostReqModelContractDetailRespList>[]
            : null;
    if (contractDetailRespList != null) {
      for (final dynamic item in jsonRes['contractDetailRespList']!) {
        if (item != null) {
          contractDetailRespList.add(ProxyProxyContractResendContractPostReqModelContractDetailRespList.fromJson(
              asT<Map<String, dynamic>>("contractDetailRespList", item)!));
        }
      }
    }
    return ProxyProxyContractResendContractPostReqModel(
      contractDetailRespList:
          contractDetailRespList == null ? [] : contractDetailRespList,
      contractId: jsonRes['contractId'] == null
          ? 0
          : asT<int>("contractId", jsonRes['contractId'])!,
      proxyId: jsonRes['proxyId'] == null
          ? 0
          : asT<int>("proxyId", jsonRes['proxyId'])!,
    );
  }

  List<ProxyProxyContractResendContractPostReqModelContractDetailRespList> contractDetailRespList;
  int contractId = 0;
  int proxyId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractDetailRespList': contractDetailRespList,
        'contractId': contractId,
        'proxyId': proxyId,
      };
}

class ProxyProxyContractResendContractPostReqModelContractDetailRespList {
  ProxyProxyContractResendContractPostReqModelContractDetailRespList({
    required this.gameFlow,
    required this.gameLoss,
    required this.id,
    required this.monthActiveCount,
    required this.monthEffectiveActiveCount,
    required this.rebateRatio,
  });

  factory ProxyProxyContractResendContractPostReqModelContractDetailRespList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyProxyContractResendContractPostReqModelContractDetailRespList(
        gameFlow: jsonRes['gameFlow'] == null
            ? 0
            : asT<int>("gameFlow", jsonRes['gameFlow'])!,
        gameLoss: jsonRes['gameLoss'] == null
            ? 0
            : asT<int>("gameLoss", jsonRes['gameLoss'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        monthActiveCount: jsonRes['monthActiveCount'] == null
            ? 0
            : asT<int>("monthActiveCount", jsonRes['monthActiveCount'])!,
        monthEffectiveActiveCount: jsonRes['monthEffectiveActiveCount'] == null
            ? 0
            : asT<int>("monthEffectiveActiveCount",
                jsonRes['monthEffectiveActiveCount'])!,
        rebateRatio: jsonRes['rebateRatio'] == null
            ? 0
            : asT<int>("rebateRatio", jsonRes['rebateRatio'])!,
      );

  int gameFlow = 0;
  int gameLoss = 0;
  int id = 0;
  int monthActiveCount = 0;
  int monthEffectiveActiveCount = 0;
  int rebateRatio = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameFlow': gameFlow,
        'gameLoss': gameLoss,
        'id': id,
        'monthActiveCount': monthActiveCount,
        'monthEffectiveActiveCount': monthEffectiveActiveCount,
        'rebateRatio': rebateRatio,
      };
}
