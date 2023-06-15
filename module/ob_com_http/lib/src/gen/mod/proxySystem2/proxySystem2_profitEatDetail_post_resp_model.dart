import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }


class ProxySystem2ProfitEatDetailPostRespModel {
  ProxySystem2ProfitEatDetailPostRespModel({
    required this.dtoList,
    required this.eatProfitAmount,
    required this.eatProfitCount,
    required this.finalProfitAmount,
    required this.platformCommissionAmount,
  });

  factory ProxySystem2ProfitEatDetailPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<DtoList>? dtoList =
    jsonRes['dtoList'] is List ? <DtoList>[] : null;
    if (dtoList != null) {
      for (final dynamic item in jsonRes['dtoList']!) {
        if (item != null) {
          dtoList.add(
              DtoList.fromJson(asT<Map<String, dynamic>>("dtoList", item)!));
        }
      }
    }
    return ProxySystem2ProfitEatDetailPostRespModel(
      dtoList: dtoList == null ? [] : dtoList,
      eatProfitAmount: jsonRes['eatProfitAmount'] == null
          ? 0.0
          : asT<double>("eatProfitAmount", jsonRes['eatProfitAmount'])!,
      eatProfitCount: jsonRes['eatProfitCount'] == null
          ? 0
          : asT<int>("eatProfitCount", jsonRes['eatProfitCount'])!,
      finalProfitAmount: jsonRes['finalProfitAmount'] == null
          ? 0.0
          : asT<double>("finalProfitAmount", jsonRes['finalProfitAmount'])!,
      platformCommissionAmount: jsonRes['platformCommissionAmount'] == null
          ? 0.0
          : asT<double>(
          "platformCommissionAmount", jsonRes['platformCommissionAmount'])!,
    );
  }

  List<DtoList> dtoList;
  double eatProfitAmount = 0.0;
  int eatProfitCount = 0;
  double finalProfitAmount = 0.0;
  double platformCommissionAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'dtoList': dtoList,
    'eatProfitAmount': eatProfitAmount,
    'eatProfitCount': eatProfitCount,
    'finalProfitAmount': finalProfitAmount,
    'platformCommissionAmount': platformCommissionAmount,
  };
}

class DtoList {
  DtoList({
    required this.eatProfitAmount,
    required this.platformCommissionAmount,
    required this.venueId,
    required this.venueName,
    required this.venueRate,
  });

  factory DtoList.fromJson(Map<String, dynamic> jsonRes) => DtoList(
    eatProfitAmount: jsonRes['eatProfitAmount'] == null
        ? 0.0
        : asT<double>("eatProfitAmount", jsonRes['eatProfitAmount'])!,
    platformCommissionAmount: jsonRes['platformCommissionAmount'] == null
        ? 0.0
        : asT<double>("platformCommissionAmount",
        jsonRes['platformCommissionAmount'])!,
    venueId: jsonRes['venueId'] == null
        ? 0
        : asT<int>("venueId", jsonRes['venueId'])!,
    venueName: jsonRes['venueName'] == null
        ? ''
        : asT<String>("venueName", jsonRes['venueName'])!,
    venueRate: jsonRes['venueRate'] == null
        ? ''
        : asT<String>("venueRate", jsonRes['venueRate'])!,
  );

  double eatProfitAmount = 0.0;
  double platformCommissionAmount =  0.0;
  int venueId = 0;
  String venueName = '';
  String venueRate = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'eatProfitAmount': eatProfitAmount,
    'platformCommissionAmount': platformCommissionAmount,
    'venueId': venueId,
    'venueName': venueName,
    'venueRate': venueRate,
  };
}
