import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class InviteInviteRecordsPostReqModel {
  InviteInviteRecordsPostReqModel({
    required this.exportFlag,
    required this.pageNum,
    required this.pageSize,
    required this.queryCondition,
    required this.summary,
  });

  factory InviteInviteRecordsPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      InviteInviteRecordsPostReqModel(
        exportFlag: jsonRes['exportFlag'] == null
            ? false
            : asT<bool>("exportFlag", jsonRes['exportFlag'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        queryCondition: jsonRes["queryCondition"] == null
            ? QueryConditionInviteInviteRecordsPostReqModel.fromJson({})
            : QueryConditionInviteInviteRecordsPostReqModel.fromJson(asT<Map<String, dynamic>>(
                "queryCondition", jsonRes["queryCondition"])!),
        summary: jsonRes['summary'] == null
            ? false
            : asT<bool>("summary", jsonRes['summary'])!,
      );

  bool exportFlag = false;
  int pageNum = 0;
  int pageSize = 0;
  QueryConditionInviteInviteRecordsPostReqModel queryCondition;
  bool summary = false;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'exportFlag': exportFlag,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'queryCondition': queryCondition,
        'summary': summary,
      };
}

class QueryConditionInviteInviteRecordsPostReqModel {
  QueryConditionInviteInviteRecordsPostReqModel({
    required this.status,
  });

  factory QueryConditionInviteInviteRecordsPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      QueryConditionInviteInviteRecordsPostReqModel(
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
      );

  int status = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
      };
}
