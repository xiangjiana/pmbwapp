import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyGetWithdrawalRestrictionsPostReqModel {
  ProxyProxyGetWithdrawalRestrictionsPostReqModel({
    required this.proxyId,
  });

  factory ProxyProxyGetWithdrawalRestrictionsPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyGetWithdrawalRestrictionsPostReqModel(
        proxyId: jsonRes['proxyId '] == null
            ? 0
            : asT<int>("proxyId ", jsonRes['proxyId '])!,
      );

  int proxyId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'proxyId ': proxyId,
      };
}
