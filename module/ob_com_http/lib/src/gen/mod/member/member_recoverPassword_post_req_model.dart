import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberRecoverPasswordPostReqModel {
  MemberRecoverPasswordPostReqModel({
    required this.emailAddr,
    required this.findType,
    required this.telephoneNum,
    required this.username,
  });

  factory MemberRecoverPasswordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberRecoverPasswordPostReqModel(
        emailAddr: jsonRes['emailAddr'] == null
            ? ''
            : asT<String>("emailAddr", jsonRes['emailAddr'])!,
        findType: jsonRes['findType'] == null
            ? 0
            : asT<int>("findType", jsonRes['findType'])!,
        telephoneNum: jsonRes['telephoneNum'] == null
            ? ''
            : asT<String>("telephoneNum", jsonRes['telephoneNum'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
      );

  String emailAddr = '';
  int findType = 0;
  String telephoneNum = '';
  String username = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'emailAddr': emailAddr,
        'findType': findType,
        'telephoneNum': telephoneNum,
        'username': username,
      };
}
