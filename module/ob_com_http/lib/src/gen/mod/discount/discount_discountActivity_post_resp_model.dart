import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DiscountDiscountActivityPostRespModel {
  DiscountDiscountActivityPostRespModel({
    required this.data,
  });

  factory DiscountDiscountActivityPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<DiscountDiscountActivityPostRespModelData>? data = jsonRes['data'] is List ? <DiscountDiscountActivityPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(DiscountDiscountActivityPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return DiscountDiscountActivityPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<DiscountDiscountActivityPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'data': data,
  };
}

class DiscountDiscountActivityPostRespModelData {
  DiscountDiscountActivityPostRespModelData({
    required this.activityConfigMemberList,
    required this.activityConfigScRuleList,
    required this.activityDoc,
    required this.activityEndTime,
    required this.activityStartTime,
    required this.activityStatus,
    required this.activityStatusSort,
    required this.activityType,
    required this.applyType,
    required this.bonusAudit,
    required this.createdAt,
    required this.cycle,
    required this.deviceType,
    required this.entranceButton,
    required this.entranceEnable,
    required this.giveType,
    required this.id,
    required this.inTypeUser,
    required this.listPicture,
    required this.listPictureIcon,
    required this.masterPicture,
    required this.merchantId,
    required this.name,
    required this.operator,
    required this.pageRouteAddr,
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
    required this.venue,
    required this.vipId,
    required this.vipSerialNum,
  });

  factory DiscountDiscountActivityPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? activityConfigMemberList =
    jsonRes['activityConfigMemberList'] is List ? <String>[] : null;
    if (activityConfigMemberList != null) {
      for (final dynamic item in jsonRes['activityConfigMemberList']!) {
        if (item != null) {
          activityConfigMemberList
              .add(asT<String>("activityConfigMemberList", item)!);
        }
      }
    }

