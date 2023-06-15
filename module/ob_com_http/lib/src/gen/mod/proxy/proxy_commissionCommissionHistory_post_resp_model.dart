import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyCommissionCommissionHistoryPostRespModel {
  ProxyCommissionCommissionHistoryPostRespModel({
    required this.record,
    required this.pageNum,
    required this.totalPage,
    required this.totalRecord,
    required this.summary,
    required this.pageSize,
  });

  factory ProxyCommissionCommissionHistoryPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyCommissionCommissionHistoryPostRespModelecord>? record = jsonRes['record'] is List ? <ProxyCommissionCommissionHistoryPostRespModelecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyCommissionCommissionHistoryPostRespModelecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyCommissionCommissionHistoryPostRespModel(
      record: record == null ? [] : record,
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      totalPage: jsonRes['totalPage'] == null
          ? 0
          : asT<int>("totalPage", jsonRes['totalPage'])!,
      totalRecord: jsonRes['totalRecord'] == null
          ? 0
          : asT<int>("totalRecord", jsonRes['totalRecord'])!,
      summary: jsonRes["summary"] == null
          ? ProxyCommissionCommissionHistoryPostRespModelSummary.fromJson({})
          : ProxyCommissionCommissionHistoryPostRespModelSummary.fromJson(
              asT<Map<String, dynamic>>("summary", jsonRes["summary"])!),
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
    );
  }

  List<ProxyCommissionCommissionHistoryPostRespModelecord> record;
  int pageNum = 0;
  int totalPage = 0;
  int totalRecord = 0;
  ProxyCommissionCommissionHistoryPostRespModelSummary summary;
  int pageSize = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'record': record,
        'pageNum': pageNum,
        'totalPage': totalPage,
        'totalRecord': totalRecord,
        'summary': summary,
        'pageSize': pageSize,
      };
}

class ProxyCommissionCommissionHistoryPostRespModelecord {
  ProxyCommissionCommissionHistoryPostRespModelecord({
    required this.commissionAmount,
    required this.commissionOnlyAmount,
    required this.commissionRate,
    required this.contractId,
    required this.contractLevel,
    required this.maxLevels,
    required this.orderStatus,
    required this.contractRebate,
    required this.notPayAmount,
    required this.payoutStatus,
    required this.proxyAccount,
    required this.proxyId,
    required this.proxyLevelId,
    required this.proxyVipLevel,
    required this.proxyVipLevelName,
    required this.proxyVipLevelRate,
    required this.reportYm,
    required this.rewardAmount,
    required this.totalAdjustAmount,
    required this.totalChildCommissionAmount,
    required this.totalDiscountAmount,
    required this.totalLastAmount,
    required this.totalNetAmount,
    required this.totalPersonCommissionAmount,
    required this.totalPlatformAmount,
    required this.totalPureAmount,
    required this.totalRebateAmount,
    required this.totalRushAmount,
    required this.totalProxyRebateAmount,
    required this.monthActiveNum,
    required this.monthEffecactiveNumNew,
    required this.adjustCommissionAmount,
    required this.netAmountDisplayFlag,
    required this.validBetDisplayFlag,
    required this.activeUsersDisplayFlag,
    required this.effectActiveUsersDisplayFlag,
    required this.monthAddActiveCountDisplayFlag,
    required this.totalBetAmount,
    required this.totalValidBetAmount,
    required this.monthEffecactiveNum,
  });

