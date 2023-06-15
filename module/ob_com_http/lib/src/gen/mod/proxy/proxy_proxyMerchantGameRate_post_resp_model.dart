import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMerchantGameRatePostRespModel {
  ProxyProxyMerchantGameRatePostRespModel({
    required this.data,
  });

  factory ProxyProxyMerchantGameRatePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyMerchantGameRatePostRespModelData>? data = jsonRes['data'] is List ? <ProxyProxyMerchantGameRatePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyProxyMerchantGameRatePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyProxyMerchantGameRatePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyProxyMerchantGameRatePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyProxyMerchantGameRatePostRespModelData {
  ProxyProxyMerchantGameRatePostRespModelData({
    required this.feeRate,
    required this.gameCode,
    required this.gameName,
  });

  factory ProxyProxyMerchantGameRatePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyMerchantGameRatePostRespModelData(
        feeRate: jsonRes['feeRate'] == null
            ? 0
            : asT<int>("feeRate", jsonRes['feeRate'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
      );

  int feeRate = 0;
  String gameCode = '';
  String gameName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'feeRate': feeRate,
        'gameCode': gameCode,
        'gameName': gameName,
      };
}
