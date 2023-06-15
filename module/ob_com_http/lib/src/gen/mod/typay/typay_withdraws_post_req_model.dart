import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayWithdrawsPostReqModel {
  TypayWithdrawsPostReqModel({
    required this.clientType,
    required this.merchantId,
    required this.userId,
    required this.userIp,
    required this.userLevel,
  });

  factory TypayWithdrawsPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      TypayWithdrawsPostReqModel(
        clientType: jsonRes['client_type'] == null
            ? 0
            : asT<int>("client_type", jsonRes['client_type'])!,
        merchantId: jsonRes['merchant_id'] == null
            ? 0
            : asT<int>("merchant_id", jsonRes['merchant_id'])!,
        userId: jsonRes['user_id'] == null
            ? ''
            : asT<String>("user_id", jsonRes['user_id'])!,
        userIp: jsonRes['user_ip'] == null
            ? ''
            : asT<String>("user_ip", jsonRes['user_ip'])!,
        userLevel: jsonRes['user_level'] == null
            ? 0
            : asT<int>("user_level", jsonRes['user_level'])!,
      );

  int clientType = 0;
  int merchantId = 0;
  String userId = '';
  String userIp = '';
  int userLevel = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'client_type': clientType,
        'merchant_id': merchantId,
        'user_id': userId,
        'user_ip': userIp,
        'user_level': userLevel,
      };
}
