import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserLoginPostReqModel {
  UserLoginPostReqModel({
    required this.deviceNo,
    required this.userPwd,
    required this.userName,
  });

  factory UserLoginPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserLoginPostReqModel(
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        userPwd: jsonRes['userPwd'] == null
            ? ''
            : asT<String>("userPwd", jsonRes['userPwd'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String deviceNo = '';
  String userPwd = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceNo': deviceNo,
        'password': userPwd,
        'userName': userName,
      };
}
