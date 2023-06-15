import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractContractRulePostReqModel {
  ProxyProxyContractContractRulePostReqModel({
    required this.contractId,
    required this.contractType,
    required this.dataSourceType,
  });

  factory ProxyProxyContractContractRulePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractContractRulePostReqModel(
        contractId: jsonRes['contractId'] == null
            ? ''
            : asT<String>("contractId", jsonRes['contractId'])!,
        contractType: jsonRes['contractType'] == null
            ? 0
            : asT<int>("contractType", jsonRes['contractType'])!,
        dataSourceType: jsonRes['dataSourceType'] == null
            ? 0
            : asT<int>("dataSourceType", jsonRes['dataSourceType'])!,
      );

  String contractId = '';
  int contractType = 0;
  int dataSourceType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractId': contractId,
        'contractType': contractType,
        'dataSourceType': dataSourceType,
      };
}
