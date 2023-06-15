import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerSettingUpdatePostRespModel {
  ProxySystem2BankerSettingUpdatePostRespModel({
    required this.data,
  });

  factory ProxySystem2BankerSettingUpdatePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2BankerSettingUpdatePostRespModel(
        data: jsonRes['data'] == null
            ? false
            : asT<bool>("data", jsonRes['data'])!,
      );

  bool data = false;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}
