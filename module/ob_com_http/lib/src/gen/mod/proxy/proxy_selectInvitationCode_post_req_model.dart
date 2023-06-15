import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySelectInvitationCodePostReqModel {
  ProxySelectInvitationCodePostReqModel({
    required this.invitationCode,
  });

  factory ProxySelectInvitationCodePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySelectInvitationCodePostReqModel(
        invitationCode: jsonRes['invitationCode'] == null
            ? ''
            : asT<String>("invitationCode", jsonRes['invitationCode'])!,
      );

  ///代理的合营码
  String invitationCode = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'invitationCode': invitationCode,
      };
}
