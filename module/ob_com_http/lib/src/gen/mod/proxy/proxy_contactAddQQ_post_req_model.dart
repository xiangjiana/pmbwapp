import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyContactAddQQPostReqModel {
  ProxyContactAddQQPostReqModel({
    required this.qq,
  });

  factory ProxyContactAddQQPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyContactAddQQPostReqModel(
        qq: jsonRes['qq'] == null ? '' : asT<String>("qq", jsonRes['qq'])!,
      );

  String qq = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'qq': qq,
      };
}
