import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyVipGradeGetVipGradePostRespModel {
  ProxyVipGradeGetVipGradePostRespModel({
    required this.data,
  });

  factory ProxyVipGradeGetVipGradePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyVipGradeGetVipGradePostRespModelData>? data = jsonRes['data'] is List ? <ProxyVipGradeGetVipGradePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyVipGradeGetVipGradePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyVipGradeGetVipGradePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyVipGradeGetVipGradePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyVipGradeGetVipGradePostRespModelData {
  ProxyVipGradeGetVipGradePostRespModelData({
    required this.additionalCommission,
    required this.additionalCommissionLimit,
    required this.displayOrder,
    required this.giveJackpot,
    required this.monthActiveNum,
    required this.monthNewNum,
    required this.proxyGradeName,
  });

  factory ProxyVipGradeGetVipGradePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ProxyVipGradeGetVipGradePostRespModelData(
        additionalCommission: jsonRes['additionalCommission'] == null
            ? 0.0
            : asT<double>(
                "additionalCommission", jsonRes['additionalCommission'])!,
        additionalCommissionLimit: jsonRes['additionalCommissionLimit'] == null
            ? 0.0
            : asT<double>("additionalCommissionLimit",
                jsonRes['additionalCommissionLimit'])!,
        displayOrder: jsonRes['displayOrder'] == null
            ? 0
            : asT<int>("displayOrder", jsonRes['displayOrder'])!,
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
  int displayOrder = 0;
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
        'displayOrder': displayOrder,
        'giveJackpot': giveJackpot,
        'monthActiveNum': monthActiveNum,
        'monthNewNum': monthNewNum,
        'proxyGradeName': proxyGradeName,
      };
}
