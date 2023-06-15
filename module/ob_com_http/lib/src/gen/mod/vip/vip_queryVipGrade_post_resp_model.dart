import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class VipQueryVipGradePostRespModel {
  VipQueryVipGradePostRespModel({
    required this.data,
  });

  factory VipQueryVipGradePostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<VipQueryVipGradePostRespModelData>? data = jsonRes['data'] is List ? <VipQueryVipGradePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(VipQueryVipGradePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return VipQueryVipGradePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<VipQueryVipGradePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class VipQueryVipGradePostRespModelData {
  VipQueryVipGradePostRespModelData({
    required this.relegationWater,
    required this.id,
    required this.vipGradeName,
    required this.tatalValidWater,
    required this.merchantId,
    required this.vipSerialNum,
    required this.totalDeposit,
    required this.relegationValidPeriod,
  });

  factory VipQueryVipGradePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => VipQueryVipGradePostRespModelData(
        relegationWater: jsonRes['relegationWater'] == null
            ? 0
            : asT<int>("relegationWater", jsonRes['relegationWater'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        vipGradeName: jsonRes['vipGradeName'] == null
            ? ''
            : asT<String>("vipGradeName", jsonRes['vipGradeName'])!,
        tatalValidWater: jsonRes['tatalValidWater'] == null
            ? 0
            : asT<int>("tatalValidWater", jsonRes['tatalValidWater'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? ''
            : asT<String>("vipSerialNum", jsonRes['vipSerialNum'])!,
        totalDeposit: jsonRes['totalDeposit'] == null
            ? 0
            : asT<int>("totalDeposit", jsonRes['totalDeposit'])!,
        relegationValidPeriod: jsonRes['relegationValidPeriod'] == null
            ? 0
            : asT<int>(
                "relegationValidPeriod", jsonRes['relegationValidPeriod'])!,
      );

  int relegationWater = 0;
  int id = 0;
  String vipGradeName = '';
  int tatalValidWater = 0;
  int merchantId = 0;
  String vipSerialNum = '';
  int totalDeposit = 0;
  int relegationValidPeriod = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'relegationWater': relegationWater,
        'id': id,
        'vipGradeName': vipGradeName,
        'tatalValidWater': tatalValidWater,
        'merchantId': merchantId,
        'vipSerialNum': vipSerialNum,
        'totalDeposit': totalDeposit,
        'relegationValidPeriod': relegationValidPeriod,
      };
}
