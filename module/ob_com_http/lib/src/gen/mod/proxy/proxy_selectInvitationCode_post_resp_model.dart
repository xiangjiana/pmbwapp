import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySelectInvitationCodePostRespModel {
  ProxySelectInvitationCodePostRespModel({
    required this.msg,
  });

  factory ProxySelectInvitationCodePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySelectInvitationCodePostRespModel(
        msg: jsonRes['msg'] == null
            ? ''
            : asT<String>("msg", jsonRes['msg'])!,
      );

  String msg = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'msg': msg,
      };
}
