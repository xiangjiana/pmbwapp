import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxySelectBalancePostRespModel {
  ProxyProxySelectBalancePostRespModel({
    required this.commissionBalance,
    required this.quotaBalance,
  });

  factory ProxyProxySelectBalancePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxySelectBalancePostRespModel(
        commissionBalance: jsonRes["commissionBalance"] == null
            ? CommissionBalance.fromJson({})
            : CommissionBalance.fromJson(asT<Map<String, dynamic>>(
                "commissionBalance", jsonRes["commissionBalance"])!),
        quotaBalance: jsonRes["quotaBalance"] == null
            ? QuotaBalance.fromJson({})
            : QuotaBalance.fromJson(asT<Map<String, dynamic>>(
                "quotaBalance", jsonRes["quotaBalance"])!),
      );

  CommissionBalance commissionBalance;
  QuotaBalance quotaBalance;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'commissionBalance': commissionBalance,
        'quotaBalance': quotaBalance,
      };
}

class CommissionBalance {
  CommissionBalance({
    required this.accountType,
    required this.balance,
    required this.currency,
    required this.merchantId,
    required this.userId,
  });

  factory CommissionBalance.fromJson(Map<String, dynamic> jsonRes) =>
      CommissionBalance(
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
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
      );

  int accountType = 0;
  double balance = 0.0;
  String currency = '';
  int merchantId = 0;
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

class QuotaBalance {
  QuotaBalance({
    required this.accountType,
    required this.balance,
    required this.currency,
    required this.merchantId,
    required this.userId,
  });

  factory QuotaBalance.fromJson(Map<String, dynamic> jsonRes) => QuotaBalance(
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
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
      );

  int accountType = 0;
  double balance = 0.0;
  String currency = '';
  int merchantId = 0;
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
