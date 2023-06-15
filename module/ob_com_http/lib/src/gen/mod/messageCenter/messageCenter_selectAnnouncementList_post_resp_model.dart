import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

class MessageCenterSelectAnnouncementListPostRespModel {
  MessageCenterSelectAnnouncementListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory MessageCenterSelectAnnouncementListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<Record>? record = jsonRes['record'] is List ? <Record>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(Record.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return MessageCenterSelectAnnouncementListPostRespModel(
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
  List<Record> record;
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

class Record {
  Record({
    required this.aging,
    required this.content,
    required this.createdAt,
    required this.createdBy,
    required this.downTime,
    required this.id,
    required this.isRead,
    required this.merchantId,
    required this.status,
    required this.tag,
    required this.terminal,
    required this.title,
    required this.upTime,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory Record.fromJson(Map<String, dynamic> jsonRes) => Record(
        aging:
            jsonRes['aging'] == null ? 0 : asT<int>("aging", jsonRes['aging'])!,
        content: jsonRes['content'] == null
            ? ''
            : asT<String>("content", jsonRes['content'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        downTime: jsonRes['downTime'] == null
            ? ''
            : asT<String>("downTime", jsonRes['downTime'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        isRead: jsonRes['isRead'] == null
            ? 0
            : asT<int>("isRead", jsonRes['isRead'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        tag: jsonRes['tag'] == null ? 0 : asT<int>("tag", jsonRes['tag'])!,
        terminal: jsonRes['terminal'] == null
            ? ''
            : asT<String>("terminal", jsonRes['terminal'])!,
        title: jsonRes['title'] == null
            ? ''
            : asT<String>("title", jsonRes['title'])!,
        upTime: jsonRes['upTime'] == null
            ? ''
            : asT<String>("upTime", jsonRes['upTime'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  int aging = 0;
  String content = '';

  String createdAt = '';
  String createdBy = '';
  String downTime = '';
  String id = '';
  int isRead = 0;
  String merchantId = '';
  int status = 0;
  int tag = 0;
  String terminal = '';
  String title = '';
  String upTime = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'aging': aging,
        'content': content,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'downTime': downTime,
        'id': id,
        'isRead': isRead,
        'merchantId': merchantId,
        'status': status,
        'tag': tag,
        'terminal': terminal,
        'title': title,
        'upTime': upTime,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}
