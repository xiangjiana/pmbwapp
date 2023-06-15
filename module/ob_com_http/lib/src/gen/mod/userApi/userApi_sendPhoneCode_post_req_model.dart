import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSendPhoneCodePostReqModel {
  UserApiSendPhoneCodePostReqModel({
    required this.userPhone,
  });

  factory UserApiSendPhoneCodePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiSendPhoneCodePostReqModel(
        userPhone: jsonRes['userPhone'] == null
            ? ''
            : asT<String>("userPhone", jsonRes['userPhone'])!,
      );

  String userPhone = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userPhone': userPhone,
      };
}
