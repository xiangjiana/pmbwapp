import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class InviteInviteConfigPostRespModel {
  InviteInviteConfigPostRespModel({
    required this.id,
    required this.merchantId,
    required this.appId,
    required this.name,
    required this.status,
    required this.title,
    required this.pageRouteAddr,
    required this.deviceType,
    required this.inTypeUser,
    required this.cycle,
    required this.showStartTime,
    required this.showEndTime,
    required this.activityStartTime,
    required this.activityEndTime,
    required this.venue,
    required this.inviteTitle,
    required this.inviteRewardType,
    required this.inviteDepositCountType,
    required this.inviteDepositCountDay,
    required this.inviteRewardCountType,
    required this.inviteRewardAmountMax,
    required this.inviteRewardSendType,
    required this.inviteRewardAuditFlag,
    required this.inviteRewardSendPosition,
    required this.inviteRewardReceiveType,
    required this.inviteRewardInviteesFlag,
    required this.depositTitle,
    required this.depositSwitch,
    required this.depositValidity,
    required this.depositInviteesAmount,
    required this.depositRewardType,
    required this.depositIpRule,
    required this.depositDeviceRule,
    required this.betTitle,
    required this.betSwitch,
    required this.betCountType,
    required this.betRewardRate,
    required this.betRewardDay,
    required this.betRewardMin,
    required this.betRewardMax,
    required this.betRewardSendType,
    required this.betRewardExamineFlag,
    required this.betRewardSendPosition,
    required this.betRewardReceiveType,
    required this.masterPicture,
    required this.sharePicture,
    required this.inviteTaskInfo,
    required this.inviteTaskRule,
    required this.depositTaskInfo,
    required this.depositTaskRule,
    required this.betTaskInfo,
    required this.betTaskRule,
    required this.operator,
    required this.createdAt,
    required this.updatedAt,
    required this.excelList,
    required this.inviteTaskRuleList,
    required this.inviteDepositRuleList,
  });

  factory InviteInviteConfigPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? excelList =
        jsonRes['excelList'] is List ? <String>[] : null;
    if (excelList != null) {
      for (final dynamic item in jsonRes['excelList']!) {
        if (item != null) {
          excelList.add(asT<String>("excelList", item)!);
        }
      }
    }

    final List<InviteTaskRuleList>? inviteTaskRuleList =
        jsonRes['inviteTaskRuleList'] is List ? <InviteTaskRuleList>[] : null;
    if (inviteTaskRuleList != null) {
      for (final dynamic item in jsonRes['inviteTaskRuleList']!) {
        if (item != null) {
          inviteTaskRuleList.add(InviteTaskRuleList.fromJson(
              asT<Map<String, dynamic>>("inviteTaskRuleList", item)!));
        }
      }
    }

    final List<InviteDepositRuleList>? inviteDepositRuleList =
        jsonRes['inviteDepositRuleList'] is List
            ? <InviteDepositRuleList>[]
            : null;
    if (inviteDepositRuleList != null) {
      for (final dynamic item in jsonRes['inviteDepositRuleList']!) {
        if (item != null) {
          inviteDepositRuleList.add(InviteDepositRuleList.fromJson(
              asT<Map<String, dynamic>>("inviteDepositRuleList", item)!));
        }
      }
    }
    return InviteInviteConfigPostRespModel(
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      merchantId: jsonRes['merchantId'] == null
          ? ''
          : asT<String>("merchantId", jsonRes['merchantId'])!,
      appId:
          jsonRes['appId'] == null ? 0 : asT<int>("appId", jsonRes['appId'])!,
      name:
          jsonRes['name'] == null ? '' : asT<String>("name", jsonRes['name'])!,
      status: jsonRes['status'] == null
          ? 0
          : asT<int>("status", jsonRes['status'])!,
      title: jsonRes['title'] == null
          ? ''
          : asT<String>("title", jsonRes['title'])!,
      pageRouteAddr: jsonRes['pageRouteAddr'] == null
          ? ''
          : asT<String>("pageRouteAddr", jsonRes['pageRouteAddr'])!,
      deviceType: jsonRes['deviceType'] == null
          ? ''
          : asT<String>("deviceType", jsonRes['deviceType'])!,
      inTypeUser: jsonRes['inTypeUser'] == null
          ? 0
          : asT<int>("inTypeUser", jsonRes['inTypeUser'])!,
      cycle:
          jsonRes['cycle'] == null ? 0 : asT<int>("cycle", jsonRes['cycle'])!,
      showStartTime: jsonRes['showStartTime'] == null
          ? ''
          : asT<String>("showStartTime", jsonRes['showStartTime'])!,
      showEndTime: jsonRes['showEndTime'] == null
          ? ''
          : asT<String>("showEndTime", jsonRes['showEndTime'])!,
      activityStartTime: jsonRes['activityStartTime'] == null
          ? ''
          : asT<String>("activityStartTime", jsonRes['activityStartTime'])!,
      activityEndTime: jsonRes['activityEndTime'] == null
          ? ''
          : asT<String>("activityEndTime", jsonRes['activityEndTime'])!,
      venue: jsonRes['venue'] == null
          ? ''
          : asT<String>("venue", jsonRes['venue'])!,
      inviteTitle: jsonRes['inviteTitle'] == null
          ? ''
          : asT<String>("inviteTitle", jsonRes['inviteTitle'])!,
      inviteRewardType: jsonRes['inviteRewardType'] == null
          ? 0
          : asT<int>("inviteRewardType", jsonRes['inviteRewardType'])!,
      inviteDepositCountType: jsonRes['inviteDepositCountType'] == null
          ? 0
          : asT<int>(
              "inviteDepositCountType", jsonRes['inviteDepositCountType'])!,
      inviteDepositCountDay: jsonRes['inviteDepositCountDay'] == null
          ? 0
          : asT<int>(
              "inviteDepositCountDay", jsonRes['inviteDepositCountDay'])!,
      inviteRewardCountType: jsonRes['inviteRewardCountType'] == null
          ? 0
          : asT<int>(
              "inviteRewardCountType", jsonRes['inviteRewardCountType'])!,
      inviteRewardAmountMax: jsonRes['inviteRewardAmountMax'] == null
          ? 0
          : asT<int>(
              "inviteRewardAmountMax", jsonRes['inviteRewardAmountMax'])!,
      inviteRewardSendType: jsonRes['inviteRewardSendType'] == null
          ? 0
          : asT<int>("inviteRewardSendType", jsonRes['inviteRewardSendType'])!,
      inviteRewardAuditFlag: jsonRes['inviteRewardAuditFlag'] == null
          ? 0
          : asT<int>(
              "inviteRewardAuditFlag", jsonRes['inviteRewardAuditFlag'])!,
      inviteRewardSendPosition: jsonRes['inviteRewardSendPosition'] == null
          ? 0
          : asT<int>(
              "inviteRewardSendPosition", jsonRes['inviteRewardSendPosition'])!,
      inviteRewardReceiveType: jsonRes['inviteRewardReceiveType'] == null
          ? 0
          : asT<int>(
              "inviteRewardReceiveType", jsonRes['inviteRewardReceiveType'])!,
      inviteRewardInviteesFlag: jsonRes['inviteRewardInviteesFlag'] == null
          ? 0
          : asT<int>(
              "inviteRewardInviteesFlag", jsonRes['inviteRewardInviteesFlag'])!,
      depositTitle: jsonRes['depositTitle'] == null
          ? ''
          : asT<String>("depositTitle", jsonRes['depositTitle'])!,
      depositSwitch: jsonRes['depositSwitch'] == null
          ? 0
          : asT<int>("depositSwitch", jsonRes['depositSwitch'])!,
      depositValidity: jsonRes['depositValidity'] == null
          ? 0
          : asT<int>("depositValidity", jsonRes['depositValidity'])!,
      depositInviteesAmount: jsonRes['depositInviteesAmount'] == null
          ? 0
          : asT<int>(
              "depositInviteesAmount", jsonRes['depositInviteesAmount'])!,
      depositRewardType: jsonRes['depositRewardType'] == null
          ? 0
          : asT<int>("depositRewardType", jsonRes['depositRewardType'])!,
      depositIpRule: jsonRes['depositIpRule'] == null
          ? 0
          : asT<int>("depositIpRule", jsonRes['depositIpRule'])!,
      depositDeviceRule: jsonRes['depositDeviceRule'] == null
          ? 0
          : asT<int>("depositDeviceRule", jsonRes['depositDeviceRule'])!,
      betTitle: jsonRes['betTitle'] == null
          ? ''
          : asT<String>("betTitle", jsonRes['betTitle'])!,
      betSwitch: jsonRes['betSwitch'] == null
          ? 0
          : asT<int>("betSwitch", jsonRes['betSwitch'])!,
      betCountType: jsonRes['betCountType'] == null
          ? 0
          : asT<int>("betCountType", jsonRes['betCountType'])!,
      betRewardRate: jsonRes['betRewardRate'] == null
          ? 0.0
          : asT<double>("betRewardRate", jsonRes['betRewardRate'])!,
      betRewardDay: jsonRes['betRewardDay'] == null
          ? 0
          : asT<int>("betRewardDay", jsonRes['betRewardDay'])!,
      betRewardMin: jsonRes['betRewardMin'] == null
          ? 0
          : asT<int>("betRewardMin", jsonRes['betRewardMin'])!,
      betRewardMax: jsonRes['betRewardMax'] == null
          ? 0.0
          : asT<double>("betRewardMax", jsonRes['betRewardMax'])!,
      betRewardSendType: jsonRes['betRewardSendType'] == null
          ? 0
          : asT<int>("betRewardSendType", jsonRes['betRewardSendType'])!,
      betRewardExamineFlag: jsonRes['betRewardExamineFlag'] == null
          ? 0
          : asT<int>("betRewardExamineFlag", jsonRes['betRewardExamineFlag'])!,
      betRewardSendPosition: jsonRes['betRewardSendPosition'] == null
          ? 0
          : asT<int>(
              "betRewardSendPosition", jsonRes['betRewardSendPosition'])!,
      betRewardReceiveType: jsonRes['betRewardReceiveType'] == null
          ? 0
          : asT<int>("betRewardReceiveType", jsonRes['betRewardReceiveType'])!,
      masterPicture: jsonRes['masterPicture'] == null
          ? ''
          : asT<String>("masterPicture", jsonRes['masterPicture'])!,
      sharePicture: jsonRes['sharePicture'] == null
          ? ''
          : asT<String>("sharePicture", jsonRes['sharePicture'])!,
      inviteTaskInfo: jsonRes['inviteTaskInfo'] == null
          ? ''
          : asT<String>("inviteTaskInfo", jsonRes['inviteTaskInfo'])!,
      inviteTaskRule: jsonRes['inviteTaskRule'] == null
          ? ''
          : asT<String>("inviteTaskRule", jsonRes['inviteTaskRule'])!,
      depositTaskInfo: jsonRes['depositTaskInfo'] == null
          ? ''
          : asT<String>("depositTaskInfo", jsonRes['depositTaskInfo'])!,
      depositTaskRule: jsonRes['depositTaskRule'] == null
          ? ''
          : asT<String>("depositTaskRule", jsonRes['depositTaskRule'])!,
      betTaskInfo: jsonRes['betTaskInfo'] == null
          ? ''
          : asT<String>("betTaskInfo", jsonRes['betTaskInfo'])!,
      betTaskRule: jsonRes['betTaskRule'] == null
          ? ''
          : asT<String>("betTaskRule", jsonRes['betTaskRule'])!,
      operator: jsonRes['operator'] == null
          ? ''
          : asT<String>("operator", jsonRes['operator'])!,
      createdAt: jsonRes['createdAt'] == null
          ? ''
          : asT<String>("createdAt", jsonRes['createdAt'])!,
      updatedAt: jsonRes['updatedAt'] == null
          ? ''
          : asT<String>("updatedAt", jsonRes['updatedAt'])!,
      excelList: excelList == null ? [] : excelList,
      inviteTaskRuleList: inviteTaskRuleList == null ? [] : inviteTaskRuleList,
      inviteDepositRuleList:
          inviteDepositRuleList == null ? [] : inviteDepositRuleList,
    );
  }

  String id = '';
  String merchantId = '';
  int appId = 0;
  String name = '';
  int status = 0;
  String title = '';
  String pageRouteAddr = '';
  String deviceType = '';
  int inTypeUser = 0;
  int cycle = 0;
  String showStartTime = '';
  String showEndTime = '';
  String activityStartTime = '';
  String activityEndTime = '';
  String venue = '';
  String inviteTitle = '';
  int inviteRewardType = 0;
  int inviteDepositCountType = 0;
  int inviteDepositCountDay = 0;
  int inviteRewardCountType = 0;
  int inviteRewardAmountMax = 0;
  int inviteRewardSendType = 0;
  int inviteRewardAuditFlag = 0;
  int inviteRewardSendPosition = 0;
  int inviteRewardReceiveType = 0;
  int inviteRewardInviteesFlag = 0;
  String depositTitle = '';
  int depositSwitch = 0;
  int depositValidity = 0;
  int depositInviteesAmount = 0;
  int depositRewardType = 0;
  int depositIpRule = 0;
  int depositDeviceRule = 0;
  String betTitle = '';
  int betSwitch = 0;
  int betCountType = 0;
  double betRewardRate = 0.0;
  int betRewardDay = 0;
  int betRewardMin = 0;
  double betRewardMax = 0.0;
  int betRewardSendType = 0;
  int betRewardExamineFlag = 0;
  int betRewardSendPosition = 0;
  int betRewardReceiveType = 0;
  String masterPicture = '';
  String sharePicture = '';
  String inviteTaskInfo = '';
  String inviteTaskRule = '';
  String depositTaskInfo = '';
  String depositTaskRule = '';
  String betTaskInfo = '';
  String betTaskRule = '';
  String operator = '';
  String createdAt = '';
  String updatedAt = '';
  List<String> excelList;
  List<InviteTaskRuleList> inviteTaskRuleList;
  List<InviteDepositRuleList> inviteDepositRuleList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'merchantId': merchantId,
        'appId': appId,
        'name': name,
        'status': status,
        'title': title,
        'pageRouteAddr': pageRouteAddr,
        'deviceType': deviceType,
        'inTypeUser': inTypeUser,
        'cycle': cycle,
        'showStartTime': showStartTime,
        'showEndTime': showEndTime,
        'activityStartTime': activityStartTime,
        'activityEndTime': activityEndTime,
        'venue': venue,
        'inviteTitle': inviteTitle,
        'inviteRewardType': inviteRewardType,
        'inviteDepositCountType': inviteDepositCountType,
        'inviteDepositCountDay': inviteDepositCountDay,
        'inviteRewardCountType': inviteRewardCountType,
        'inviteRewardAmountMax': inviteRewardAmountMax,
        'inviteRewardSendType': inviteRewardSendType,
        'inviteRewardAuditFlag': inviteRewardAuditFlag,
        'inviteRewardSendPosition': inviteRewardSendPosition,
        'inviteRewardReceiveType': inviteRewardReceiveType,
        'inviteRewardInviteesFlag': inviteRewardInviteesFlag,
        'depositTitle': depositTitle,
        'depositSwitch': depositSwitch,
        'depositValidity': depositValidity,
        'depositInviteesAmount': depositInviteesAmount,
        'depositRewardType': depositRewardType,
        'depositIpRule': depositIpRule,
        'depositDeviceRule': depositDeviceRule,
        'betTitle': betTitle,
        'betSwitch': betSwitch,
        'betCountType': betCountType,
        'betRewardRate': betRewardRate,
        'betRewardDay': betRewardDay,
        'betRewardMin': betRewardMin,
        'betRewardMax': betRewardMax,
        'betRewardSendType': betRewardSendType,
        'betRewardExamineFlag': betRewardExamineFlag,
        'betRewardSendPosition': betRewardSendPosition,
        'betRewardReceiveType': betRewardReceiveType,
        'masterPicture': masterPicture,
        'sharePicture': sharePicture,
        'inviteTaskInfo': inviteTaskInfo,
        'inviteTaskRule': inviteTaskRule,
        'depositTaskInfo': depositTaskInfo,
        'depositTaskRule': depositTaskRule,
        'betTaskInfo': betTaskInfo,
        'betTaskRule': betTaskRule,
        'operator': operator,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'excelList': excelList,
        'inviteTaskRuleList': inviteTaskRuleList,
        'inviteDepositRuleList': inviteDepositRuleList,
      };
}

