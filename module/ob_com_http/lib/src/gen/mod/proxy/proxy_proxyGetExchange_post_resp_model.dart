import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyGetExchangePostRespModel {
  ProxyProxyGetExchangePostRespModel({
    required this.exchange,
  });

  factory ProxyProxyGetExchangePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyGetExchangePostRespModel(
        exchange: jsonRes['exchange'] == null
            ? 0.0
            : asT<double>("exchange", jsonRes['exchange'])!,
      );

  double exchange = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'exchange': exchange,
      };
}
