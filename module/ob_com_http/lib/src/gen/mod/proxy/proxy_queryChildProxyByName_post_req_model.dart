import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyQueryChildProxyByNamePostReqModel {
  ProxyQueryChildProxyByNamePostReqModel({
    required this.childProxyName,
  });

  factory ProxyQueryChildProxyByNamePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyQueryChildProxyByNamePostReqModel(
        childProxyName: jsonRes['childProxyName'] == null
            ? ''
            : asT<String>("childProxyName", jsonRes['childProxyName'])!,
      );

  String childProxyName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'childProxyName': childProxyName,
      };
}
