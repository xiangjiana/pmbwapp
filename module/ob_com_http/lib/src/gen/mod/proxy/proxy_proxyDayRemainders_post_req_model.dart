import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyDayRemaindersPostReqModel {
  ProxyProxyDayRemaindersPostReqModel({
    required this.type,
  });

  factory ProxyProxyDayRemaindersPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyDayRemaindersPostReqModel(
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
      };
}
