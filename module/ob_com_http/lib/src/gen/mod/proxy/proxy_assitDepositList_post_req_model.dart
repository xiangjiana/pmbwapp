import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyAssitDepositListPostReqModel {
  ProxyAssitDepositListPostReqModel({
    required this.bizType,
    required this.createdTimeEnd,
    required this.createdTimeStart,
    required this.orderStatus,
    required this.orderType,
    required this.pageNum,
    required this.pageSize,
  });

  factory ProxyAssitDepositListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyAssitDepositListPostReqModel(
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        createdTimeEnd: jsonRes['createdTimeEnd'] == null
            ? ''
            : asT<String>("createdTimeEnd", jsonRes['createdTimeEnd'])!,
        createdTimeStart: jsonRes['createdTimeStart'] == null
            ? ''
            : asT<String>("createdTimeStart", jsonRes['createdTimeStart'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        orderType: jsonRes['orderType'] == null
            ? ''
            : asT<String>("orderType", jsonRes['orderType'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
      );

  int bizType = 0;
  String createdTimeEnd = '';
  String createdTimeStart = '';
  int orderStatus = 0;
  String orderType = '';
  int pageNum = 0;
  int pageSize = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bizType': bizType,
        'createdTimeEnd': createdTimeEnd,
        'createdTimeStart': createdTimeStart,
        'orderStatus': orderStatus,
        'orderType': orderType,
        'pageNum': pageNum,
        'pageSize': pageSize,
      };
}
