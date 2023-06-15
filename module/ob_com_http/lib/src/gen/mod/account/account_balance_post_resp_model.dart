import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccountBalancePostRespModel {
  AccountBalancePostRespModel({
    required this.accountType,
    required this.balance,
    required this.currency,
    required this.merchantId,
    required this.userId,
  });

  factory AccountBalancePostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      AccountBalancePostRespModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        balance: jsonRes['balance'] == null
            ? 0.0
            : asT<double>("balance", jsonRes['balance'])!,
        currency: jsonRes['currency'] == null
            ? ''
            : asT<String>("currency", jsonRes['currency'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
      );

  int accountType = 0;
  double balance = 0.0;
  String currency = '';
  String merchantId = '';
  String userId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'balance': balance,
        'currency': currency,
        'merchantId': merchantId,
        'userId': userId,
      };
}
