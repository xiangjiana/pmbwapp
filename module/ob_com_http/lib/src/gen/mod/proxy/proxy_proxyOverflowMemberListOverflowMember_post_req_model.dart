import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyOverflowMemberListOverflowMemberPostReqModel {
  ProxyProxyOverflowMemberListOverflowMemberPostReqModel({
    required this.applyTimeEnd,
    required this.applyTimeStart,
    required this.auditStatus,
    required this.pageNum,
    required this.pageSize,
    required this.userName,
  });

  factory ProxyProxyOverflowMemberListOverflowMemberPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyOverflowMemberListOverflowMemberPostReqModel(
        applyTimeEnd: jsonRes['applyTimeEnd'] == null
            ? ''
            : asT<String>("applyTimeEnd", jsonRes['applyTimeEnd'])!,
        applyTimeStart: jsonRes['applyTimeStart'] == null
            ? ''
            : asT<String>("applyTimeStart", jsonRes['applyTimeStart'])!,
        auditStatus: jsonRes['auditStatus'] == null
            ? 0
            : asT<int>("auditStatus", jsonRes['auditStatus'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String applyTimeEnd = '';
  String applyTimeStart = '';
  int auditStatus = 0;
  int pageNum = 0;
  int pageSize = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'applyTimeEnd': applyTimeEnd,
        'applyTimeStart': applyTimeStart,
        'auditStatus': auditStatus,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'userName': userName,
      };
}
