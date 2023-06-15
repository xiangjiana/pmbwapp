import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractContractRulePostRespModel {
  ProxyProxyContractContractRulePostRespModel({
    required this.data,
  });

  factory ProxyProxyContractContractRulePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractContractRulePostRespModelData>? data = jsonRes['data'] is List ? <ProxyProxyContractContractRulePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyProxyContractContractRulePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyProxyContractContractRulePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyProxyContractContractRulePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyProxyContractContractRulePostRespModelData {
  ProxyProxyContractContractRulePostRespModelData({
    required this.gameFlow,
    required this.gameLoss,
    required this.id,
    required this.level,
    required this.monthActiveCount,
    required this.monthAddActiveCount,
    required this.monthEffectiveActiveCount,
    required this.rebateRatio,
  });

  factory ProxyProxyContractContractRulePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyContractContractRulePostRespModelData(
        gameFlow: jsonRes['gameFlow'] == null
            ? 0.0
            : asT<double>("gameFlow", jsonRes['gameFlow'])!,
        gameLoss: jsonRes['gameLoss'] == null
            ? 0.0
            : asT<double>("gameLoss", jsonRes['gameLoss'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        level:
            jsonRes['level'] == null ? 0 : asT<int>("level", jsonRes['level'])!,
        monthActiveCount: jsonRes['monthActiveCount'] == null
            ? 0
            : asT<int>("monthActiveCount", jsonRes['monthActiveCount'])!,
        monthAddActiveCount: jsonRes['monthAddActiveCount'] == null
            ? 0
            : asT<int>("monthAddActiveCount", jsonRes['monthAddActiveCount'])!,
        monthEffectiveActiveCount: jsonRes['monthEffectiveActiveCount'] == null
            ? 0
            : asT<int>("monthEffectiveActiveCount",
                jsonRes['monthEffectiveActiveCount'])!,
        rebateRatio: jsonRes['rebateRatio'] == null
            ? 0.0
            : asT<double>("rebateRatio", jsonRes['rebateRatio'])!,
      );

  double gameFlow = 0.0;
  double gameLoss = 0.0;
  int id = 0;
  int level = 0;
  int monthActiveCount = 0;
  int monthAddActiveCount = 0;
  int monthEffectiveActiveCount = 0;
  double rebateRatio = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameFlow': gameFlow,
        'gameLoss': gameLoss,
        'id': id,
        'level': level,
        'monthActiveCount': monthActiveCount,
        'monthAddActiveCount': monthAddActiveCount,
        'monthEffectiveActiveCount': monthEffectiveActiveCount,
        'rebateRatio': rebateRatio,
      };
}
