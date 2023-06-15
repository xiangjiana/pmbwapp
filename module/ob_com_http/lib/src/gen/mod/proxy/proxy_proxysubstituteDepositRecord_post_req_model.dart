import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxysubstituteDepositRecordPostReqModel {
  ProxyProxysubstituteDepositRecordPostReqModel({
    required this.createdAtEnd,
    required this.createdAtStart,
    required this.orderNo,
    required this.orderStatus,
    required this.type,
  });

  factory ProxyProxysubstituteDepositRecordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxysubstituteDepositRecordPostReqModel(
        createdAtEnd: jsonRes['createdAtEnd'] == null
            ? ''
            : asT<String>("createdAtEnd", jsonRes['createdAtEnd'])!,
        createdAtStart: jsonRes['createdAtStart'] == null
            ? ''
            : asT<String>("createdAtStart", jsonRes['createdAtStart'])!,
        orderNo: jsonRes['orderNo'] == null
            ? ''
            : asT<String>("orderNo", jsonRes['orderNo'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        type: jsonRes['type'] == null
            ? ''
            : asT<String>("type", jsonRes['type'])!,
      );

  String createdAtEnd = '';
  String createdAtStart = '';
  String orderNo = '';
  int orderStatus = 0;
  String type = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAtEnd': createdAtEnd,
        'createdAtStart': createdAtStart,
        'orderNo': orderNo,
        'orderStatus': orderStatus,
        'type': type,
      };
}