    final List<ActivityConfigScRuleList>? activityConfigScRuleList =
    jsonRes['activityConfigScRuleList'] is List
        ? <ActivityConfigScRuleList>[]
        : null;
    if (activityConfigScRuleList != null) {
      for (final dynamic item in jsonRes['activityConfigScRuleList']!) {
        if (item != null) {
          activityConfigScRuleList.add(ActivityConfigScRuleList.fromJson(
              asT<Map<String, dynamic>>("activityConfigScRuleList", item)!));
        }
      }
    }
    return DiscountDiscountActivityPostRespModelData(
      activityConfigMemberList:
      activityConfigMemberList == null ? [] : activityConfigMemberList,
      activityConfigScRuleList:
      activityConfigScRuleList == null ? [] : activityConfigScRuleList,
      activityDoc: jsonRes['activityDoc'] == null
          ? ''
          : asT<String>("activityDoc", jsonRes['activityDoc'])!,
      activityEndTime: jsonRes['activityEndTime'] == null
          ? ''
          : asT<String>("activityEndTime", jsonRes['activityEndTime'])!,
      activityStartTime: jsonRes['activityStartTime'] == null
          ? ''
          : asT<String>("activityStartTime", jsonRes['activityStartTime'])!,
      activityStatus: jsonRes['activityStatus'] == null
          ? 0
          : asT<int>("activityStatus", jsonRes['activityStatus'])!,
      activityStatusSort: jsonRes['activityStatusSort'] == null
          ? 0
          : asT<int>("activityStatusSort", jsonRes['activityStatusSort'])!,
      activityType: jsonRes['activityType'] == null
          ? 0
          : asT<int>("activityType", jsonRes['activityType'])!,
      applyType: jsonRes['applyType'] == null
          ? 0
          : asT<int>("applyType", jsonRes['applyType'])!,
      bonusAudit: jsonRes['bonusAudit'] == null
          ? 0
          : asT<int>("bonusAudit", jsonRes['bonusAudit'])!,
      createdAt: jsonRes['createdAt'] == null
          ? ''
          : asT<String>("createdAt", jsonRes['createdAt'])!,
      cycle:
      jsonRes['cycle'] == null ? 0 : asT<int>("cycle", jsonRes['cycle'])!,
      deviceType: jsonRes['deviceType'] == null
          ? ''
          : asT<String>("deviceType", jsonRes['deviceType'])!,
      entranceButton: jsonRes['entranceButton'] == null
          ? ''
          : asT<String>("entranceButton", jsonRes['entranceButton'])!,
      entranceEnable: jsonRes['entranceEnable'] == null
          ? 0
          : asT<int>("entranceEnable", jsonRes['entranceEnable'])!,
      giveType: jsonRes['giveType'] == null
          ? 0
          : asT<int>("giveType", jsonRes['giveType'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      inTypeUser: jsonRes['inTypeUser'] == null
          ? 0
          : asT<int>("inTypeUser", jsonRes['inTypeUser'])!,
      listPicture: jsonRes['listPicture'] == null
          ? ''
          : asT<String>("listPicture", jsonRes['listPicture'])!,
      listPictureIcon: jsonRes['listPictureIcon'] == null
          ? ''
          : asT<String>("listPictureIcon", jsonRes['listPictureIcon'])!,
      masterPicture: jsonRes['masterPicture'] == null
          ? ''
          : asT<String>("masterPicture", jsonRes['masterPicture'])!,
      merchantId: jsonRes['merchantId'] == null
          ? ''
          : asT<String>("merchantId", jsonRes['merchantId'])!,
      name:
      jsonRes['name'] == null ? '' : asT<String>("name", jsonRes['name'])!,
      operator: jsonRes['operator'] == null
          ? ''
          : asT<String>("operator", jsonRes['operator'])!,
      pageRouteAddr: jsonRes['pageRouteAddr'] == null
          ? ''
          : asT<String>("pageRouteAddr", jsonRes['pageRouteAddr'])!,
      sharePicture: jsonRes['sharePicture'] == null
          ? ''
          : asT<String>("sharePicture", jsonRes['sharePicture'])!,
      showEndTime: jsonRes['showEndTime'] == null
          ? ''
          : asT<String>("showEndTime", jsonRes['showEndTime'])!,
      showStartTime: jsonRes['showStartTime'] == null
          ? ''
          : asT<String>("showStartTime", jsonRes['showStartTime'])!,
      sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
      status: jsonRes['status'] == null
          ? 0
          : asT<int>("status", jsonRes['status'])!,
      tagId: jsonRes['tagId'] == null
          ? ''
          : asT<String>("tagId", jsonRes['tagId'])!,
      tagName: jsonRes['tagName'] == null
          ? ''
          : asT<String>("tagName", jsonRes['tagName'])!,
      tagSort: jsonRes['tagSort'] == null
          ? 0
          : asT<int>("tagSort", jsonRes['tagSort'])!,
      title: jsonRes['title'] == null
          ? ''
          : asT<String>("title", jsonRes['title'])!,
      updatedAt: jsonRes['updatedAt'] == null
          ? ''
          : asT<String>("updatedAt", jsonRes['updatedAt'])!,
      venue: jsonRes['venue'] == null
          ? ''
          : asT<String>("venue", jsonRes['venue'])!,
      vipId: jsonRes['vipId'] == null
          ? ''
          : asT<String>("vipId", jsonRes['vipId'])!,
      vipSerialNum: jsonRes['vipSerialNum'] == null
          ? 0
          : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
    );
  }

  List<String> activityConfigMemberList;
  List<ActivityConfigScRuleList> activityConfigScRuleList;
  String activityDoc = '';
  String activityEndTime = '';
  String activityStartTime = '';
  int activityStatus = 0;
  int activityStatusSort = 0;
  int activityType = 0;
  int applyType = 0;
  int bonusAudit = 0;
  String createdAt = '';
  int cycle = 0;
  String deviceType = '';
  String entranceButton = '';
  int entranceEnable = 0;
  int giveType = 0;
  String id = '';
  int inTypeUser = 0;
  String listPicture = '';
  String listPictureIcon = '';
  String masterPicture = '';
  String merchantId = '';
  String name = '';
  String operator = '';
  String pageRouteAddr = '';
  String sharePicture = '';
  String showEndTime = '';
  String showStartTime = '';
  int sort = 0;
  int status = 0;
  String tagId = '';
  String tagName = '';
  int tagSort = 0;
  String title = '';
  String updatedAt = '';
  String venue = '';
  String vipId = '';
  int vipSerialNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'activityConfigMemberList': activityConfigMemberList,
    'activityConfigScRuleList': activityConfigScRuleList,
    'activityDoc': activityDoc,
    'activityEndTime': activityEndTime,
    'activityStartTime': activityStartTime,
    'activityStatus': activityStatus,
    'activityStatusSort': activityStatusSort,
    'activityType': activityType,
    'applyType': applyType,
    'bonusAudit': bonusAudit,
    'createdAt': createdAt,
    'cycle': cycle,
    'deviceType': deviceType,
    'entranceButton': entranceButton,
    'entranceEnable': entranceEnable,
    'giveType': giveType,
    'id': id,
    'inTypeUser': inTypeUser,
    'listPicture': listPicture,
    'listPictureIcon': listPictureIcon,
    'masterPicture': masterPicture,
    'merchantId': merchantId,
    'name': name,
    'operator': operator,
    'pageRouteAddr': pageRouteAddr,
    'sharePicture': sharePicture,
    'showEndTime': showEndTime,
    'showStartTime': showStartTime,
    'sort': sort,
    'status': status,
    'tagId': tagId,
    'tagName': tagName,
    'tagSort': tagSort,
    'title': title,
    'updatedAt': updatedAt,
    'venue': venue,
    'vipId': vipId,
    'vipSerialNum': vipSerialNum,
  };
}

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

  factory ActivityConfigScRuleList.fromJson(Map<String, dynamic> jsonRes) =>
      ActivityConfigScRuleList(
        activityAmount: jsonRes['activityAmount'] == null
            ? 0
            : asT<int>("activityAmount", jsonRes['activityAmount'])!,
        activityId: jsonRes['activityId'] == null
            ? ''
            : asT<String>("activityId", jsonRes['activityId'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        giveType: jsonRes['giveType'] == null
            ? 0
            : asT<int>("giveType", jsonRes['giveType'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        operator: jsonRes['operator'] == null
            ? ''
            : asT<String>("operator", jsonRes['operator'])!,
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        validAmount: jsonRes['validAmount'] == null
            ? 0
            : asT<int>("validAmount", jsonRes['validAmount'])!,
        validMultiple: jsonRes['validMultiple'] == null
            ? 0
            : asT<int>("validMultiple", jsonRes['validMultiple'])!,
        validPresent: jsonRes['validPresent'] == null
            ? 0
            : asT<int>("validPresent", jsonRes['validPresent'])!,
        validTopLimit: jsonRes['validTopLimit'] == null
            ? 0
            : asT<int>("validTopLimit", jsonRes['validTopLimit'])!,
      );

  int activityAmount = 0;
  String activityId = '';
  String createdAt = '';
  int giveType = 0;
  String id = '';
  String merchantId = '';
  String operator = '';
  int sort = 0;
  String updatedAt = '';
  int validAmount = 0;
  int validMultiple = 0;
  int validPresent = 0;
  int validTopLimit = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'activityAmount': activityAmount,
    'activityId': activityId,
    'createdAt': createdAt,
    'giveType': giveType,
    'id': id,
    'merchantId': merchantId,
    'operator': operator,
    'sort': sort,
    'updatedAt': updatedAt,
    'validAmount': validAmount,
    'validMultiple': validMultiple,
    'validPresent': validPresent,
    'validTopLimit': validTopLimit,
  };
}
