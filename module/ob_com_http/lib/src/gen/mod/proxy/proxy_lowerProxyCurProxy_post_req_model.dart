import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerProxyCurProxyPostReqModel {
  ProxyLowerProxyCurProxyPostReqModel({
    required this.orderType,
    required this.userName,
  });

  factory ProxyLowerProxyCurProxyPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyLowerProxyCurProxyPostReqModel(
        orderType: jsonRes['orderType'] == null
            ? false
            : asT<bool>("orderType", jsonRes['orderType'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  bool orderType = false;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderType': orderType,
        'userName': userName,
      };
}
