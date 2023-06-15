import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyOverflowMemberListOverflowMemberPostRespModel {
  ProxyProxyOverflowMemberListOverflowMemberPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyOverflowMemberListOverflowMemberPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyOverflowMemberListOverflowMemberPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes['summary'] == null
          ? Map<String, dynamic>()
          : asT<Object>("summary", jsonRes['summary'])!,
      totalPage: jsonRes['totalPage'] == null
          ? 0
          : asT<int>("totalPage", jsonRes['totalPage'])!,
      totalRecord: jsonRes['totalRecord'] == null
          ? 0
          : asT<int>("totalRecord", jsonRes['totalRecord'])!,
    );
  }

  int pageNum = 0;
  int pageSize = 0;
  List<ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord> record;
  Object summary;
  int totalPage = 0;
  int totalRecord = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'record': record,
        'summary': summary,
        'totalPage': totalPage,
        'totalRecord': totalRecord,
      };
}

class ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord {
  ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord({
    required this.accountType,
    required this.applyTime,
    required this.auditRemark,
    required this.auditStatus,
    required this.auditTime,
    required this.userId,
    required this.userName,
  });

  factory ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyOverflowMemberListOverflowMemberPostRespModelRecord(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        applyTime: jsonRes['applyTime'] == null
            ? ''
            : asT<String>("applyTime", jsonRes['applyTime'])!,
        auditRemark: jsonRes['auditRemark'] == null
            ? ''
            : asT<String>("auditRemark", jsonRes['auditRemark'])!,
        auditStatus: jsonRes['auditStatus'] == null
            ? 0
            : asT<int>("auditStatus", jsonRes['auditStatus'])!,
        auditTime: jsonRes['auditTime'] == null
            ? ''
            : asT<String>("auditTime", jsonRes['auditTime'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  int accountType = 0;
  String applyTime = '';
  String auditRemark = '';
  int auditStatus = 0;
  String auditTime = '';
  String userId = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'applyTime': applyTime,
        'auditRemark': auditRemark,
        'auditStatus': auditStatus,
        'auditTime': auditTime,
        'userId': userId,
        'userName': userName,
      };
}
