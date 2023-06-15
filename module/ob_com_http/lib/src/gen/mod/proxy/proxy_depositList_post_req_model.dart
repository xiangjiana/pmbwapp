import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyDepositListPostReqModel {
  ProxyDepositListPostReqModel({
    required this.createdAtEnd,
    required this.createdAtStart,
    required this.orderStatus,
    required this.pageNum,
    required this.pageSize,
  });

  factory ProxyDepositListPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyDepositListPostReqModel(
        createdAtEnd: jsonRes['createdAtEnd'] == null
            ? ''
            : asT<String>("createdAtEnd", jsonRes['createdAtEnd'])!,
        createdAtStart: jsonRes['createdAtStart'] == null
            ? ''
            : asT<String>("createdAtStart", jsonRes['createdAtStart'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
      );

  String createdAtEnd = '';
  String createdAtStart = '';
  int orderStatus = 0;
  int pageNum = 0;
  int pageSize = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAtEnd': createdAtEnd,
        'createdAtStart': createdAtStart,
        'orderStatus': orderStatus,
        'pageNum': pageNum,
        'pageSize': pageSize,
      };
}
