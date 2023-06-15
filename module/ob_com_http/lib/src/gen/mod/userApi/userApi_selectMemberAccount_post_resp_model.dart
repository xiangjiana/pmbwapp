import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSelectMemberAccountPostRespModel {
  UserApiSelectMemberAccountPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory UserApiSelectMemberAccountPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<UserApiSelectMemberAccountPostRespModelRecord>? record = jsonRes['record'] is List ? <UserApiSelectMemberAccountPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(UserApiSelectMemberAccountPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return UserApiSelectMemberAccountPostRespModel(
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
  List<UserApiSelectMemberAccountPostRespModelRecord> record;
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

class UserApiSelectMemberAccountPostRespModelRecord {
  UserApiSelectMemberAccountPostRespModelRecord({
    required this.amount,
    required this.changeAfter,
    required this.appType,
    required this.eventId,
    required this.createdAt,
    required this.remark,
  });

  factory UserApiSelectMemberAccountPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => UserApiSelectMemberAccountPostRespModelRecord(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        changeAfter: jsonRes['changeAfter'] == null
            ? 0.0
            : asT<double>("changeAfter", jsonRes['changeAfter'])!,
        appType: jsonRes['appType'] == null
            ? 0
            : asT<int>("appType", jsonRes['appType'])!,
        eventId: jsonRes['eventId'] == null
            ? ''
            : asT<String>("eventId", jsonRes['eventId'])!,
    createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  double amount = 0.0;
  double changeAfter = 0.0;
  int appType = 0;
  String eventId = '';
  String createdAt = '';
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'changeAfter': changeAfter,
        'appType': appType,
        'eventId': eventId,
        'occurDt': createdAt,
        'remark': remark,
      };
}
