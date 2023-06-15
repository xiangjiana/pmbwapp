import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractContractManageListPostReqModel {
  ProxyProxyContractContractManageListPostReqModel({
    required this.contractId,
    required this.contractStatus,
    required this.contractType,
    required this.orderProperty,
    required this.orderType,
    required this.proxyName,
    required this.signProxyName,
    required this.type,
  });

  factory ProxyProxyContractContractManageListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractContractManageListPostReqModel(
        contractId: jsonRes['contractId'] == null
            ? 0
            : asT<int>("contractId", jsonRes['contractId'])!,
        contractStatus: jsonRes['contractStatus'] == null
            ? 0
            : asT<int>("contractStatus", jsonRes['contractStatus'])!,
        contractType: jsonRes['contractType'] == null
            ? 0
            : asT<int>("contractType", jsonRes['contractType'])!,
        orderProperty: jsonRes['orderProperty'] == null
            ? 0
            : asT<int>("orderProperty", jsonRes['orderProperty'])!,
        orderType: jsonRes['orderType'] == null
            ? ''
            : asT<String>("orderType", jsonRes['orderType'])!,
        proxyName: jsonRes['proxyName'] == null
            ? ''
            : asT<String>("proxyName", jsonRes['proxyName'])!,
        signProxyName: jsonRes['signProxyName'] == null
            ? ''
            : asT<String>("signProxyName", jsonRes['signProxyName'])!,
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  int contractId = 0;
  int contractStatus = 0;
  int contractType = 0;
  int orderProperty = 0;
  String orderType = '';
  String proxyName = '';
  String signProxyName = '';
  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractId': contractId,
        'contractStatus': contractStatus,
        'contractType': contractType,
        'orderProperty': orderProperty,
        'orderType': orderType,
        'proxyName': proxyName,
        'signProxyName': signProxyName,
        'type': type,
      };
}
