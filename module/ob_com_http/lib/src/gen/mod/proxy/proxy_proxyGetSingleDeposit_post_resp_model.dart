import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyGetSingleDepositPostRespModel {
  ProxyProxyGetSingleDepositPostRespModel({
    required this.maxSingleDepositAmount,
    required this.minSingleDepositAmount,
  });

  factory ProxyProxyGetSingleDepositPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyGetSingleDepositPostRespModel(
        maxSingleDepositAmount: jsonRes['maxSingleDepositAmount'] == null
            ? 0.0
            : asT<double>(
                "maxSingleDepositAmount", jsonRes['maxSingleDepositAmount'])!,
        minSingleDepositAmount: jsonRes['minSingleDepositAmount'] == null
            ? 0.0
            : asT<double>(
                "minSingleDepositAmount", jsonRes['minSingleDepositAmount'])!,
      );

  double maxSingleDepositAmount = 0.0;
  double minSingleDepositAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'maxSingleDepositAmount': maxSingleDepositAmount,
        'minSingleDepositAmount': minSingleDepositAmount,
      };
}
