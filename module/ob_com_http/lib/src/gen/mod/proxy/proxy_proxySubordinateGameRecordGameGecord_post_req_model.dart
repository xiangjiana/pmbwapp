import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxySubordinateGameRecordGameGecordPostReqModel {
  ProxyProxySubordinateGameRecordGameGecordPostReqModel({
    required this.endTime,
    required this.memberName,
    required this.pageNum,
    required this.pageSize,
    required this.startTime,
    required this.venueCode,
  });

  factory ProxyProxySubordinateGameRecordGameGecordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxySubordinateGameRecordGameGecordPostReqModel(
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        memberName: jsonRes['memberName'] == null
            ? ''
            : asT<String>("memberName", jsonRes['memberName'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        startTime: jsonRes['startTime'] == null
            ? ''
            : asT<String>("startTime", jsonRes['startTime'])!,
        venueCode: jsonRes['venueCode'] == null
            ? ''
            : asT<String>("venueCode", jsonRes['venueCode'])!,
      );

  String endTime = '';
  String memberName = '';
  int pageNum = 0;
  int pageSize = 0;
  String startTime = '';
  String venueCode = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endTime': endTime,
        'memberName': memberName,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'startTime': startTime,
        'venueCode': venueCode,
      };
}
