import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigAppVersionCheckPostReqModel {
  ConfigAppVersionCheckPostReqModel({
    required this.clientType,
    required this.subType,
  });

  factory ConfigAppVersionCheckPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ConfigAppVersionCheckPostReqModel(
        clientType: jsonRes['clientType'] == null
            ? 0
            : asT<int>("clientType", jsonRes['clientType'])!,
        subType: jsonRes['subType'] == null
            ? 0
            : asT<int>("subType", jsonRes['subType'])!,
      );

  int clientType = 0;
  int subType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'clientType': clientType,
        'subType': subType,
      };
}
