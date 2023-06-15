import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyRebateListPagePostReqModel {
  ProxyRebateListPagePostReqModel({
    required this.endTime,
    required this.pageNum,
    required this.pageSize,
    required this.startTime,
  });

  factory ProxyRebateListPagePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyRebateListPagePostReqModel(
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        startTime: jsonRes['startTime'] == null
            ? ''
            : asT<String>("startTime", jsonRes['startTime'])!,
      );

  String endTime = '';
  int pageNum = 0;
  int pageSize = 0;
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endTime': endTime,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'startTime': startTime,
      };
}
