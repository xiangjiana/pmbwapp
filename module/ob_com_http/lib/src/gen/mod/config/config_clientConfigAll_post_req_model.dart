import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigClientConfigAllPostReqModel {
  ConfigClientConfigAllPostReqModel({
    required this.resourcesType,
  });

  factory ConfigClientConfigAllPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ConfigClientConfigAllPostReqModel(
        resourcesType: jsonRes['resourcesType'] == null
            ? 0
            : asT<int>("resourcesType", jsonRes['resourcesType'])!,
      );

  int resourcesType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'resourcesType': resourcesType,
      };
}
