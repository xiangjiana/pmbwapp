import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigDepositConfigPostRespModel {
  ConfigDepositConfigPostRespModel({
    required this.alipayTransferBankFixedAmount,
    required this.onlineBankFixedAmount,
    required this.yunshanfuBankFixedAmount,
    required this.alipayBankFixedAmount,
  });

  factory ConfigDepositConfigPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ConfigDepositConfigPostRespModel(
        alipayTransferBankFixedAmount:
            jsonRes['alipayTransferBankFixedAmount'] == null
                ? ''
                : asT<String>("alipayTransferBankFixedAmount",
                    jsonRes['alipayTransferBankFixedAmount'])!,
        onlineBankFixedAmount: jsonRes['onlineBankFixedAmount'] == null
            ? ''
            : asT<String>(
                "onlineBankFixedAmount", jsonRes['onlineBankFixedAmount'])!,
        yunshanfuBankFixedAmount: jsonRes['yunshanfuBankFixedAmount'] == null
            ? ''
            : asT<String>("yunshanfuBankFixedAmount",
                jsonRes['yunshanfuBankFixedAmount'])!,
        alipayBankFixedAmount: jsonRes['alipayBankFixedAmount'] == null
            ? ''
            : asT<String>(
                "alipayBankFixedAmount", jsonRes['alipayBankFixedAmount'])!,
      );

  String alipayTransferBankFixedAmount = '';
  String onlineBankFixedAmount = '';
  String yunshanfuBankFixedAmount = '';
  String alipayBankFixedAmount = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'alipayTransferBankFixedAmount': alipayTransferBankFixedAmount,
        'onlineBankFixedAmount': onlineBankFixedAmount,
        'yunshanfuBankFixedAmount': yunshanfuBankFixedAmount,
        'alipayBankFixedAmount': alipayBankFixedAmount,
      };
}
