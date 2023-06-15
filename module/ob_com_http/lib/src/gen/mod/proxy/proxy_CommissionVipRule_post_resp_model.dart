import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyCommissionVipRulePostRespModel {
  ProxyCommissionVipRulePostRespModel({
    required this.data,
  });

  factory ProxyCommissionVipRulePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyCommissionVipRulePostRespModelData>? data = jsonRes['data'] is List ? <ProxyCommissionVipRulePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyCommissionVipRulePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyCommissionVipRulePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyCommissionVipRulePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyCommissionVipRulePostRespModelData {
  ProxyCommissionVipRulePostRespModelData({
    required this.additionalCommission,
    required this.additionalCommissionLimit,
    required this.giveJackpot,
    required this.monthActiveNum,
    required this.monthNewNum,
    required this.proxyGradeName,
  });

  factory ProxyCommissionVipRulePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ProxyCommissionVipRulePostRespModelData(
        additionalCommission: jsonRes['additionalCommission'] == null
            ? 0.0
            : asT<double>(
                "additionalCommission", jsonRes['additionalCommission'])!,
        additionalCommissionLimit: jsonRes['additionalCommissionLimit'] == null
            ? 0.0
            : asT<double>("additionalCommissionLimit",
                jsonRes['additionalCommissionLimit'])!,
        giveJackpot: jsonRes['giveJackpot'] == null
            ? 0.0
            : asT<double>("giveJackpot", jsonRes['giveJackpot'])!,
        monthActiveNum: jsonRes['monthActiveNum'] == null
            ? ''
            : asT<String>("monthActiveNum", jsonRes['monthActiveNum'])!,
        monthNewNum: jsonRes['monthNewNum'] == null
            ? ''
            : asT<String>("monthNewNum", jsonRes['monthNewNum'])!,
        proxyGradeName: jsonRes['proxyGradeName'] == null
            ? ''
            : asT<String>("proxyGradeName", jsonRes['proxyGradeName'])!,
      );

  double additionalCommission = 0.0;
  double additionalCommissionLimit = 0.0;
  double giveJackpot = 0.0;
  String monthActiveNum = '';
  String monthNewNum = '';
  String proxyGradeName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'additionalCommission': additionalCommission,
        'additionalCommissionLimit': additionalCommissionLimit,
        'giveJackpot': giveJackpot,
        'monthActiveNum': monthActiveNum,
        'monthNewNum': monthNewNum,
        'proxyGradeName': proxyGradeName,
      };
}
