import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccessRecordDepositPostReqModel {
  AccessRecordDepositPostReqModel({
    required this.appStatus,
    required this.bizType,
    required this.endTime,
    required this.pageNum,
    required this.pageSize,
    required this.startTime,
  });

  factory AccessRecordDepositPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      AccessRecordDepositPostReqModel(
        appStatus: jsonRes['appStatus'] == null
            ? 0
            : asT<int>("appStatus", jsonRes['appStatus'])!,
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
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

  int appStatus = 0;
  int bizType = 0;
  String endTime = '';
  int pageNum = 0;
  int pageSize = 0;
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appStatus': appStatus,
        'bizType': bizType,
        'endTime': endTime,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'startTime': startTime,
      };
}
