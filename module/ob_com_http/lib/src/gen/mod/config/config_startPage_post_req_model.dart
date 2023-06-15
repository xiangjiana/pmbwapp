import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigStartPagePostReqModel {
  ConfigStartPagePostReqModel({
    required this.clientType,
  });

  factory ConfigStartPagePostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      ConfigStartPagePostReqModel(
        clientType: jsonRes['clientType'] == null
            ? ''
            : asT<String>("clientType", jsonRes['clientType'])!,
      );

  String clientType = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'clientType': clientType,
      };
}
