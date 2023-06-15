import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractMyContractPostReqModel {
  ProxyProxyContractMyContractPostReqModel({
    required this.contractStatus,
    required this.contractType,
    required this.effectStatus,
  });

  factory ProxyProxyContractMyContractPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractMyContractPostReqModel(
        contractStatus: jsonRes['contractStatus'] == null
            ? 0
            : asT<int>("contractStatus", jsonRes['contractStatus'])!,
        contractType: jsonRes['contractType'] == null
            ? 0
            : asT<int>("contractType", jsonRes['contractType'])!,
        effectStatus: jsonRes['effectStatus'] == null
            ? 0
            : asT<int>("effectStatus", jsonRes['effectStatus'])!,
      );

  int contractStatus = 0;
  int contractType = 0;
  int effectStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractStatus': contractStatus,
        'contractType': contractType,
        'effectStatus': effectStatus,
      };
}
