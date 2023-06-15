import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberIsVerifiedPostReqModel {
  MemberIsVerifiedPostReqModel({
    required this.username,
    required this.verifica,
    required this.sendType,
  });

  factory MemberIsVerifiedPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      MemberIsVerifiedPostReqModel(
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
        verifica: jsonRes['verifica'] == null
            ? ''
            : asT<String>("verifica", jsonRes['verifica'])!,
        sendType: jsonRes['sendType'] == null
            ? 0
            : asT<int>("sendType", jsonRes['sendType'])!,
      );

  String username = '';
  String verifica = '';
  int sendType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
        'verifica': verifica,
        'sendType': sendType,
      };
}
