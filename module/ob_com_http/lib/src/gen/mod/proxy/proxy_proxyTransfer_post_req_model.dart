import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyTransferPostReqModel {
  ProxyProxyTransferPostReqModel({
    required this.accountType,
    required this.amount,
    required this.childProxyName,
    required this.payPassword,
    required this.remark,
  });

  factory ProxyProxyTransferPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyTransferPostReqModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        childProxyName: jsonRes['childProxyName'] == null
            ? ''
            : asT<String>("childProxyName", jsonRes['childProxyName'])!,
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  int accountType = 0;
  double amount = 0.0;
  String childProxyName = '';
  String payPassword = '';
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'amount': amount,
        'childProxyName': childProxyName,
        'payPassword': payPassword,
        'remark': remark,
      };
}
