import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyBalancePostRespModel {
  ProxyProxyBalancePostRespModel({
    required this.commissionBalance,
    required this.creditBalance,
  });

  factory ProxyProxyBalancePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyBalancePostRespModel(
        commissionBalance: jsonRes['commissionBalance'] == null
            ? 0
            : asT<int>("commissionBalance", jsonRes['commissionBalance'])!,
        creditBalance: jsonRes['creditBalance'] == null
            ? 0
            : asT<int>("creditBalance", jsonRes['creditBalance'])!,
      );

  int commissionBalance = 0;
  int creditBalance = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'commissionBalance': commissionBalance,
        'creditBalance': creditBalance,
      };
}
