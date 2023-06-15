import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

class Notice {
  Notice({
    required this.content,
    required this.createdAt,
    required this.deviceType,
    required this.id,
    required this.isAllUser,
    required this.isDeleted,
    required this.isRead,
    required this.merchantId,
    required this.messageId,
    required this.retract,
    required this.title,
    required this.userId,
    required this.username,
    required this.noticeType,
  });

  factory Notice.fromJson(Map<String, dynamic> jsonRes) => Notice(
        content: jsonRes['content'] == null
            ? ''
            : asT<String>("content", jsonRes['content'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        deviceType: jsonRes['deviceType'] == null
            ? ''
            : asT<String>("deviceType", jsonRes['deviceType'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        isAllUser: jsonRes['isAllUser'] == null
            ? 0
            : asT<int>("isAllUser", jsonRes['isAllUser'])!,
        isDeleted: jsonRes['isDeleted'] == null
            ? 0
            : asT<int>("isDeleted", jsonRes['isDeleted'])!,
        isRead: jsonRes['isRead'] == null
            ? 0
            : asT<int>("isRead", jsonRes['isRead'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        messageId: jsonRes['messageId'] == null
            ? ''
            : asT<String>("messageId", jsonRes['messageId'])!,
        retract: jsonRes['retract'] == null
            ? 0
            : asT<int>("retract", jsonRes['retract'])!,
        noticeType: jsonRes['noticeType'] == null
            ? 0
            : asT<int>("noticeType", jsonRes['noticeType'])!,
        title: jsonRes['title'] == null
            ? ''
            : asT<String>("title", jsonRes['title'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
        username: jsonRes['username'] == null
            ? ''
            : asT<String>("username", jsonRes['username'])!,
      );

  String content = '';
  String createdAt = '';
  String deviceType = '';
  String id = '';
  int isAllUser = 0;
  int isDeleted = 0;
  int isRead = 0;
  String merchantId = '';
  String messageId = '';
  int noticeType = 0;
  int retract = 0;
  String title = '';
  String userId = '';
  String username = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
        'createdAt': createdAt,
        'deviceType': deviceType,
        'id': id,
        'isAllUser': isAllUser,
        'isDeleted': isDeleted,
        'isRead': isRead,
        'merchantId': merchantId,
        'messageId': messageId,
        'noticeType': noticeType,
        'retract': retract,
        'title': title,
        'userId': userId,
      };
}
