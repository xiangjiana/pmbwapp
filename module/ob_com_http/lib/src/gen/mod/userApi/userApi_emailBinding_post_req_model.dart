import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiEmailBindingPostReqModel {
  UserApiEmailBindingPostReqModel({
    required this.email,
    required this.username,
    required this.v,
  });

  factory UserApiEmailBindingPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiEmailBindingPostReqModel(
        email: jsonRes['email'] == null
            ? ''
            : asT<String>("email", jsonRes['email'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
        v: jsonRes['v'] == null ? 0 : asT<int>("v", jsonRes['v'])!,
      );

  String email = '';
  String username = '';
  int v = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'username': username,
        'v': v,
      };
}