class InviteTaskRuleList {
  InviteTaskRuleList({
    required this.id,
    required this.activityId,
    required this.depositAmount,
    required this.inviteNum,
    required this.inviteRewardAmount,
    required this.inviteesRewardAmount,
    required this.validMultiple,
    required this.createdAt,
  });

  factory InviteTaskRuleList.fromJson(Map<String, dynamic> jsonRes) =>
      InviteTaskRuleList(
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        activityId: jsonRes['activityId'] == null
            ? 0
            : asT<int>("activityId", jsonRes['activityId'])!,
        depositAmount: jsonRes['depositAmount'] == null
            ? 0
            : asT<int>("depositAmount", jsonRes['depositAmount'])!,
        inviteNum: jsonRes['inviteNum'] == null
            ? 0
            : asT<int>("inviteNum", jsonRes['inviteNum'])!,
        inviteRewardAmount: jsonRes['inviteRewardAmount'] == null
            ? 0
            : asT<int>("inviteRewardAmount", jsonRes['inviteRewardAmount'])!,
        inviteesRewardAmount: jsonRes['inviteesRewardAmount'] == null
            ? 0
            : asT<int>(
                "inviteesRewardAmount", jsonRes['inviteesRewardAmount'])!,
        validMultiple: jsonRes['validMultiple'] == null
            ? 0
            : asT<int>("validMultiple", jsonRes['validMultiple'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
      );

  int id = 0;
  int activityId = 0;
  int depositAmount = 0;
  int inviteNum = 0;
  int inviteRewardAmount = 0;
  int inviteesRewardAmount = 0;
  int validMultiple = 0;
  String createdAt = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'activityId': activityId,
        'depositAmount': depositAmount,
        'inviteNum': inviteNum,
        'inviteRewardAmount': inviteRewardAmount,
        'inviteesRewardAmount': inviteesRewardAmount,
        'validMultiple': validMultiple,
        'createdAt': createdAt,
      };
}

class InviteDepositRuleList {
  InviteDepositRuleList({
    required this.id,
    required this.activityId,
    required this.depositRewardType,
    required this.depositVenueAmount,
    required this.validAmount,
    required this.validTopLimit,
    required this.validMultiple,
    required this.createdAt,
  });

