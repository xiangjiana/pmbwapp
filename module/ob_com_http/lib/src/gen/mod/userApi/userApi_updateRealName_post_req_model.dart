import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiUpdateRealNamePostReqModel {
  UserApiUpdateRealNamePostReqModel({
    required this.realName,
    required this.merchantId,
    required this.username,
  });

  factory UserApiUpdateRealNamePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiUpdateRealNamePostReqModel(
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
      );

  String realName = '';
  int merchantId = 0;
  String username = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'realName': realName,
        'merchantId': merchantId,
        'username': username,
      };
}
