import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyValidatePayPasswordPostReqModel {
  ProxyProxyValidatePayPasswordPostReqModel({
    required this.payPassword,
  });

  factory ProxyProxyValidatePayPasswordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyValidatePayPasswordPostReqModel(
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
      );

  String payPassword = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'payPassword': payPassword,
      };
}
