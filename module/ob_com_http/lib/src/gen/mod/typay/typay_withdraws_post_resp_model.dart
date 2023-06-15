import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayWithdrawsPostRespModel {
  TypayWithdrawsPostRespModel({
    required this.companyId,
    required this.merchantId,
    required this.payMessage,
    required this.payResult,
    required this.payTypes,
    required this.userId,
  });

  factory TypayWithdrawsPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<TypayWithdrawsPostRespModelPayTypes>? payTypes =
        jsonRes['payTypes'] is List ? <TypayWithdrawsPostRespModelPayTypes>[] : null;
    if (payTypes != null) {
      for (final dynamic item in jsonRes['payTypes']!) {
        if (item != null) {
          payTypes.add(
              TypayWithdrawsPostRespModelPayTypes.fromJson(asT<Map<String, dynamic>>("payTypes", item)!));
        }
      }
    }
    return TypayWithdrawsPostRespModel(
      companyId: jsonRes['companyId'] == null
          ? ''
          : asT<String>("companyId", jsonRes['companyId'])!,
      merchantId: jsonRes['merchantId'] == null
          ? ''
          : asT<String>("merchantId", jsonRes['merchantId'])!,
      payMessage: jsonRes['payMessage'] == null
          ? 0
          : asT<int>("payMessage", jsonRes['payMessage'])!,
      payResult: jsonRes['payResult'] == null
          ? ''
          : asT<String>("payResult", jsonRes['payResult'])!,
      payTypes: payTypes == null ? [] : payTypes,
      userId: jsonRes['userId'] == null
          ? ''
          : asT<String>("userId", jsonRes['userId'])!,
    );
  }

  String companyId = '';
  String merchantId = '';
  int payMessage = 0;
  String payResult = '';
  List<TypayWithdrawsPostRespModelPayTypes> payTypes;
  String userId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'companyId': companyId,
        'merchantId': merchantId,
        'payMessage': payMessage,
        'payResult': payResult,
        'payTypes': payTypes,
        'userId': userId,
      };
}

class TypayWithdrawsPostRespModelPayTypes {
  TypayWithdrawsPostRespModelPayTypes({
    required this.dcProtocol,
    required this.depositMaxAmount,
    required this.depositMinAmount,
    required this.fixedAmount,
    required this.linkType,
    required this.payTypeId,
  });

  factory TypayWithdrawsPostRespModelPayTypes.fromJson(Map<String, dynamic> jsonRes) {
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
    return TypayWithdrawsPostRespModelPayTypes(
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
        'dcProtocol': dcProtocol,
        'depositMaxAmount': depositMaxAmount,
        'depositMinAmount': depositMinAmount,
        'fixedAmount': fixedAmount,
        'linkType': linkType,
        'payTypeId': payTypeId,
      };
}
