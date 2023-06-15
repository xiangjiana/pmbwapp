import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class FeedBackFeedBackListPostRespModel {
  FeedBackFeedBackListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory FeedBackFeedBackListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<FeedBackFeedBackListPostRespModelRecord>? record = jsonRes['record'] is List ? <FeedBackFeedBackListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(FeedBackFeedBackListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return FeedBackFeedBackListPostRespModel(
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
  List<FeedBackFeedBackListPostRespModelRecord> record;
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

class FeedBackFeedBackListPostRespModelRecord {
  FeedBackFeedBackListPostRespModelRecord({
    required this.createDt,
    required this.headerUrl,
    required this.problemDescribe,
    required this.problemType,
    required this.url,
    required this.userName,
  });

  factory FeedBackFeedBackListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => FeedBackFeedBackListPostRespModelRecord(
        createDt: jsonRes['createDt'] == null
            ? ''
            : asT<String>("createDt", jsonRes['createDt'])!,
        headerUrl: jsonRes['headerUrl'] == null
            ? ''
            : asT<String>("headerUrl", jsonRes['headerUrl'])!,
        problemDescribe: jsonRes['problemDescribe'] == null
            ? ''
            : asT<String>("problemDescribe", jsonRes['problemDescribe'])!,
        problemType: jsonRes['problemType'] == null
            ? 0
            : asT<int>("problemType", jsonRes['problemType'])!,
        url: jsonRes['url'] == null ? '' : asT<String>("url", jsonRes['url'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String createDt = '';
  String headerUrl = '';
  String problemDescribe = '';
  int problemType = 0;
  String url = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createDt': createDt,
        'headerUrl': headerUrl,
        'problemDescribe': problemDescribe,
        'problemType': problemType,
        'url': url,
        'userName': userName,
      };
}
