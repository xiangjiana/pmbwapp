import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyWithdrawVirtualPostReqModel {
  ProxyProxyWithdrawVirtualPostReqModel({
    required this.deviceNo,
    required this.payPassword,
    required this.virtualReqDTO,
  });

  factory ProxyProxyWithdrawVirtualPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<VirtualReqDTO>? virtualReqDTO =
        jsonRes['virtualReqDTO'] is List ? <VirtualReqDTO>[] : null;
    if (virtualReqDTO != null) {
      for (final dynamic item in jsonRes['virtualReqDTO']!) {
        if (item != null) {
          virtualReqDTO.add(VirtualReqDTO.fromJson(
              asT<Map<String, dynamic>>("virtualReqDTO", item)!));
        }
      }
    }
    return ProxyProxyWithdrawVirtualPostReqModel(
      deviceNo: jsonRes['deviceNo'] == null
          ? ''
          : asT<String>("deviceNo", jsonRes['deviceNo'])!,
      payPassword: jsonRes['payPassword'] == null
          ? ''
          : asT<String>("payPassword", jsonRes['payPassword'])!,
      virtualReqDTO: virtualReqDTO == null ? [] : virtualReqDTO,
    );
  }

  String deviceNo = '';
  String payPassword = '';
  List<VirtualReqDTO> virtualReqDTO;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceNo': deviceNo,
        'payPassword': payPassword,
        'virtualReqDTO': virtualReqDTO,
      };
}

class VirtualReqDTO {
  VirtualReqDTO({
    required this.orderAmount,
    required this.protocol,
    required this.realName,
    required this.virtualAddress,
    required this.virtualKind,
  });

  factory VirtualReqDTO.fromJson(Map<String, dynamic> jsonRes) => VirtualReqDTO(
        orderAmount: jsonRes['orderAmount'] == null
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
        protocol: jsonRes['protocol'] == null
            ? ''
            : asT<String>("protocol", jsonRes['protocol'])!,
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
        virtualAddress: jsonRes['virtualAddress'] == null
            ? ''
            : asT<String>("virtualAddress", jsonRes['virtualAddress'])!,
        virtualKind: jsonRes['virtualKind'] == null
            ? ''
            : asT<String>("virtualKind", jsonRes['virtualKind'])!,
      );

  double orderAmount = 0.0;
  String protocol = '';
  String realName = '';
  String virtualAddress = '';
  String virtualKind = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderAmount': orderAmount,
        'protocol': protocol,
        'realName': realName,
        'virtualAddress': virtualAddress,
        'virtualKind': virtualKind,
      };
}
