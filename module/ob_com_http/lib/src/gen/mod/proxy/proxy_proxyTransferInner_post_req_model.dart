import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyTransferInnerPostReqModel {
  ProxyProxyTransferInnerPostReqModel({
    required this.amount,
    required this.payPassword,
  });

  factory ProxyProxyTransferInnerPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyTransferInnerPostReqModel(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
      );

  double amount = 0.0;
  String payPassword = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'payPassword': payPassword,
      };
}
