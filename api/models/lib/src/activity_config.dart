import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ActivityConfig {
  ActivityConfig({
    required this.accountType,
    required this.activityConfigMemberList,
    required this.activityConfigScRuleList,
    required this.activityDoc,
    required this.activityEndTime,
    required this.activityGradeType,
    required this.activityStartTime,
    required this.activityStatus,
    required this.activityStatusSort,
    required this.activityType,
    required this.applyType,
    required this.bonusAudit,
    required this.createdAt,
    required this.createdOperator,
    required this.cycle,
    required this.deviceType,
    required this.entranceEnable,
    required this.giveType,
    required this.id,
    required this.inTypeUser,
    required this.listPicture,
    required this.listPictureIcon,
    required this.masterPicture,
    required this.merchantId,
    required this.merchantName,
    required this.name,
    required this.operator,
    required this.pageRouteAddr,
    required this.pcListPicture,
    required this.pcListPictureIcon,
    required this.pcMasterPicture,
    required this.pcSharePicture,
    required this.sharePicture,
    required this.showEndTime,
    required this.showStartTime,
    required this.sort,
    required this.status,
    required this.tagId,
    required this.tagName,
    required this.tagSort,
    required this.title,
    required this.updatedAt,
    required this.validMultipleList,
    required this.venue,
    required this.vipId,
    required this.vipSerialNum,
  });

  final String accountType;
  final List<String> activityConfigMemberList;
  final List<dynamic> activityConfigScRuleList;
  final String activityDoc;
  final String activityEndTime;
  final num activityGradeType;
  final String activityStartTime;
  final num activityStatus;
  final num activityStatusSort;
  final num activityType;
  final num applyType;
  final num bonusAudit;
  final String createdAt;
  final String createdOperator;
  final num cycle;
  final String deviceType;
  final num entranceEnable;
  final num giveType;
  final String id;
  final num inTypeUser;
  final String listPicture;
  final String listPictureIcon;
  final String masterPicture;
  final String merchantId;
  final String merchantName;
  final String name;
  final String operator;
  final String pageRouteAddr;
  final String pcListPicture;
  final String pcListPictureIcon;
  final String pcMasterPicture;
  final String pcSharePicture;
  final String sharePicture;
  final String showEndTime;
  final String showStartTime;
  final num sort;
  final num status;
  final String tagId;
  final String tagName;
  final num tagSort;
  final String title;
  final String updatedAt;
  final List<num> validMultipleList;
  final String venue;
  final String vipId;
  final num vipSerialNum;
}

@jsonSerializable
class ActivityConfigScRuleList {
  ActivityConfigScRuleList({
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

  final num activityAmount;
  final String activityId;
  final String createdAt;
  final num giveType;
  final String id;
  final String merchantId;
  final String operator;
  final num sort;
  final String updatedAt;
  final num validAmount;
  final num validMultiple;
  final num validPresent;
  final num validTopLimit;
}
