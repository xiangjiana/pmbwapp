import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberCheckUserPostRespModel {
  MemberCheckUserPostRespModel({
    required this.emailAddr,
    required this.telephoneNum,
    required this.userName,
  });

  factory MemberCheckUserPostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      MemberCheckUserPostRespModel(
        emailAddr: jsonRes['emailAddr'] == null
            ? ''
            : asT<String>("emailAddr", jsonRes['emailAddr'])!,
        telephoneNum: jsonRes['telephoneNum'] == null
            ? ''
            : asT<String>("telephoneNum", jsonRes['telephoneNum'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String emailAddr = '';
  String telephoneNum = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'emailAddr': emailAddr,
        'telephoneNum': telephoneNum,
        'userName': userName,
      };
}
