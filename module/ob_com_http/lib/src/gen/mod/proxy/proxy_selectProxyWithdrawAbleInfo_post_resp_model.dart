import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySelectProxyWithdrawAbleInfoPostRespModel {
  ProxySelectProxyWithdrawAbleInfoPostRespModel({
    required this.bankCardMaxAmount,
    required this.bankCardMinAmount,
    required this.dateTransferInnerAbleAmount,
    required this.dateWithdrawAbleAmount,
    required this.dateWithdrawAbleNum,
    required this.transferInnerMaxAmount,
    required this.transferInnerMinAmount,
    required this.virtualCardMaxAmount,
    required this.virtualCardMinAmount,
  });

  factory ProxySelectProxyWithdrawAbleInfoPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySelectProxyWithdrawAbleInfoPostRespModel(
        bankCardMaxAmount: jsonRes['bankCardMaxAmount'] == null
            ? 0.0
            : asT<double>("bankCardMaxAmount", jsonRes['bankCardMaxAmount'])!,
        bankCardMinAmount: jsonRes['bankCardMinAmount'] == null
            ? 0.0
            : asT<double>("bankCardMinAmount", jsonRes['bankCardMinAmount'])!,
        dateTransferInnerAbleAmount:
            jsonRes['dateTransferInnerAbleAmount'] == null
                ? 0.0
                : asT<double>("dateTransferInnerAbleAmount",
                    jsonRes['dateTransferInnerAbleAmount'])!,
        dateWithdrawAbleAmount: jsonRes['dateWithdrawAbleAmount'] == null
            ? 0.0
            : asT<double>(
                "dateWithdrawAbleAmount", jsonRes['dateWithdrawAbleAmount'])!,
        dateWithdrawAbleNum: jsonRes['dateWithdrawAbleNum'] == null
            ? 0
            : asT<int>("dateWithdrawAbleNum", jsonRes['dateWithdrawAbleNum'])!,
        transferInnerMaxAmount: jsonRes['transferInnerMaxAmount'] == null
            ? 0.0
            : asT<double>(
                "transferInnerMaxAmount", jsonRes['transferInnerMaxAmount'])!,
        transferInnerMinAmount: jsonRes['transferInnerMinAmount'] == null
            ? 0.0
            : asT<double>(
                "transferInnerMinAmount", jsonRes['transferInnerMinAmount'])!,
        virtualCardMaxAmount: jsonRes['virtualCardMaxAmount'] == null
            ? 0.0
            : asT<double>(
                "virtualCardMaxAmount", jsonRes['virtualCardMaxAmount'])!,
        virtualCardMinAmount: jsonRes['virtualCardMinAmount'] == null
            ? 0.0
            : asT<double>(
                "virtualCardMinAmount", jsonRes['virtualCardMinAmount'])!,
      );

  double bankCardMaxAmount = 0.0;
  double bankCardMinAmount = 0.0;
  double dateTransferInnerAbleAmount = 0.0;
  double dateWithdrawAbleAmount = 0.0;
  int dateWithdrawAbleNum = 0;
  double transferInnerMaxAmount = 0.0;
  double transferInnerMinAmount = 0.0;
  double virtualCardMaxAmount = 0.0;
  double virtualCardMinAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCardMaxAmount': bankCardMaxAmount,
        'bankCardMinAmount': bankCardMinAmount,
        'dateTransferInnerAbleAmount': dateTransferInnerAbleAmount,
        'dateWithdrawAbleAmount': dateWithdrawAbleAmount,
        'dateWithdrawAbleNum': dateWithdrawAbleNum,
        'transferInnerMaxAmount': transferInnerMaxAmount,
        'transferInnerMinAmount': transferInnerMinAmount,
        'virtualCardMaxAmount': virtualCardMaxAmount,
        'virtualCardMinAmount': virtualCardMinAmount,
      };
}
