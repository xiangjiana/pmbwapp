import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyGetSubSingleDepositPostRespModel {
  ProxyProxyGetSubSingleDepositPostRespModel({
    required this.dayDepositAmount,
    required this.maxSingleDepositAmount,
    required this.minSingleDepositAmount,
  });

  factory ProxyProxyGetSubSingleDepositPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyGetSubSingleDepositPostRespModel(
        dayDepositAmount: jsonRes['dayDepositAmount'] == null
            ? 0.0
            : asT<double>("dayDepositAmount", jsonRes['dayDepositAmount'])!,
        maxSingleDepositAmount: jsonRes['maxSingleDepositAmount'] == null
            ? 0.0
            : asT<double>(
                "maxSingleDepositAmount", jsonRes['maxSingleDepositAmount'])!,
        minSingleDepositAmount: jsonRes['minSingleDepositAmount'] == null
            ? 0.0
            : asT<double>(
                "minSingleDepositAmount", jsonRes['minSingleDepositAmount'])!,
      );

  double dayDepositAmount = 0.0;
  double maxSingleDepositAmount = 0.0;
  double minSingleDepositAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dayDepositAmount': dayDepositAmount,
        'maxSingleDepositAmount': maxSingleDepositAmount,
        'minSingleDepositAmount': minSingleDepositAmount,
      };
}
