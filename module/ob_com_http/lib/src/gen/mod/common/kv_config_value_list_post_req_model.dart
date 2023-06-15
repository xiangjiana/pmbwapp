import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class KvConfigValueListPostReqModel {
  KvConfigValueListPostReqModel({
    required this.keys,
  });

  factory KvConfigValueListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      KvConfigValueListPostReqModel(
        keys: jsonRes['keys'] == null
            ? []
            : asT<List<String>>("keys", jsonRes['keys'])!,

      );

  List<String> keys = [];

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'keys': keys,
      };
}
