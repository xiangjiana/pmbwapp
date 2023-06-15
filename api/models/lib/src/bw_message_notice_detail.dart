import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BwMessageNoticeDetail {
  BwMessageNoticeDetail({
    required this.content,
    required this.createdAt,
    required this.deviceType,
    required this.id,
    required this.isAllUser,
    required this.isDeleted,
    required this.isRead,
    required this.merchantId,
    required this.messageId,
    required this.noticeType,
    required this.retract,
    required this.title,
    required this.userId,
    required this.username,
  });

  final String content;
  final String createdAt;
  final String deviceType;
  final String id;
  final int isAllUser;
  final int isDeleted;
  final int isRead;
  final String merchantId;
  final String messageId;
  final int noticeType;
  final int retract;
  final String title;
  final String userId;
  final String username;
}
