import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2OrderInventoryOrderListPostReqModel {
  ProxySystem2OrderInventoryOrderListPostReqModel({
    required this.gameType,
    required this.operationStatus,
    required this.orderKey,
    required this.pageNum,
    required this.pageSize,
    required this.venueId,
  });

  factory ProxySystem2OrderInventoryOrderListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2OrderInventoryOrderListPostReqModel(
        gameType: jsonRes['gameType'] == null
            ? ''
            : asT<String>("gameType", jsonRes['gameType'])!,
        operationStatus: jsonRes['operationStatus'] == null
            ? 0
            : asT<int>("operationStatus", jsonRes['operationStatus'])!,
        orderKey: jsonRes['orderKey'] == null
            ? 0
            : asT<int>("orderKey", jsonRes['orderKey'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        venueId: jsonRes['venueId'] == null
            ? ''
            : asT<String>("venueId", jsonRes['venueId'])!,
      );

  String gameType = '';
  int operationStatus = 0;
  int orderKey = 0;
  int pageNum = 0;
  int pageSize = 0;
  String venueId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameType': gameType,
        'operationStatus': operationStatus,
        'orderKey': orderKey,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'venueId': venueId,
      };
}
