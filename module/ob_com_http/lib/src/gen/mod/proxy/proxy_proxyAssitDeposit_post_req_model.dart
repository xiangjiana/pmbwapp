import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyAssitDepositPostReqModel {
  ProxyProxyAssitDepositPostReqModel({
    required this.amount,
    required this.bizType,
    required this.payPassword,
    required this.remark,
    required this.userName,
  });

  factory ProxyProxyAssitDepositPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyAssitDepositPostReqModel(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  double amount = 0.0;
  int bizType = 0;
  String payPassword = '';
  String remark = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'bizType': bizType,
        'payPassword': payPassword,
        'remark': remark,
        'userName': userName,
      };
}
