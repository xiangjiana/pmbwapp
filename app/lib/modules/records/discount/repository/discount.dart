
class Discount {
  List<String>? activityConfigMemberList;
  List<ActivityConfigScRuleListBean>? activityConfigScRuleList;
  String? activityDoc;
  String? activityEndTime;
  String? activityStartTime;
  int? activityStatus;
  int? activityStatusSort;
  int? activityType;
  int? applyType;
  int? bonusAudit;
  String? createdAt;
  int? cycle;
  String? deviceType;
  String? entranceButton;
  int? entranceEnable;
  int? giveType;
  String? id;
  int? inTypeUser;
  String? listPicture;
  String? listPictureIcon;
  String? masterPicture;
  String? merchantId;
  String? name;
  String? operator;
  String? pageRouteAddr;
  String? sharePicture;
  String? showEndTime;
  String? showStartTime;
  int? sort;
  int? status;
  String? tagId;
  String? tagName;
  int? tagSort;
  String? title;
  String? updatedAt;
  String? venue;
  String? vipId;
  int? vipSerialNum;

  Discount.fromJson(dynamic json) {
    final List<ActivityConfigScRuleListBean>? data =
        json['activityConfigScRuleList'] is List
            ? <ActivityConfigScRuleListBean>[]
            : null;
    if (data != null) {
      for (final dynamic item in json['activityConfigScRuleList']!) {
        if (item != null) {
          data.add(ActivityConfigScRuleListBean.fromJson(item));
        }
      }
    }

    activityConfigMemberList = json['activityConfigMemberList'];
    activityConfigScRuleList = data ?? [];
    activityDoc = json['activityDoc'];
    activityEndTime = json['activityEndTime'];
    activityStartTime = json['activityStartTime'];
    activityStatus = json['activityStatus'];
    activityStatusSort = json['activityStatusSort'];
    activityType = json['activityType'];
    applyType = json['applyType'];
    bonusAudit = json['bonusAudit'];
    createdAt = json['createdAt'];
    cycle = json['cycle'];
    deviceType = json['deviceType'];
    entranceButton = json['entranceButton'];
    entranceEnable = json['entranceEnable'];
    giveType = json['giveType'];
    id = json['id'];
    inTypeUser = json['inTypeUser'];
    listPicture = json['listPicture'];
    listPictureIcon = json['listPictureIcon'];
    masterPicture = json['masterPicture'];
    merchantId = json['merchantId'];
    name = json['name'];
    operator = json['operator'];
    pageRouteAddr = json['pageRouteAddr'];
    sharePicture = json['sharePicture'];
    showEndTime = json['showEndTime'];
    showStartTime = json['showStartTime'];
    sort = json['sort'];
    status = json['status'];
    tagId = json['tagId'];
    tagName = json['tagName'];
    tagSort = json['tagSort'];
    title = json['title'];
    updatedAt = json['updatedAt'];
    venue = json['venue'];
    vipId = json['vipId'];
    vipSerialNum = json['vipSerialNum'];
  }

  Map<String, dynamic> toJson() => {
        "activityConfigMemberList": activityConfigMemberList,
        "activityConfigScRuleList": activityConfigScRuleList,
        "activityDoc": activityDoc,
        "activityEndTime": activityEndTime,
        "activityStartTime": activityStartTime,
        "activityStatus": activityStatus,
        "activityStatusSort": activityStatusSort,
        "activityType": activityType,
        "applyType": applyType,
        "bonusAudit": bonusAudit,
        "createdAt": createdAt,
        "cycle": cycle,
        "deviceType": deviceType,
        "entranceButton": entranceButton,
        "entranceEnable": entranceEnable,
        "giveType": giveType,
        "id": id,
        "inTypeUser": inTypeUser,
        "listPicture": listPicture,
        "listPictureIcon": listPictureIcon,
        "masterPicture": masterPicture,
        "merchantId": merchantId,
        "name": name,
        "operator": operator,
        "pageRouteAddr": pageRouteAddr,
        "sharePicture": sharePicture,
        "showEndTime": showEndTime,
        "showStartTime": showStartTime,
        "sort": sort,
        "status": status,
        "tagId": tagId,
        "tagName": tagName,
        "tagSort": tagSort,
        "title": title,
        "updatedAt": updatedAt,
        "venue": venue,
        "vipId": vipId,
        "vipSerialNum": vipSerialNum,
      };
}

class ActivityConfigScRuleListBean {
  int? activityAmount;
  String? activityId;
  String? createdAt;
  int? giveType;
  String? id;
  String? merchantId;
  String? operator;
  int? sort;
  String? updatedAt;
  int? validAmount;
  int? validMultiple;
  int? validPresent;
  int? validTopLimit;

  ActivityConfigScRuleListBean.fromJson(dynamic json) {
    activityAmount = json['activityAmount'];
    activityId = json['activityId'];
    createdAt = json['createdAt'];
    giveType = json['giveType'];
    id = json['id'];
    merchantId = json['merchantId'];
    operator = json['operator'];
    sort = json['sort'];
    updatedAt = json['updatedAt'];
    validAmount = json['validAmount'];
    validMultiple = json['validMultiple'];
    validPresent = json['validPresent'];
    validTopLimit = json['validTopLimit'];
  }

  Map<String, dynamic> toJson() => {
        "activityAmount": activityAmount,
        "activityId": activityId,
        "createdAt": createdAt,
        "giveType": giveType,
        "id": id,
        "merchantId": merchantId,
        "operator": operator,
        "sort": sort,
        "updatedAt": updatedAt,
        "validAmount": validAmount,
        "validMultiple": validMultiple,
        "validPresent": validPresent,
        "validTopLimit": validTopLimit,
      };
}
