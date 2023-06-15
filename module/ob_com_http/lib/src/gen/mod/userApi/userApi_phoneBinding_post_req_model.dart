import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiPhoneBindingPostReqModel {
  UserApiPhoneBindingPostReqModel({
    required this.phone,
    required this.username,
    required this.v,
  });

  factory UserApiPhoneBindingPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiPhoneBindingPostReqModel(
        phone: jsonRes['phone'] == null
            ? ''
            : asT<String>("phone", jsonRes['phone'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
        v: jsonRes['v'] == null ? 0 : asT<int>("v", jsonRes['v'])!,
      );

  String phone = '';
  String username = '';
  int v = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'phone': phone,
        'username': username,
        'v': v,
      };
}
