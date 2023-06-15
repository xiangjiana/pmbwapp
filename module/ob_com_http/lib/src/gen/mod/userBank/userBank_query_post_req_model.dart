import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBankQueryPostReqModel {
  UserBankQueryPostReqModel({
    required this.dataType,
  });

  factory UserBankQueryPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserBankQueryPostReqModel(
        dataType: jsonRes['dataType'] == null
            ? ''
            : asT<String>("dataType", jsonRes['dataType'])!,
      );

  String dataType = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dataType': dataType,
      };
}
