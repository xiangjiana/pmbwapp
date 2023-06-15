import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentProxyQueryProxyNetAmountDetailDayPostReqModel {
  ProxyMultiAgentProxyQueryProxyNetAmountDetailDayPostReqModel({
    required this.proxyId,
    required this.staticDate,
  });

  factory ProxyMultiAgentProxyQueryProxyNetAmountDetailDayPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyMultiAgentProxyQueryProxyNetAmountDetailDayPostReqModel(
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        staticDate: jsonRes['staticDate'] == null
            ? 0
            : asT<int>("staticDate", jsonRes['staticDate'])!,
      );

  String proxyId = '';
  int staticDate = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'proxyId': proxyId,
        'staticDate': staticDate,
      };
}