  factory ProxyCommissionCommissionHistoryPostRespModelecord.fromJson(Map<String, dynamic> jsonRes) => ProxyCommissionCommissionHistoryPostRespModelecord(
        commissionAmount: jsonRes['commissionAmount'] == null
            ? 0.0
            : asT<double>("commissionAmount", jsonRes['commissionAmount'])!,
        commissionOnlyAmount: jsonRes['commissionOnlyAmount'] == null
            ? 0.0
            : asT<double>(
                "commissionOnlyAmount", jsonRes['commissionOnlyAmount'])!,
        commissionRate: jsonRes['commissionRate'] == null
            ? 0.0
            : asT<double>("commissionRate", jsonRes['commissionRate'])!,
        contractId: jsonRes['contractId'] == null
            ? ''
            : asT<String>("contractId", jsonRes['contractId'])!,
        contractLevel: jsonRes['contractLevel'] == null
            ? 0
            : asT<int>("contractLevel", jsonRes['contractLevel'])!,
        maxLevels: jsonRes['maxLevels'] == null
            ? 0
            : asT<int>("maxLevels", jsonRes['maxLevels'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        contractRebate: jsonRes['contractRebate'] == null
            ? 0
            : asT<int>("contractRebate", jsonRes['contractRebate'])!,
        notPayAmount: jsonRes['notPayAmount'] == null
            ? 0.0
            : asT<double>("notPayAmount", jsonRes['notPayAmount'])!,
        payoutStatus: jsonRes['payoutStatus'] == null
            ? 0
            : asT<int>("payoutStatus", jsonRes['payoutStatus'])!,
        proxyAccount: jsonRes['proxyAccount'] == null
            ? ''
            : asT<String>("proxyAccount", jsonRes['proxyAccount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        proxyLevelId: jsonRes['proxyLevelId'] == null
            ? 0
            : asT<int>("proxyLevelId", jsonRes['proxyLevelId'])!,
        proxyVipLevel: jsonRes['proxyVipLevel'] == null
            ? 0
            : asT<int>("proxyVipLevel", jsonRes['proxyVipLevel'])!,
        proxyVipLevelName: jsonRes['proxyVipLevelName'] == null
            ? ''
            : asT<String>("proxyVipLevelName", jsonRes['proxyVipLevelName'])!,
        proxyVipLevelRate: jsonRes['proxyVipLevelRate'] == null
            ? 0.0
            : asT<double>("proxyVipLevelRate", jsonRes['proxyVipLevelRate'])!,
        reportYm: jsonRes['reportYm'] == null
            ? 0
            : asT<int>("reportYm", jsonRes['reportYm'])!,
        rewardAmount: jsonRes['rewardAmount'] == null
            ? 0.0
            : asT<double>("rewardAmount", jsonRes['rewardAmount'])!,
        totalAdjustAmount: jsonRes['totalAdjustAmount'] == null
            ? 0.0
            : asT<double>("totalAdjustAmount", jsonRes['totalAdjustAmount'])!,
        totalChildCommissionAmount:
            jsonRes['totalChildCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalChildCommissionAmount",
                    jsonRes['totalChildCommissionAmount'])!,
        totalDiscountAmount: jsonRes['totalDiscountAmount'] == null
            ? 0.0
            : asT<double>(
                "totalDiscountAmount", jsonRes['totalDiscountAmount'])!,
        totalLastAmount: jsonRes['totalLastAmount'] == null
            ? 0.0
            : asT<double>("totalLastAmount", jsonRes['totalLastAmount'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
        totalPersonCommissionAmount:
            jsonRes['totalPersonCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalPersonCommissionAmount",
                    jsonRes['totalPersonCommissionAmount'])!,
        totalPlatformAmount: jsonRes['totalPlatformAmount'] == null
            ? 0.0
            : asT<double>(
                "totalPlatformAmount", jsonRes['totalPlatformAmount'])!,
        totalPureAmount: jsonRes['totalPureAmount'] == null
            ? 0.0
            : asT<double>("totalPureAmount", jsonRes['totalPureAmount'])!,
        totalRebateAmount: jsonRes['totalRebateAmount'] == null
            ? 0.0
            : asT<double>("totalRebateAmount", jsonRes['totalRebateAmount'])!,
        totalRushAmount: jsonRes['totalRushAmount'] == null
            ? 0.0
            : asT<double>("totalRushAmount", jsonRes['totalRushAmount'])!,
        totalProxyRebateAmount: jsonRes['totalProxyRebateAmount'] == null
            ? 0.0
            : asT<double>(
                "totalProxyRebateAmount", jsonRes['totalProxyRebateAmount'])!,
        monthActiveNum: jsonRes['monthActiveNum'] == null
            ? 0
            : asT<int>("monthActiveNum", jsonRes['monthActiveNum'])!,
        monthEffecactiveNumNew: jsonRes['monthEffecactiveNumNew'] == null
            ? 0
            : asT<int>(
                "monthEffecactiveNumNew", jsonRes['monthEffecactiveNumNew'])!,
        adjustCommissionAmount: jsonRes['adjustCommissionAmount'] == null
            ? 0.0
            : asT<double>(
                "adjustCommissionAmount", jsonRes['adjustCommissionAmount'])!,
        netAmountDisplayFlag: jsonRes['netAmountDisplayFlag'] == null
            ? 0
            : asT<int>(
                "netAmountDisplayFlag", jsonRes['netAmountDisplayFlag'])!,
        validBetDisplayFlag: jsonRes['validBetDisplayFlag'] == null
            ? 0
            : asT<int>("validBetDisplayFlag", jsonRes['validBetDisplayFlag'])!,
        activeUsersDisplayFlag: jsonRes['activeUsersDisplayFlag'] == null
            ? 0
            : asT<int>(
                "activeUsersDisplayFlag", jsonRes['activeUsersDisplayFlag'])!,
        effectActiveUsersDisplayFlag:
            jsonRes['effectActiveUsersDisplayFlag'] == null
                ? 0
                : asT<int>("effectActiveUsersDisplayFlag",
                    jsonRes['effectActiveUsersDisplayFlag'])!,
        monthAddActiveCountDisplayFlag:
            jsonRes['monthAddActiveCountDisplayFlag'] == null
                ? 0
                : asT<int>("monthAddActiveCountDisplayFlag",
                    jsonRes['monthAddActiveCountDisplayFlag'])!,
        totalBetAmount: jsonRes['totalBetAmount'] == null
            ? 0.0
            : asT<double>("totalBetAmount", jsonRes['totalBetAmount'])!,
        totalValidBetAmount: jsonRes['totalValidBetAmount'] == null
            ? 0.0
            : asT<double>(
                "totalValidBetAmount", jsonRes['totalValidBetAmount'])!,
        monthEffecactiveNum: jsonRes['monthEffecactiveNum'] == null
            ? 0
            : asT<int>("monthEffecactiveNum", jsonRes['monthEffecactiveNum'])!,
      );

  double commissionAmount = 0.0;
  double commissionOnlyAmount = 0.0;
  double commissionRate = 0.0;
  String contractId = '';
  int contractLevel = 0;
  int maxLevels = 0;
  int orderStatus = 0;
  int contractRebate = 0;
  double notPayAmount = 0.0;
  int payoutStatus = 0;
  String proxyAccount = '';
  String proxyId = '';
  int proxyLevelId = 0;
  int proxyVipLevel = 0;
  String proxyVipLevelName = '';
  double proxyVipLevelRate = 0.0;
  int reportYm = 0;
  double rewardAmount = 0.0;
  double totalAdjustAmount = 0.0;
  double totalChildCommissionAmount = 0.0;
  double totalDiscountAmount = 0.0;
  double totalLastAmount = 0.0;
  double totalNetAmount = 0.0;
  double totalPersonCommissionAmount = 0.0;
  double totalPlatformAmount = 0.0;
  double totalPureAmount = 0.0;
  double totalRebateAmount = 0.0;
  double totalRushAmount = 0.0;
  double totalProxyRebateAmount = 0.0;
  int monthActiveNum = 0;
  int monthEffecactiveNumNew = 0;
  double adjustCommissionAmount = 0.0;
  int netAmountDisplayFlag = 0;
  int validBetDisplayFlag = 0;
  int activeUsersDisplayFlag = 0;
  int effectActiveUsersDisplayFlag = 0;
  int monthAddActiveCountDisplayFlag = 0;
  double totalBetAmount = 0.0;
  double totalValidBetAmount = 0.0;
  int monthEffecactiveNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'commissionAmount': commissionAmount,
        'commissionOnlyAmount': commissionOnlyAmount,
        'commissionRate': commissionRate,
        'contractId': contractId,
        'contractLevel': contractLevel,
        'maxLevels': maxLevels,
        'orderStatus': orderStatus,
        'contractRebate': contractRebate,
        'notPayAmount': notPayAmount,
        'payoutStatus': payoutStatus,
        'proxyAccount': proxyAccount,
        'proxyId': proxyId,
        'proxyLevelId': proxyLevelId,
        'proxyVipLevel': proxyVipLevel,
        'proxyVipLevelName': proxyVipLevelName,
        'proxyVipLevelRate': proxyVipLevelRate,
        'reportYm': reportYm,
        'rewardAmount': rewardAmount,
        'totalAdjustAmount': totalAdjustAmount,
        'totalChildCommissionAmount': totalChildCommissionAmount,
        'totalDiscountAmount': totalDiscountAmount,
        'totalLastAmount': totalLastAmount,
        'totalNetAmount': totalNetAmount,
        'totalPersonCommissionAmount': totalPersonCommissionAmount,
        'totalPlatformAmount': totalPlatformAmount,
        'totalPureAmount': totalPureAmount,
        'totalRebateAmount': totalRebateAmount,
        'totalRushAmount': totalRushAmount,
        'totalProxyRebateAmount': totalProxyRebateAmount,
        'monthActiveNum': monthActiveNum,
        'monthEffecactiveNumNew': monthEffecactiveNumNew,
        'adjustCommissionAmount': adjustCommissionAmount,
        'netAmountDisplayFlag': netAmountDisplayFlag,
        'validBetDisplayFlag': validBetDisplayFlag,
        'activeUsersDisplayFlag': activeUsersDisplayFlag,
        'effectActiveUsersDisplayFlag': effectActiveUsersDisplayFlag,
        'monthAddActiveCountDisplayFlag': monthAddActiveCountDisplayFlag,
        'totalBetAmount': totalBetAmount,
        'totalValidBetAmount': totalValidBetAmount,
        'monthEffecactiveNum': monthEffecactiveNum,
      };
}

class ProxyCommissionCommissionHistoryPostRespModelSummary {
  ProxyCommissionCommissionHistoryPostRespModelSummary({
    required this.commissionAmount,
    required this.commissionOnlyAmount,
    required this.commissionRate,
    required this.contractId,
    required this.contractLevel,
    required this.maxLevels,
    required this.orderStatus,
    required this.contractRebate,
    required this.payoutStatus,
    required this.proxyAccount,
    required this.proxyId,
    required this.proxyLevelId,
    required this.proxyVipLevel,
    required this.proxyVipLevelName,
    required this.proxyVipLevelRate,
    required this.reportYm,
    required this.rewardAmount,
    required this.totalAdjustAmount,
    required this.totalChildCommissionAmount,
    required this.totalDiscountAmount,
    required this.totalLastAmount,
    required this.totalNetAmount,
    required this.totalPersonCommissionAmount,
    required this.totalPlatformAmount,
    required this.totalPureAmount,
    required this.totalRebateAmount,
    required this.totalRushAmount,
    required this.totalProxyRebateAmount,
    required this.monthActiveNum,
    required this.monthEffecactiveNumNew,
    required this.adjustCommissionAmount,
    required this.netAmountDisplayFlag,
    required this.validBetDisplayFlag,
    required this.activeUsersDisplayFlag,
    required this.effectActiveUsersDisplayFlag,
    required this.monthAddActiveCountDisplayFlag,
    required this.totalBetAmount,
    required this.totalValidBetAmount,
    required this.monthEffecactiveNum,
  });

  factory ProxyCommissionCommissionHistoryPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) => ProxyCommissionCommissionHistoryPostRespModelSummary(
        commissionAmount: jsonRes['commissionAmount'] == null
            ? 0.0
            : asT<double>("commissionAmount", jsonRes['commissionAmount'])!,
        commissionOnlyAmount: jsonRes['commissionOnlyAmount'] == null
            ? 0.0
            : asT<double>(
                "commissionOnlyAmount", jsonRes['commissionOnlyAmount'])!,
        commissionRate: jsonRes['commissionRate'] == null
            ? 0.0
            : asT<double>("commissionRate", jsonRes['commissionRate'])!,
        contractId: jsonRes['contractId'] == null
            ? ''
            : asT<String>("contractId", jsonRes['contractId'])!,
        contractLevel: jsonRes['contractLevel'] == null
            ? 0
            : asT<int>("contractLevel", jsonRes['contractLevel'])!,
        maxLevels: jsonRes['maxLevels'] == null
            ? 0
            : asT<int>("maxLevels", jsonRes['maxLevels'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        contractRebate: jsonRes['contractRebate'] == null
            ? 0
            : asT<int>("contractRebate", jsonRes['contractRebate'])!,
        payoutStatus: jsonRes['payoutStatus'] == null
            ? 0
            : asT<int>("payoutStatus", jsonRes['payoutStatus'])!,
        proxyAccount: jsonRes['proxyAccount'] == null
            ? ''
            : asT<String>("proxyAccount", jsonRes['proxyAccount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        proxyLevelId: jsonRes['proxyLevelId'] == null
            ? 0
            : asT<int>("proxyLevelId", jsonRes['proxyLevelId'])!,
        proxyVipLevel: jsonRes['proxyVipLevel'] == null
            ? 0
            : asT<int>("proxyVipLevel", jsonRes['proxyVipLevel'])!,
        proxyVipLevelName: jsonRes['proxyVipLevelName'] == null
            ? ''
            : asT<String>("proxyVipLevelName", jsonRes['proxyVipLevelName'])!,
        proxyVipLevelRate: jsonRes['proxyVipLevelRate'] == null
            ? 0.0
            : asT<double>("proxyVipLevelRate", jsonRes['proxyVipLevelRate'])!,
        reportYm: jsonRes['reportYm'] == null
            ? 0
            : asT<int>("reportYm", jsonRes['reportYm'])!,
        rewardAmount: jsonRes['rewardAmount'] == null
            ? 0.0
            : asT<double>("rewardAmount", jsonRes['rewardAmount'])!,
        totalAdjustAmount: jsonRes['totalAdjustAmount'] == null
            ? 0.0
            : asT<double>("totalAdjustAmount", jsonRes['totalAdjustAmount'])!,
        totalChildCommissionAmount:
            jsonRes['totalChildCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalChildCommissionAmount",
                    jsonRes['totalChildCommissionAmount'])!,
        totalDiscountAmount: jsonRes['totalDiscountAmount'] == null
            ? 0.0
            : asT<double>(
                "totalDiscountAmount", jsonRes['totalDiscountAmount'])!,
        totalLastAmount: jsonRes['totalLastAmount'] == null
            ? 0.0
            : asT<double>("totalLastAmount", jsonRes['totalLastAmount'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
        totalPersonCommissionAmount:
            jsonRes['totalPersonCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalPersonCommissionAmount",
                    jsonRes['totalPersonCommissionAmount'])!,
        totalPlatformAmount: jsonRes['totalPlatformAmount'] == null
            ? 0.0
            : asT<double>(
                "totalPlatformAmount", jsonRes['totalPlatformAmount'])!,
        totalPureAmount: jsonRes['totalPureAmount'] == null
            ? 0.0
            : asT<double>("totalPureAmount", jsonRes['totalPureAmount'])!,
        totalRebateAmount: jsonRes['totalRebateAmount'] == null
            ? 0.0
            : asT<double>("totalRebateAmount", jsonRes['totalRebateAmount'])!,
        totalRushAmount: jsonRes['totalRushAmount'] == null
            ? 0.0
            : asT<double>("totalRushAmount", jsonRes['totalRushAmount'])!,
        totalProxyRebateAmount: jsonRes['totalProxyRebateAmount'] == null
            ? 0.0
            : asT<double>(
                "totalProxyRebateAmount", jsonRes['totalProxyRebateAmount'])!,
        monthActiveNum: jsonRes['monthActiveNum'] == null
            ? 0
            : asT<int>("monthActiveNum", jsonRes['monthActiveNum'])!,
        monthEffecactiveNumNew: jsonRes['monthEffecactiveNumNew'] == null
            ? 0
            : asT<int>(
                "monthEffecactiveNumNew", jsonRes['monthEffecactiveNumNew'])!,
        adjustCommissionAmount: jsonRes['adjustCommissionAmount'] == null
            ? 0
            : asT<double>(
                "adjustCommissionAmount", jsonRes['adjustCommissionAmount'])!,
        netAmountDisplayFlag: jsonRes['netAmountDisplayFlag'] == null
            ? 0
            : asT<int>(
                "netAmountDisplayFlag", jsonRes['netAmountDisplayFlag'])!,
        validBetDisplayFlag: jsonRes['validBetDisplayFlag'] == null
            ? 0
            : asT<int>("validBetDisplayFlag", jsonRes['validBetDisplayFlag'])!,
        activeUsersDisplayFlag: jsonRes['activeUsersDisplayFlag'] == null
            ? 0
            : asT<int>(
                "activeUsersDisplayFlag", jsonRes['activeUsersDisplayFlag'])!,
        effectActiveUsersDisplayFlag:
            jsonRes['effectActiveUsersDisplayFlag'] == null
                ? 0
                : asT<int>("effectActiveUsersDisplayFlag",
                    jsonRes['effectActiveUsersDisplayFlag'])!,
        monthAddActiveCountDisplayFlag:
            jsonRes['monthAddActiveCountDisplayFlag'] == null
                ? 0
                : asT<int>("monthAddActiveCountDisplayFlag",
                    jsonRes['monthAddActiveCountDisplayFlag'])!,
        totalBetAmount: jsonRes['totalBetAmount'] == null
            ? 0.0
            : asT<double>("totalBetAmount", jsonRes['totalBetAmount'])!,
        totalValidBetAmount: jsonRes['totalValidBetAmount'] == null
            ? 0.0
            : asT<double>(
                "totalValidBetAmount", jsonRes['totalValidBetAmount'])!,
        monthEffecactiveNum: jsonRes['monthEffecactiveNum'] == null
            ? 0
            : asT<int>("monthEffecactiveNum", jsonRes['monthEffecactiveNum'])!,
      );

  double commissionAmount = 0.0;
  double commissionOnlyAmount = 0.0;
  double commissionRate = 0.0;
  String contractId = '';
  int contractLevel = 0;
  int maxLevels = 0;
  int orderStatus = 0;
  int contractRebate = 0;
  int payoutStatus = 0;
  String proxyAccount = '';
  String proxyId = '';
  int proxyLevelId = 0;
  int proxyVipLevel = 0;
  String proxyVipLevelName = '';
  double proxyVipLevelRate = 0.0;
  int reportYm = 0;
  double rewardAmount = 0.0;
  double totalAdjustAmount = 0.0;
  double totalChildCommissionAmount = 0.0;
  double totalDiscountAmount = 0.0;
  double totalLastAmount = 0.0;
  double totalNetAmount = 0.0;
  double totalPersonCommissionAmount = 0.0;
  double totalPlatformAmount = 0.0;
  double totalPureAmount = 0.0;
  double totalRebateAmount = 0.0;
  double totalRushAmount = 0.0;
  double totalProxyRebateAmount = 0.0;
  int monthActiveNum = 0;
  int monthEffecactiveNumNew = 0;
  double adjustCommissionAmount = 0.0;
  int netAmountDisplayFlag = 0;
  int validBetDisplayFlag = 0;
  int activeUsersDisplayFlag = 0;
  int effectActiveUsersDisplayFlag = 0;
  int monthAddActiveCountDisplayFlag = 0;
  double totalBetAmount = 0.0;
  double totalValidBetAmount = 0.0;
  int monthEffecactiveNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'commissionAmount': commissionAmount,
        'commissionOnlyAmount': commissionOnlyAmount,
        'commissionRate': commissionRate,
        'contractId': contractId,
        'contractLevel': contractLevel,
        'maxLevels': maxLevels,
        'orderStatus': orderStatus,
        'contractRebate': contractRebate,
        'payoutStatus': payoutStatus,
        'proxyAccount': proxyAccount,
        'proxyId': proxyId,
        'proxyLevelId': proxyLevelId,
        'proxyVipLevel': proxyVipLevel,
        'proxyVipLevelName': proxyVipLevelName,
        'proxyVipLevelRate': proxyVipLevelRate,
        'reportYm': reportYm,
        'rewardAmount': rewardAmount,
        'totalAdjustAmount': totalAdjustAmount,
        'totalChildCommissionAmount': totalChildCommissionAmount,
        'totalDiscountAmount': totalDiscountAmount,
        'totalLastAmount': totalLastAmount,
        'totalNetAmount': totalNetAmount,
        'totalPersonCommissionAmount': totalPersonCommissionAmount,
        'totalPlatformAmount': totalPlatformAmount,
        'totalPureAmount': totalPureAmount,
        'totalRebateAmount': totalRebateAmount,
        'totalRushAmount': totalRushAmount,
        'totalProxyRebateAmount': totalProxyRebateAmount,
        'monthActiveNum': monthActiveNum,
        'monthEffecactiveNumNew': monthEffecactiveNumNew,
        'adjustCommissionAmount': adjustCommissionAmount,
        'netAmountDisplayFlag': netAmountDisplayFlag,
        'validBetDisplayFlag': validBetDisplayFlag,
        'activeUsersDisplayFlag': activeUsersDisplayFlag,
        'effectActiveUsersDisplayFlag': effectActiveUsersDisplayFlag,
        'monthAddActiveCountDisplayFlag': monthAddActiveCountDisplayFlag,
        'totalBetAmount': totalBetAmount,
        'totalValidBetAmount': totalValidBetAmount,
        'monthEffecactiveNum': monthEffecactiveNum,
      };
}
