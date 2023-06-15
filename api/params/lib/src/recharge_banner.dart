import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RechargeBanner {
  String accountType;
  String masterPicture;
  String enMasterPicture;
  String thMasterPicture;
  String vieMasterPicture;
  List<String> activityConfigMemberList;
  String activityEndTime;

  int activityGradeType;

  String activityStartTime;

  int activityStatus;

  int activityStatusSort;

  int activityType;

  int applyType;

  int bonusAudit;

  String cnActivityDoc;

  String cnTitle;

  String createdAt;

  String createdOperator;

  int cycle;

  String deviceType;

  String enActivityDoc;

  String enEntranceButton;

  String enListPicture;

  String enListPictureIcon;

  String enPcListPicture;

  String enPcListPictureIcon;

  String enPcMasterPicture;

  String enPcSharePicture;

  String enSharePicture;

  String enTitle;

  String entranceButton;

  int entranceEnable;

  int giveType;

  String id;

  int inTypeUser;

  String listPicture;

  String listPictureIcon;

  String merchantId;

  String merchantName;

  String name;

  String operator;

  String pageRouteAddr;

  String pcListPicture;

  String pcListPictureIcon;

  String pcMasterPicture;

  String pcSharePicture;

  int recommendStatus;

  String sharePicture;

  String showEndTime;

  String showStartTime;

  int sort;

  int status;

  String tagId;

  String tagName;

  int tagSort;

  String thActivityDoc;

  String thEntranceButton;

  String thListPicture;

  String thListPictureIcon;

  String thPcListPicture;

  String thPcListPictureIcon;

  String thPcMasterPicture;

  String thPcSharePicture;

  String thSharePicture;

  String thTitle;

  String title;

  String updatedAt;

  List<int> validMultipleList;

  String venue;

  String viActivityDoc;

  String vieEntranceButton;

  String vieListPicture;

  String vieListPictureIcon;

  String viePcListPicture;

  String viePcListPictureIcon;

  String viePcMasterPicture;

  String viePcSharePicture;

  String vieSharePicture;

  String vieTitle;

  String vipId;

  int vipSerialNum;



  late List<ActivityConfigScRuleList> activityConfigScRuleList;
  RechargeBanner({
    required this.accountType,
    required this.activityConfigMemberList,
    activityConfigScRuleList,
    required this.activityEndTime,
    required this.activityGradeType,
    required this.activityStartTime,
    required this.activityStatus,
    required this.activityStatusSort,
    required this.activityType,
    required this.applyType,
    required this.bonusAudit,
    required this.cnActivityDoc,
    required this.cnTitle,
    required this.createdAt,
    required this.createdOperator,
    required this.cycle,
    required this.deviceType,
    required this.enActivityDoc,
    required this.enEntranceButton,
    required this.enListPicture,
    required this.enListPictureIcon,
    required this.enMasterPicture,
    required this.enPcListPicture,
    required this.enPcListPictureIcon,
    required this.enPcMasterPicture,
    required this.enPcSharePicture,
    required this.enSharePicture,
    required this.enTitle,
    required this.entranceButton,
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
    required this.recommendStatus,
    required this.sharePicture,
    required this.showEndTime,
    required this.showStartTime,
    required this.sort,
    required this.status,
    required this.tagId,
    required this.tagName,
    required this.tagSort,
    required this.thActivityDoc,
    required this.thEntranceButton,
    required this.thListPicture,
    required this.thListPictureIcon,
    required this.thMasterPicture,
    required this.thPcListPicture,
    required this.thPcListPictureIcon,
    required this.thPcMasterPicture,
    required this.thPcSharePicture,
    required this.thSharePicture,
    required this.thTitle,
    required this.title,
    required this.updatedAt,
    required this.validMultipleList,
    required this.venue,
    required this.viActivityDoc,
    required this.vieEntranceButton,
    required this.vieListPicture,
    required this.vieListPictureIcon,
    required this.vieMasterPicture,
    required this.viePcListPicture,
    required this.viePcListPictureIcon,
    required this.viePcMasterPicture,
    required this.viePcSharePicture,
    required this.vieSharePicture,
    required this.vieTitle,
    required this.vipId,
    required this.vipSerialNum,
  }){
    this.activityConfigScRuleList =  activityConfigScRuleList.cast<ActivityConfigScRuleList>();
  }
}

@jsonSerializable
class ActivityConfigScRuleList {
  int activityAmount;

  String activityId;

  String createdAt;

  int giveType;

  String id;

  String merchantId;

  String operator;

  int sort;

  String updatedAt;

  int validAmount;

  int validMultiple;

  int validPresent;

  int validTopLimit;

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
}
