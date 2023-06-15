import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2OrderQueryPostReqModel {
  ProxySystem2OrderQueryPostReqModel({
    required this.betOrderVenus,
    required this.eatOrderStatus,
    required this.endTime,
    required this.orderKey,
    required this.pageNum,
    required this.pageSize,
    required this.searchFor,
    required this.startTime,
  });

  factory ProxySystem2OrderQueryPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2OrderQueryPostReqModel(
        betOrderVenus: jsonRes['betOrderVenus'] == null
            ? ''
            : asT<String>("betOrderVenus", jsonRes['betOrderVenus'])!,
        eatOrderStatus: jsonRes['eatOrderStatus'] == null
            ? 0
            : asT<int>("eatOrderStatus", jsonRes['eatOrderStatus'])!,
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        orderKey: jsonRes['orderKey'] == null
            ? 0
            : asT<int>("orderKey", jsonRes['orderKey'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        searchFor: jsonRes['searchFor'] == null
            ? ''
            : asT<String>("searchFor", jsonRes['searchFor'])!,
        startTime: jsonRes['startTime'] == null
            ? ''
            : asT<String>("startTime", jsonRes['startTime'])!,
      );

  String betOrderVenus = '';
  int eatOrderStatus = 0;
  String endTime = '';
  int orderKey = 0;
  int pageNum = 0;
  int pageSize = 0;
  String searchFor = '';
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betOrderVenus': betOrderVenus,
        'eatOrderStatus': eatOrderStatus,
        'endTime': endTime,
        'orderKey': orderKey,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'searchFor': searchFor,
        'startTime': startTime,
      };
}
