import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyContactAddFlygramPostReqModel {
  ProxyContactAddFlygramPostReqModel({
    required this.flygram,
  });

  factory ProxyContactAddFlygramPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyContactAddFlygramPostReqModel(
        flygram: jsonRes['flygram'] == null
            ? ''
            : asT<String>("flygram", jsonRes['flygram'])!,
      );

  String flygram = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'flygram': flygram,
      };
}
