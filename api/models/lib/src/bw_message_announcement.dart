import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BwMessageAnnouncement {
  BwMessageAnnouncement({
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

  final int aging;
  final String content;
  final String createdAt;
  final String createdBy;
  final String downTime;
  final String id;
  final int isRead;
  final String merchantId;
  final int status;
  final int tag;
  final String terminal;
  final String title;
  final String upTime;
  final String updatedAt;
  final String updatedBy;
}
