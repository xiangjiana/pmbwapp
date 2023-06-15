import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayListPostRespModel {
  TypayListPostRespModel({
    required this.payTypes,
  });

  factory TypayListPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<TypayListPostRespModelPayTypes>? payTypes =
    jsonRes['payTypes'] is List ? <TypayListPostRespModelPayTypes>[] : null;
    if (payTypes != null) {
      for (final dynamic item in jsonRes['payTypes']!) {
        if (item != null) {
          payTypes.add(
              TypayListPostRespModelPayTypes.fromJson(asT<Map<String, dynamic>>("payTypes", item)!));
        }
      }
    }
    return TypayListPostRespModel(
      payTypes: payTypes == null ? [] : payTypes,
    );
  }

  List<TypayListPostRespModelPayTypes> payTypes;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'payTypes': payTypes,
  };
}

class TypayListPostRespModelPayTypes {
  TypayListPostRespModelPayTypes({
    required this.activityDiscountScale,
    required this.activityGiveMaxMoney,
    required this.dcProtocol,
    required this.depositMaxAmount,
    required this.depositMinAmount,
    required this.fixedAmount,
    required this.linkType,
    required this.payTypeId,
  });

  factory TypayListPostRespModelPayTypes.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? dcProtocol =
    jsonRes['dcProtocol'] is List ? <String>[] : null;
    if (dcProtocol != null) {
      for (final dynamic item in jsonRes['dcProtocol']!) {
        if (item != null) {
          dcProtocol.add(asT<String>("dcProtocol", item)!);
        }
      }
    }

    final List<String>? fixedAmount =
    jsonRes['fixedAmount'] is List ? <String>[] : null;
    if (fixedAmount != null) {
      for (final dynamic item in jsonRes['fixedAmount']!) {
        if (item != null) {
          fixedAmount.add(asT<String>("fixedAmount", item)!);
        }
      }
    }
    return TypayListPostRespModelPayTypes(
      activityDiscountScale: jsonRes['activityDiscountScale'] == null
          ? ''
          : asT<String>(
          "activityDiscountScale", jsonRes['activityDiscountScale'])!,
      activityGiveMaxMoney: jsonRes['activityGiveMaxMoney'] == null
          ? 0
          : asT<double>("activityGiveMaxMoney", jsonRes['activityGiveMaxMoney'])!,
      dcProtocol: dcProtocol == null ? [] : dcProtocol,
      depositMaxAmount: jsonRes['depositMaxAmount'] == null
          ? 0
          : asT<int>("depositMaxAmount", jsonRes['depositMaxAmount'])!,
      depositMinAmount: jsonRes['depositMinAmount'] == null
          ? 0
          : asT<int>("depositMinAmount", jsonRes['depositMinAmount'])!,
      fixedAmount: fixedAmount == null ? [] : fixedAmount,
      linkType: jsonRes['linkType'] == null
          ? 0
          : asT<int>("linkType", jsonRes['linkType'])!,
      payTypeId: jsonRes['payTypeId'] == null
          ? 0
          : asT<int>("payTypeId", jsonRes['payTypeId'])!,
    );
  }

  String activityDiscountScale = '';
  double activityGiveMaxMoney = 0;
  List<String> dcProtocol;
  int depositMaxAmount = 0;
  int depositMinAmount = 0;
  List<String> fixedAmount;
  int linkType = 0;
  int payTypeId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'activityDiscountScale': activityDiscountScale,
    'activityGiveMaxMoney': activityGiveMaxMoney,
    'dcProtocol': dcProtocol,
    'depositMaxAmount': depositMaxAmount,
    'depositMinAmount': depositMinAmount,
    'fixedAmount': fixedAmount,
    'linkType': linkType,
    'payTypeId': payTypeId,
  };
}
