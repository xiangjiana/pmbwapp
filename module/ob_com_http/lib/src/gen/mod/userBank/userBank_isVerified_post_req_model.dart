import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBankIsVerifiedPostReqModel {
  UserBankIsVerifiedPostReqModel({
    required this.verificationCode,
  });

  factory UserBankIsVerifiedPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserBankIsVerifiedPostReqModel(
        verificationCode: jsonRes['verificationCode'] == null
            ? ''
            : asT<String>("verificationCode", jsonRes['verificationCode'])!,
      );

  String verificationCode = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'verificationCode': verificationCode,
      };
}
