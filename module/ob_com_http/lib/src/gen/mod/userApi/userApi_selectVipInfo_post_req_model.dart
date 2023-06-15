import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSelectVipInfoPostReqModel {
  UserApiSelectVipInfoPostReqModel({
    required this.username,
  });

  factory UserApiSelectVipInfoPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiSelectVipInfoPostReqModel(
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
      );

  String username = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': username,
      };
}
