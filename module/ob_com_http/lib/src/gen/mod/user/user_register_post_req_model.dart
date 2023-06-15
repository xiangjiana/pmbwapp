import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserRegisterPostReqModel {
  UserRegisterPostReqModel({
    required this.deviceNo,
    required this.invitationCode,
    required this.userPwd,
    required this.userName,
  });

  factory UserRegisterPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserRegisterPostReqModel(
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        invitationCode: jsonRes['invitationCode'] == null
            ? ''
            : asT<String>("invitationCode", jsonRes['invitationCode'])!,
        userPwd: jsonRes['userPwd'] == null
            ? ''
            : asT<String>("userPwd", jsonRes['userPwd'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String deviceNo = '';
  String invitationCode = '';
  String userPwd = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceNo': deviceNo,
        'invitationCode': invitationCode,
        'userPwd': userPwd,
        'userName': userName,
      };
}
