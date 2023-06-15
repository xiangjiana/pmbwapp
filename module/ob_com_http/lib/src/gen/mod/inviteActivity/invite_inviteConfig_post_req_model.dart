import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class InviteInviteConfigPostReqModel {
  InviteInviteConfigPostReqModel({
    required this.exportFlag,
    required this.pageNum,
    required this.pageSize,
    required this.queryCondition,
    required this.summary,
  });

  factory InviteInviteConfigPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      InviteInviteConfigPostReqModel(
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
            ? QueryCondition.fromJson({})
            : QueryCondition.fromJson(asT<Map<String, dynamic>>(
                "queryCondition", jsonRes["queryCondition"])!),
        summary: jsonRes['summary'] == null
            ? false
            : asT<bool>("summary", jsonRes['summary'])!,
      );

  bool exportFlag = false;
  int pageNum = 0;
  int pageSize = 0;
  QueryCondition queryCondition;
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

class QueryCondition {
  QueryCondition({
    required this.status,
  });

  factory QueryCondition.fromJson(Map<String, dynamic> jsonRes) =>
      QueryCondition(
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
