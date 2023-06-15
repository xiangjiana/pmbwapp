import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSendEmailCodePostReqModel {
  UserApiSendEmailCodePostReqModel({
    required this.userEmail,
  });

  factory UserApiSendEmailCodePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiSendEmailCodePostReqModel(
        userEmail: jsonRes['userEmail'] == null
            ? ''
            : asT<String>("userEmail", jsonRes['userEmail'])!,
      );

  String userEmail = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userEmail': userEmail,
      };
}
