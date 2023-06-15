import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberVerificationCodeLoginPostReqModel {
  MemberVerificationCodeLoginPostReqModel({
    required this.appType,
    required this.appVersion,
    required this.deviceNo,
    required this.loginReference,
    required this.sendType,
    required this.userName,
    required this.verifica,
  });

  factory MemberVerificationCodeLoginPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberVerificationCodeLoginPostReqModel(
        appType: jsonRes['appType'] == null
            ? ''
            : asT<String>("appType", jsonRes['appType'])!,
        appVersion: jsonRes['appVersion'] == null
            ? ''
            : asT<String>("appVersion", jsonRes['appVersion'])!,
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        loginReference: jsonRes['loginReference'] == null
            ? ''
            : asT<String>("loginReference", jsonRes['loginReference'])!,
        sendType: jsonRes['sendType'] == null
            ? 0
            : asT<int>("sendType", jsonRes['sendType'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
        verifica: jsonRes['verifica'] == null
            ? ''
            : asT<String>("verifica", jsonRes['verifica'])!,
      );

  String appType = '';
  String appVersion = '';
  String deviceNo = '';
  String loginReference = '';
  int sendType = 0;
  String userName = '';
  String verifica = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appType': appType,
        'appVersion': appVersion,
        'deviceNo': deviceNo,
        'loginReference': loginReference,
        'sendType': sendType,
        'userName': userName,
        'verifica': verifica,
      };
}
