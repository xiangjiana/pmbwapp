import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentProxyGetVenueFeesPostReqModel {
  ProxyMultiAgentProxyGetVenueFeesPostReqModel({
    required this.proxyId,
    required this.staticDate,
    required this.staticDateType,
  });

  factory ProxyMultiAgentProxyGetVenueFeesPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyMultiAgentProxyGetVenueFeesPostReqModel(
        proxyId: jsonRes['proxyId'] == null
            ? '0'
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        staticDate: jsonRes['staticDate'] == null
            ? 0
            : asT<int>("staticDate", jsonRes['staticDate'])!,
        staticDateType: jsonRes['staticDateType'] == null
            ? 0
            : asT<int>("staticDateType", jsonRes['staticDateType'])!,
      );

  String proxyId = '0';
  int staticDate = 0;
  int staticDateType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'proxyId': proxyId,
        'staticDate': staticDate,
        'staticDateType': staticDateType,
      };
}
