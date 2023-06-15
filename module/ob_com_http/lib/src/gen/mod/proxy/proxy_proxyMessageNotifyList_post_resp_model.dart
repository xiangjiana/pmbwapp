import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMessageNotifyListPostRespModel {
  ProxyProxyMessageNotifyListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyMessageNotifyListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyMessageNotifyListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyMessageNotifyListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyMessageNotifyListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyMessageNotifyListPostRespModel(
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
  List<ProxyProxyMessageNotifyListPostRespModelRecord> record;
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

class ProxyProxyMessageNotifyListPostRespModelRecord {
  ProxyProxyMessageNotifyListPostRespModelRecord({
    required this.content,
    required this.createAt,
    required this.id,
    required this.merchantId,
    required this.messageStatus,
    required this.title,
    required this.userId,
  });

  factory ProxyProxyMessageNotifyListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyMessageNotifyListPostRespModelRecord(
        content: jsonRes['content'] == null
            ? ''
            : asT<String>("content", jsonRes['content'])!,
        createAt: jsonRes['createAt'] == null
            ? ''
            : asT<String>("createAt", jsonRes['createAt'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        messageStatus: jsonRes['messageStatus'] == null
            ? 0
            : asT<int>("messageStatus", jsonRes['messageStatus'])!,
        title: jsonRes['title'] == null
            ? ''
            : asT<String>("title", jsonRes['title'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
      );

  String content = '';
  String createAt = '';
  String id = '';
  String merchantId = '';
  int messageStatus = 0;
  String title = '';
  String userId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
        'createAt': createAt,
        'id': id,
        'merchantId': merchantId,
        'messageStatus': messageStatus,
        'title': title,
        'userId': userId,
      };
}
