import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserWithdrawPostReqModel {
  UserWithdrawPostReqModel({
    required this.accountId,
    required this.deviceNo,
    required this.orderAmount,
    required this.payPassword,
    required this.userType,
    required this.withdrawType,
  });

  factory UserWithdrawPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserWithdrawPostReqModel(
        accountId: jsonRes['accountId'] == null
            ? ''
            : asT<String>("accountId", jsonRes['accountId'])!,
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
        userType: jsonRes['userType'] == null
            ? 0
            : asT<int>("userType", jsonRes['userType'])!,
        withdrawType: jsonRes['withdrawType'] == null
            ? 0
            : asT<int>("withdrawType", jsonRes['withdrawType'])!,
      );

  String accountId = '';
  String deviceNo = '';
  double orderAmount = 0.0;
  String payPassword = '';
  int userType = 0;
  int withdrawType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountId': accountId,
        'deviceNo': deviceNo,
        'orderAmount': orderAmount,
        'payPassword': payPassword,
        'userType': userType,
        'withdrawType': withdrawType,
      };
}
