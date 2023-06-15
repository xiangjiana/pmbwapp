import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyCreatePayPasswordPostReqModel {
  ProxyProxyCreatePayPasswordPostReqModel({
    required this.payPassword,
    required this.validPassword,
  });

  factory ProxyProxyCreatePayPasswordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyCreatePayPasswordPostReqModel(
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
        validPassword: jsonRes['validPassword'] == null
            ? ''
            : asT<String>("validPassword", jsonRes['validPassword'])!,
      );

  String payPassword = '';
  String validPassword = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'payPassword': payPassword,
        'validPassword': validPassword,
      };
}
