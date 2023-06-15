import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberSendMobileMessagesPostReqModel {
  MemberSendMobileMessagesPostReqModel({
    required this.findType,
    required this.username,
  });

  factory MemberSendMobileMessagesPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberSendMobileMessagesPostReqModel(
        findType: jsonRes['findType'] == null
            ? 0
            : asT<int>("findType", jsonRes['findType'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
      );

  int findType = 0;
  String username = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'findType': findType,
        'username': username,
      };
}
