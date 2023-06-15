import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerOrderQueryPostReqModel {
  ProxySystem2BankerOrderQueryPostReqModel({
    required this.endTime,
    required this.fromReason,
    required this.orderFrom,
    required this.orderKey,
    required this.pageNum,
    required this.pageSize,
    required this.searchFor,
    required this.startTime,
    required this.venue,
  });

  factory ProxySystem2BankerOrderQueryPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2BankerOrderQueryPostReqModel(
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        fromReason: jsonRes['fromReason'] == null
            ? ''
            : asT<String>("fromReason", jsonRes['fromReason'])!,
        orderFrom: jsonRes['orderFrom'] == null
            ? 0
            : asT<int>("orderFrom", jsonRes['orderFrom'])!,
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
        venue: jsonRes['venue'] == null
            ? ''
            : asT<String>("venue", jsonRes['venue'])!,
      );

  String endTime = '';
  String fromReason = '';
  int orderFrom = 0;
  int orderKey = 0;
  int pageNum = 0;
  int pageSize = 0;
  String searchFor = '';
  String startTime = '';
  String venue = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endTime': endTime,
        'fromReason': fromReason,
        'orderFrom': orderFrom,
        'orderKey': orderKey,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'searchFor': searchFor,
        'startTime': startTime,
        'venue': venue,
      };
}
