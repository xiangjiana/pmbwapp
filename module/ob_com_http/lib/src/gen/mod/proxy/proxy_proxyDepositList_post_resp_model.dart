import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyDepositListPostRespModel {
  ProxyProxyDepositListPostRespModel({
    required this.payTypes,
  });

  factory ProxyProxyDepositListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<PayTypes>? payTypes =
        jsonRes['payTypes'] is List ? <PayTypes>[] : null;
    if (payTypes != null) {
      for (final dynamic item in jsonRes['payTypes']!) {
        if (item != null) {
          payTypes.add(
              PayTypes.fromJson(asT<Map<String, dynamic>>("payTypes", item)!));
        }
      }
    }
    return ProxyProxyDepositListPostRespModel(
      payTypes: payTypes == null ? [] : payTypes,
    );
  }

  List<PayTypes> payTypes;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'payTypes': payTypes,
      };
}

class PayTypes {
  PayTypes({
    required this.depositMaxAmount,
    required this.depositMinAmount,
    required this.fixedAmount,
    required this.linkType,
    required this.dcProtocol,
    required this.payTypeId,
  });

  factory PayTypes.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? fixedAmount =
        jsonRes['fixedAmount'] is List ? <String>[] : null;
    if (fixedAmount != null) {
      for (final dynamic item in jsonRes['fixedAmount']!) {
        if (item != null) {
          fixedAmount.add(asT<String>("fixedAmount", item)!);
        }
      }
    }

    final List<String>? dcProtocol =
        jsonRes['dcProtocol'] is List ? <String>[] : null;
    if (dcProtocol != null) {
      for (final dynamic item in jsonRes['dcProtocol']!) {
        if (item != null) {
          dcProtocol.add(asT<String>("dcProtocol", item)!);
        }
      }
    }
    return PayTypes(
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
      dcProtocol: dcProtocol == null ? [] : dcProtocol,
      payTypeId: jsonRes['payTypeId'] == null
          ? 0
          : asT<int>("payTypeId", jsonRes['payTypeId'])!,
    );
  }

  int depositMaxAmount = 0;
  int depositMinAmount = 0;
  List<String> fixedAmount;
  int linkType = 0;
  List<String> dcProtocol;
  int payTypeId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'depositMaxAmount': depositMaxAmount,
        'depositMinAmount': depositMinAmount,
        'fixedAmount': fixedAmount,
        'linkType': linkType,
        'dcProtocol': dcProtocol,
        'payTypeId': payTypeId,
      };
}
