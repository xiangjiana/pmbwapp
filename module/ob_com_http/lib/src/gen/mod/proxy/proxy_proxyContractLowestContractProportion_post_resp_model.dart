import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractLowestContractProportionPostRespModel {
  ProxyProxyContractLowestContractProportionPostRespModel({
    required this.data,
  });

  factory ProxyProxyContractLowestContractProportionPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractLowestContractProportionPostRespModelData>? data = jsonRes['data'] is List ? <ProxyProxyContractLowestContractProportionPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyProxyContractLowestContractProportionPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyProxyContractLowestContractProportionPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyProxyContractLowestContractProportionPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyProxyContractLowestContractProportionPostRespModelData {
  ProxyProxyContractLowestContractProportionPostRespModelData({
    required this.contractSort,
    required this.contractType,
    required this.gameFlow,
    required this.gameLoss,
    required this.id,
    required this.merchantId,
    required this.monthActiveCount,
    required this.monthAddActiveCount,
    required this.monthEffectiveActiveCount,
    required this.rebateRatio,
  });

  factory ProxyProxyContractLowestContractProportionPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyContractLowestContractProportionPostRespModelData(
        contractSort: jsonRes['contractSort'] == null
            ? 0
            : asT<int>("contractSort", jsonRes['contractSort'])!,
        contractType: jsonRes['contractType'] == null
            ? 0
            : asT<int>("contractType", jsonRes['contractType'])!,
        gameFlow: jsonRes['gameFlow'] == null
            ? 0.0
            : asT<double>("gameFlow", jsonRes['gameFlow'])!,
        gameLoss: jsonRes['gameLoss'] == null
            ? 0.0
            : asT<double>("gameLoss", jsonRes['gameLoss'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
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

  int contractSort = 0;
  int contractType = 0;
  double gameFlow = 0.0;
  double gameLoss = 0.0;
  String id = '';
  String merchantId = '';
  int monthActiveCount = 0;
  int monthAddActiveCount = 0;
  int monthEffectiveActiveCount = 0;
  double rebateRatio = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractSort': contractSort,
        'contractType': contractType,
        'gameFlow': gameFlow,
        'gameLoss': gameLoss,
        'id': id,
        'merchantId': merchantId,
        'monthActiveCount': monthActiveCount,
        'monthAddActiveCount': monthAddActiveCount,
        'monthEffectiveActiveCount': monthEffectiveActiveCount,
        'rebateRatio': rebateRatio,
      };
}
