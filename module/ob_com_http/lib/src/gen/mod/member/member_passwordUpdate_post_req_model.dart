import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberPasswordUpdatePostReqModel {
  MemberPasswordUpdatePostReqModel({
    required this.newPassword,
    required this.password,
  });

  factory MemberPasswordUpdatePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberPasswordUpdatePostReqModel(
        newPassword: jsonRes['newPassword'] == null
            ? ''
            : asT<String>("newPassword", jsonRes['newPassword'])!,
        password: jsonRes['password'] == null
            ? ''
            : asT<String>("password", jsonRes['password'])!,
      );

  String newPassword = '';
  String password = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'newPassword': newPassword,
        'password': password,
      };
}
