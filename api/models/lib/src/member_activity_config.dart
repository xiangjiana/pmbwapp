import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberActivityConfig {
  MemberActivityConfig({
    required this.accountType,
    required this.activityDoc,
    required this.activityEndTime,
    required this.activityStartTime,
    required this.activityStatus,
    required this.activityType,
    required this.applyType,
    required this.cycle,
    required this.deviceType,
    required this.entranceButton,
    required this.entranceEnable,
    required this.giveType,
    required this.id,
    required this.inTypeUser,
    required this.isJoin,
    required this.listPicture,
    required this.listPictureIcon,
    required this.masterPicture,
    required this.merchantId,
    required this.merchantName,
    required this.name,
    required this.pageRouteAddr,
    required this.pcListPicture,
    required this.pcListPictureIcon,
    required this.pcMasterPicture,
    required this.pcSharePicture,
    required this.scRuleList,
    required this.sharePicture,
    required this.showEndTime,
    required this.showStartTime,
    required this.sort,
    required this.status,
    required this.tagId,
    required this.tagName,
    required this.title,
    required this.venue,
    required this.vipId,
    required this.vipLevel,
  });

  final String accountType;
  final String activityDoc;
  final String activityEndTime;
  final String activityStartTime;
  final int activityStatus;
  final int activityType;
  final int applyType;
  final int cycle;
  final String deviceType;
  final String entranceButton;
  final int entranceEnable;
  final int giveType;
  final String id;
  final int inTypeUser;
  final int isJoin;
  final String listPicture;
  final String listPictureIcon;
  final String masterPicture;
  final String merchantId;
  final String merchantName;
  final String name;
  final String pageRouteAddr;
  final String pcListPicture;
  final String pcListPictureIcon;
  final String pcMasterPicture;
  final String pcSharePicture;
  final List<ScRuleList> scRuleList;
  final String sharePicture;
  final String showEndTime;
  final String showStartTime;
  final int sort;
  final int status;
  final int tagId;
  final String tagName;
  final String title;
  final String venue;
  final int vipId;
  final String vipLevel;
}

@jsonSerializable
class ScRuleList {
  ScRuleList({
    required this.activityAmount,
    required this.activityId,
    required this.createdAt,
    required this.giveType,
    required this.id,
    required this.merchantId,
    required this.operator,
    required this.sort,
    required this.updatedAt,
    required this.validAmount,
    required this.validMultiple,
    required this.validPresent,
    required this.validTopLimit,
  });

  final int activityAmount;
  final String activityId;
  final String createdAt;
  final int giveType;
  final String id;
  final String merchantId;
  final String operator;
  final int sort;
  final String updatedAt;
  final int validAmount;
  final int validMultiple;
  final int validPresent;
  final int validTopLimit;
}
