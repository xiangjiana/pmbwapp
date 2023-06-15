import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractAcceptContractPostReqModel {
  ProxyProxyContractAcceptContractPostReqModel({
    required this.contractId,
    required this.remark,
  });

  factory ProxyProxyContractAcceptContractPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractAcceptContractPostReqModel(
        contractId: jsonRes['contractId'] == null
            ? 0
            : asT<int>("contractId", jsonRes['contractId'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  int contractId = 0;
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractId': contractId,
        'remark': remark,
      };
}
