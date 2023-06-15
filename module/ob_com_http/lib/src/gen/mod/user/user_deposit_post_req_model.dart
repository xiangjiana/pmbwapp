import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserDepositPostReqModel {
  UserDepositPostReqModel({
    required this.accountMoneyType,
    required this.bankCode,
    required this.currency,
    required this.name,
    required this.orderAmount,
    required this.payType,
    required this.protocol,
    required this.realName,
  });

  factory UserDepositPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserDepositPostReqModel(
        accountMoneyType: jsonRes['accountMoneyType'] == null
            ? 0
            : asT<int>("accountMoneyType", jsonRes['accountMoneyType'])!,
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        currency: jsonRes['currency'] == null
            ? ''
            : asT<String>("currency", jsonRes['currency'])!,
        name: jsonRes['name'] == null
            ? ''
            : asT<String>("name", jsonRes['name'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
        payType: jsonRes['payType'] == null
            ? 0
            : asT<int>("payType", jsonRes['payType'])!,
        protocol: jsonRes['protocol'] == null
            ? ''
            : asT<String>("protocol", jsonRes['protocol'])!,
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
      );

  int accountMoneyType = 0;
  String bankCode = '';
  String currency = '';
  String name = '';
  double orderAmount = 0.0;
  int payType = 0;
  String protocol = '';
  String realName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountMoneyType': accountMoneyType,
        'bankCode': bankCode,
        'currency': currency,
        'name': name,
        'orderAmount': orderAmount,
        'payType': payType,
        'protocol': protocol,
        'realName': realName,
      };
}
