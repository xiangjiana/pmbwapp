import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerMemberAddMemberPostReqModel {
  ProxyLowerMemberAddMemberPostReqModel({
    required this.deviceNo,
    required this.password,
    required this.registerReference,
    required this.userName,
  });

  factory ProxyLowerMemberAddMemberPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyLowerMemberAddMemberPostReqModel(
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        password: jsonRes['password'] == null
            ? ''
            : asT<String>("password", jsonRes['password'])!,
        registerReference: jsonRes['registerReference'] == null
            ? ''
            : asT<String>("registerReference", jsonRes['registerReference'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String deviceNo = '';
  String password = '';
  String registerReference = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceNo': deviceNo,
        'password': password,
        'registerReference': registerReference,
        'userName': userName,
      };
}