  factory InviteDepositRuleList.fromJson(Map<String, dynamic> jsonRes) =>
      InviteDepositRuleList(
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        activityId: jsonRes['activityId'] == null
            ? 0
            : asT<int>("activityId", jsonRes['activityId'])!,
        depositRewardType: jsonRes['depositRewardType'] == null
            ? 0
            : asT<int>("depositRewardType", jsonRes['depositRewardType'])!,
        depositVenueAmount: jsonRes['depositVenueAmount'] == null
            ? 0.0
            : asT<double>("depositVenueAmount", jsonRes['depositVenueAmount'])!,
        validAmount: jsonRes['validAmount'] == null
            ? 0.0
            : asT<double>("validAmount", jsonRes['validAmount'])!,
        validTopLimit: jsonRes['validTopLimit'] == null
            ? 0.0
            : asT<double>("validTopLimit", jsonRes['validTopLimit'])!,
        validMultiple: jsonRes['validMultiple'] == null
            ? 0
            : asT<int>("validMultiple", jsonRes['validMultiple'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
      );

  int id = 0;
  int activityId = 0;
  int depositRewardType = 0;
  double depositVenueAmount = 0.0;
  double validAmount = 0.0;
  double validTopLimit = 0.0;
  int validMultiple = 0;
  String createdAt = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'activityId': activityId,
        'depositRewardType': depositRewardType,
        'depositVenueAmount': depositVenueAmount,
        'validAmount': validAmount,
        'validTopLimit': validTopLimit,
        'validMultiple': validMultiple,
        'createdAt': createdAt,
      };
}
