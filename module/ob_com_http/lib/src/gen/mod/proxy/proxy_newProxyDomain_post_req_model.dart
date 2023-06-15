import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyNewProxyDomainPostReqModel {
  ProxyNewProxyDomainPostReqModel({
    required this.id,
  });

  factory ProxyNewProxyDomainPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyNewProxyDomainPostReqModel(
        id: jsonRes['id'] == null ? "0" : asT<String>("id", jsonRes['id'])!,
      );

  String id = "0";

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
      };
}
