import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractCheckProxyPostReqModel {
  ProxyProxyContractCheckProxyPostReqModel({
    required this.userName,
  });

  factory ProxyProxyContractCheckProxyPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractCheckProxyPostReqModel(
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
      };
}
