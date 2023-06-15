import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigGetProxyCodePostReqModel {
  ConfigGetProxyCodePostReqModel({
    required this.var1,
  });

  factory ConfigGetProxyCodePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ConfigGetProxyCodePostReqModel(
        var1: jsonRes['var1'] == null
            ? ''
            : asT<String>("var1", jsonRes['var1'])!,
      );

  String var1 = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'var1': var1,
      };
}
