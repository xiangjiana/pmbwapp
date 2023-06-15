import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiUpdateBirthPostReqModel {
  UserApiUpdateBirthPostReqModel({
    required this.birth,
    required this.merchantId,
    required this.username,
  });

  factory UserApiUpdateBirthPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiUpdateBirthPostReqModel(
        birth: jsonRes['birth'] == null
            ? ''
            : asT<String>("birth", jsonRes['birth'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
      );

  String birth = '';
  int merchantId = 0;
  String username = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'birth': birth,
        'merchantId': merchantId,
        'username': username,
      };
}
