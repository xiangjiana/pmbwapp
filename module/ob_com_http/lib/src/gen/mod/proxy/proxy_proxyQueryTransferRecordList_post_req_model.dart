import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyQueryTransferRecordListPostReqModel {
  ProxyProxyQueryTransferRecordListPostReqModel({
    required this.accountType,
    required this.bizType,
    required this.endTime,
    required this.inUserName,
    required this.pageNum,
    required this.pageSize,
    required this.startTime,
  });

  factory ProxyProxyQueryTransferRecordListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyQueryTransferRecordListPostReqModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        inUserName: jsonRes['inUserName'] == null
            ? ''
            : asT<String>("inUserName", jsonRes['inUserName'])!,
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

  int accountType = 0;
  int bizType = 0;
  String endTime = '';
  String inUserName = '';
  int pageNum = 0;
  int pageSize = 0;
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'bizType': bizType,
        'endTime': endTime,
        'inUserName': inUserName,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'startTime': startTime,
      };
}
