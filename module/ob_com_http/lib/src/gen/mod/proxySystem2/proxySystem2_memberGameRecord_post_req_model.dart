import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2MemberGameRecordPostReqModel {
  ProxySystem2MemberGameRecordPostReqModel({
    required this.endTime,
    required this.gameCode,
    required this.orderKey,
    required this.orderStatus,
    required this.pageNum,
    required this.pageSize,
    required this.searchFor,
    required this.startTime,
  });

  factory ProxySystem2MemberGameRecordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2MemberGameRecordPostReqModel(
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        orderKey: jsonRes['orderKey'] == null
            ? 0
            : asT<int>("orderKey", jsonRes['orderKey'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? ''
            : asT<String>("orderStatus", jsonRes['orderStatus'])!,
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

  String endTime = '';
  String gameCode = '';
  int orderKey = 0;
  String orderStatus = '';
  int pageNum = 0;
  int pageSize = 0;
  String searchFor = '';
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endTime': endTime,
        'gameCode': gameCode,
        'orderKey': orderKey,
        'orderStatus': orderStatus,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'searchFor': searchFor,
        'startTime': startTime,
      };
}
