import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyUpdatePayPasswordPostReqModel {
  ProxyProxyUpdatePayPasswordPostReqModel({
    required this.confirmPayPassword,
    required this.oldPayPassword,
    required this.payPassword,
  });

  factory ProxyProxyUpdatePayPasswordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyUpdatePayPasswordPostReqModel(
        confirmPayPassword: jsonRes['confirmPayPassword'] == null
            ? ''
            : asT<String>("confirmPayPassword", jsonRes['confirmPayPassword'])!,
        oldPayPassword: jsonRes['oldPayPassword'] == null
            ? ''
            : asT<String>("oldPayPassword", jsonRes['oldPayPassword'])!,
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
      );

  String confirmPayPassword = '';
  String oldPayPassword = '';
  String payPassword = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'confirmPayPassword': confirmPayPassword,
        'oldPayPassword': oldPayPassword,
        'payPassword': payPassword,
      };
}
