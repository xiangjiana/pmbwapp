import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

class Announcement {
  Announcement({
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

  factory Announcement.fromJson(Map<String, dynamic> jsonRes) => Announcement(
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
