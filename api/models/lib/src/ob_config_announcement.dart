import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ObConfigAnnouncement {
  ObConfigAnnouncement({
    required this.announcementAging,
    required this.announcementContent,
    required this.announcementTitle,
    required this.createdAt,
    required this.createdBy,
    required this.downTime,
    required this.id,
    required this.merchantId,
    required this.status,
    required this.tag,
    required this.terminal,
    required this.upTime,
    required this.updatedAt,
    required this.updatedBy,
  });

  int announcementAging;
  String announcementContent;
  String announcementTitle;
  String createdAt;
  String createdBy;
  String downTime;
  String id;
  String merchantId;
  int status;
  int tag;
  String terminal;
  String upTime;
  String updatedAt;
  String updatedBy;
}
