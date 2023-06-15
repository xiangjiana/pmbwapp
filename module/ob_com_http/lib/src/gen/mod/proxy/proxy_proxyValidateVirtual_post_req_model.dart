import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyValidateVirtualPostReqModel {
  ProxyProxyValidateVirtualPostReqModel({
    required this.virtualAddress,
    required this.virtualKind,
    required this.virtualProtocol,
  });

  factory ProxyProxyValidateVirtualPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyValidateVirtualPostReqModel(
        virtualAddress: jsonRes['virtualAddress'] == null
            ? ''
            : asT<String>("virtualAddress", jsonRes['virtualAddress'])!,
        virtualKind: jsonRes['virtualKind'] == null
            ? ''
            : asT<String>("virtualKind", jsonRes['virtualKind'])!,
        virtualProtocol: jsonRes['virtualProtocol'] == null
            ? ''
            : asT<String>("virtualProtocol", jsonRes['virtualProtocol'])!,
      );

  String virtualAddress = '';
  String virtualKind = '';
  String virtualProtocol = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'virtualAddress': virtualAddress,
        'virtualKind': virtualKind,
        'virtualProtocol': virtualProtocol,
      };
}
