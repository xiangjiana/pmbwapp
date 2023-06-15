import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberResetPassWordPostReqModel {
  MemberResetPassWordPostReqModel({
    required this.confirmPassWord,
    required this.passWord,
    required this.username,
  });

  factory MemberResetPassWordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberResetPassWordPostReqModel(
        confirmPassWord: jsonRes['confirmPassWord'] == null
            ? ''
            : asT<String>("confirmPassWord", jsonRes['confirmPassWord'])!,
        passWord: jsonRes['passWord'] == null
            ? ''
            : asT<String>("passWord", jsonRes['passWord'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
      );

  String confirmPassWord = '';
  String passWord = '';
  String username = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'confirmPassWord': confirmPassWord,
        'passWord': passWord,
        'username': username,
      };
}
