import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractReuseContractPostReqModel {
  ProxyProxyContractReuseContractPostReqModel({
    required this.contractType,
    required this.orderProperty,
    required this.orderType,
    required this.signProxyName,
  });

  factory ProxyProxyContractReuseContractPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractReuseContractPostReqModel(
        contractType: jsonRes['contractType'] == null
            ? 0
            : asT<int>("contractType", jsonRes['contractType'])!,
        orderProperty: jsonRes['orderProperty'] == null
            ? 0
            : asT<int>("orderProperty", jsonRes['orderProperty'])!,
        orderType: jsonRes['orderType'] == null
            ? ''
            : asT<String>("orderType", jsonRes['orderType'])!,
        signProxyName: jsonRes['signProxyName'] == null
            ? ''
            : asT<String>("signProxyName", jsonRes['signProxyName'])!,
      );

  int contractType = 0;
  int orderProperty = 0;
  String orderType = '';
  String signProxyName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractType': contractType,
        'orderProperty': orderProperty,
        'orderType': orderType,
        'signProxyName': signProxyName,
      };
}
