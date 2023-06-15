import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyCommissionCurrMonthCommissionBudgetPostRespModel {
  ProxyCommissionCurrMonthCommissionBudgetPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyCommissionCurrMonthCommissionBudgetPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyCommissionCurrMonthCommissionBudgetPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? ProxyCommissionCurrMonthCommissionBudgetPostRespModelSummary.fromJson({})
          : ProxyCommissionCurrMonthCommissionBudgetPostRespModelSummary.fromJson(
              asT<Map<String, dynamic>>("summary", jsonRes["summary"])!),
      totalPage: jsonRes['totalPage'] == null
          ? 0
          : asT<int>("totalPage", jsonRes['totalPage'])!,
      totalRecord: jsonRes['totalRecord'] == null
          ? 0
          : asT<int>("totalRecord", jsonRes['totalRecord'])!,
    );
  }

  int pageNum = 0;
  int pageSize = 0;
  List<ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord> record;
  ProxyCommissionCurrMonthCommissionBudgetPostRespModelSummary summary;
  int totalPage = 0;
  int totalRecord = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'record': record,
        'summary': summary,
        'totalPage': totalPage,
        'totalRecord': totalRecord,
      };
}

class ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord {
  ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord({
    required this.commissionAmount,
    required this.commissionRate,
    required this.commissionVipSerialnum,
    required this.contractId,
    required this.contractLevel,
    required this.proxyVipLevel,
    required this.proxyVipLevelName,
    required this.proxyAccount,
    required this.proxyId,
    required this.rewardAmount,
    required this.rewardLevel,
    required this.rewardRate,
    required this.rewardSerialnum,
    required this.statisticsEndTime,
    required this.statisticsRemainingDay,
    required this.statisticsStartTime,
    required this.totalAcctadjustAmount,
    required this.totalAdjustnetwinAmount,
    required this.totalChildCommissionAmount,
    required this.totalCommissionAmount,
    required this.totalDiscountAmount,
    required this.totalLastAmount,
    required this.contractRebate,
    required this.totalNetAmount,
    required this.totalNetwinAmount,
    required this.totalPersonCommissionAmount,
    required this.totalPlatformAmount,
    required this.totalProxyRebateAmount,
    required this.totalRebateAmount,
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

  factory ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyCommissionCurrMonthCommissionBudgetPostRespModelRecord(
        commissionAmount: jsonRes['commissionAmount'] == null
            ? 0.0
            : asT<double>("commissionAmount", jsonRes['commissionAmount'])!,
        commissionRate: jsonRes['commissionRate'] == null
            ? 0.0
            : asT<double>("commissionRate", jsonRes['commissionRate'])!,
        commissionVipSerialnum: jsonRes['commissionVipSerialnum'] == null
            ? 0
            : asT<int>(
                "commissionVipSerialnum", jsonRes['commissionVipSerialnum'])!,
        contractId: jsonRes['contractId'] == null
            ? ''
            : asT<String>("contractId", jsonRes['contractId'])!,
        contractLevel: jsonRes['contractLevel'] == null
            ? 0
            : asT<int>("contractLevel", jsonRes['contractLevel'])!,
        proxyVipLevel: jsonRes['proxyVipLevel'] == null
            ? 0
            : asT<int>("proxyVipLevel", jsonRes['proxyVipLevel'])!,
        proxyVipLevelName: jsonRes['proxyVipLevelName'] == null
            ? ''
            : asT<String>("proxyVipLevelName", jsonRes['proxyVipLevelName'])!,
        proxyAccount: jsonRes['proxyAccount'] == null
            ? ''
            : asT<String>("proxyAccount", jsonRes['proxyAccount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        rewardAmount: jsonRes['rewardAmount'] == null
            ? 0.0
            : asT<double>("rewardAmount", jsonRes['rewardAmount'])!,
        rewardLevel: jsonRes['rewardLevel'] == null
            ? 0
            : asT<int>("rewardLevel", jsonRes['rewardLevel'])!,
        rewardRate: jsonRes['rewardRate'] == null
            ? 0.0
            : asT<double>("rewardRate", jsonRes['rewardRate'])!,
        rewardSerialnum: jsonRes['rewardSerialnum'] == null
            ? 0
            : asT<int>("rewardSerialnum", jsonRes['rewardSerialnum'])!,
        statisticsEndTime: jsonRes['statisticsEndTime'] == null
            ? ''
            : asT<String>("statisticsEndTime", jsonRes['statisticsEndTime'])!,
        statisticsRemainingDay: jsonRes['statisticsRemainingDay'] == null
            ? 0
            : asT<int>(
                "statisticsRemainingDay", jsonRes['statisticsRemainingDay'])!,
        statisticsStartTime: jsonRes['statisticsStartTime'] == null
            ? ''
            : asT<String>(
                "statisticsStartTime", jsonRes['statisticsStartTime'])!,
        totalAcctadjustAmount: jsonRes['totalAcctadjustAmount'] == null
            ? 0.0
            : asT<double>(
                "totalAcctadjustAmount", jsonRes['totalAcctadjustAmount'])!,
        totalAdjustnetwinAmount: jsonRes['totalAdjustnetwinAmount'] == null
            ? 0.0
            : asT<double>(
                "totalAdjustnetwinAmount", jsonRes['totalAdjustnetwinAmount'])!,
        totalChildCommissionAmount:
            jsonRes['totalChildCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalChildCommissionAmount",
                    jsonRes['totalChildCommissionAmount'])!,
        totalCommissionAmount: jsonRes['totalCommissionAmount'] == null
            ? 0.0
            : asT<double>(
                "totalCommissionAmount", jsonRes['totalCommissionAmount'])!,
        totalDiscountAmount: jsonRes['totalDiscountAmount'] == null
            ? 0.0
            : asT<double>(
                "totalDiscountAmount", jsonRes['totalDiscountAmount'])!,
        totalLastAmount: jsonRes['totalLastAmount'] == null
            ? 0.0
            : asT<double>("totalLastAmount", jsonRes['totalLastAmount'])!,
        contractRebate: jsonRes['contractRebate'] == null
            ? 0
            : asT<int>("contractRebate", jsonRes['contractRebate'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
        totalNetwinAmount: jsonRes['totalNetwinAmount'] == null
            ? 0.0
            : asT<double>("totalNetwinAmount", jsonRes['totalNetwinAmount'])!,
        totalPersonCommissionAmount:
            jsonRes['totalPersonCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalPersonCommissionAmount",
                    jsonRes['totalPersonCommissionAmount'])!,
        totalPlatformAmount: jsonRes['totalPlatformAmount'] == null
            ? 0.0
            : asT<double>(
                "totalPlatformAmount", jsonRes['totalPlatformAmount'])!,
        totalProxyRebateAmount: jsonRes['totalProxyRebateAmount'] == null
            ? 0.0
            : asT<double>(
                "totalProxyRebateAmount", jsonRes['totalProxyRebateAmount'])!,
        totalRebateAmount: jsonRes['totalRebateAmount'] == null
            ? 0.0
            : asT<double>("totalRebateAmount", jsonRes['totalRebateAmount'])!,
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
  double commissionRate = 0.0;
  int commissionVipSerialnum = 0;
  String contractId = '';
  int contractLevel = 0;
  int proxyVipLevel = 0;
  String proxyVipLevelName = '';
  String proxyAccount = '';
  String proxyId = '';
  double rewardAmount = 0.0;
  int rewardLevel = 0;
  double rewardRate = 0.0;
  int rewardSerialnum = 0;
  String statisticsEndTime = '';
  int statisticsRemainingDay = 0;
  String statisticsStartTime = '';
  double totalAcctadjustAmount = 0.0;
  double totalAdjustnetwinAmount = 0.0;
  double totalChildCommissionAmount = 0.0;
  double totalCommissionAmount = 0.0;
  double totalDiscountAmount = 0.0;
  double totalLastAmount = 0.0;
  int contractRebate = 0;
  double totalNetAmount = 0.0;
  double totalNetwinAmount = 0.0;
  double totalPersonCommissionAmount = 0.0;
  double totalPlatformAmount = 0.0;
  double totalProxyRebateAmount = 0.0;
  double totalRebateAmount = 0.0;
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
        'commissionRate': commissionRate,
        'commissionVipSerialnum': commissionVipSerialnum,
        'contractId': contractId,
        'contractLevel': contractLevel,
        'proxyVipLevel': proxyVipLevel,
        'proxyVipLevelName': proxyVipLevelName,
        'proxyAccount': proxyAccount,
        'proxyId': proxyId,
        'rewardAmount': rewardAmount,
        'rewardLevel': rewardLevel,
        'rewardRate': rewardRate,
        'rewardSerialnum': rewardSerialnum,
        'statisticsEndTime': statisticsEndTime,
        'statisticsRemainingDay': statisticsRemainingDay,
        'statisticsStartTime': statisticsStartTime,
        'totalAcctadjustAmount': totalAcctadjustAmount,
        'totalAdjustnetwinAmount': totalAdjustnetwinAmount,
        'totalChildCommissionAmount': totalChildCommissionAmount,
        'totalCommissionAmount': totalCommissionAmount,
        'totalDiscountAmount': totalDiscountAmount,
        'totalLastAmount': totalLastAmount,
        'contractRebate': contractRebate,
        'totalNetAmount': totalNetAmount,
        'totalNetwinAmount': totalNetwinAmount,
        'totalPersonCommissionAmount': totalPersonCommissionAmount,
        'totalPlatformAmount': totalPlatformAmount,
        'totalProxyRebateAmount': totalProxyRebateAmount,
        'totalRebateAmount': totalRebateAmount,
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

class ProxyCommissionCurrMonthCommissionBudgetPostRespModelSummary {
  ProxyCommissionCurrMonthCommissionBudgetPostRespModelSummary({
    required this.commissionAmount,
    required this.commissionRate,
    required this.commissionVipSerialnum,
    required this.contractId,
    required this.contractLevel,
    required this.proxyVipLevel,
    required this.proxyVipLevelName,
    required this.proxyAccount,
    required this.proxyId,
    required this.rewardAmount,
    required this.rewardLevel,
    required this.rewardRate,
    required this.rewardSerialnum,
    required this.statisticsEndTime,
    required this.statisticsRemainingDay,
    required this.statisticsStartTime,
    required this.totalAcctadjustAmount,
    required this.totalAdjustnetwinAmount,
    required this.totalChildCommissionAmount,
    required this.totalCommissionAmount,
    required this.totalDiscountAmount,
    required this.totalLastAmount,
    required this.totalNetAmount,
    required this.totalNetwinAmount,
    required this.contractRebate,
    required this.totalPersonCommissionAmount,
    required this.totalPlatformAmount,
    required this.totalProxyRebateAmount,
    required this.totalRebateAmount,
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

  factory ProxyCommissionCurrMonthCommissionBudgetPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) => ProxyCommissionCurrMonthCommissionBudgetPostRespModelSummary(
        commissionAmount: jsonRes['commissionAmount'] == null
            ? 0.0
            : asT<double>("commissionAmount", jsonRes['commissionAmount'])!,
        commissionRate: jsonRes['commissionRate'] == null
            ? 0.0
            : asT<double>("commissionRate", jsonRes['commissionRate'])!,
        commissionVipSerialnum: jsonRes['commissionVipSerialnum'] == null
            ? 0
            : asT<int>(
                "commissionVipSerialnum", jsonRes['commissionVipSerialnum'])!,
        contractId: jsonRes['contractId'] == null
            ? ''
            : asT<String>("contractId", jsonRes['contractId'])!,
        contractLevel: jsonRes['contractLevel'] == null
            ? 0
            : asT<int>("contractLevel", jsonRes['contractLevel'])!,
        proxyVipLevel: jsonRes['proxyVipLevel'] == null
            ? 0
            : asT<int>("proxyVipLevel", jsonRes['proxyVipLevel'])!,
        proxyVipLevelName: jsonRes['proxyVipLevelName'] == null
            ? ''
            : asT<String>("proxyVipLevelName", jsonRes['proxyVipLevelName'])!,
        proxyAccount: jsonRes['proxyAccount'] == null
            ? ''
            : asT<String>("proxyAccount", jsonRes['proxyAccount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        rewardAmount: jsonRes['rewardAmount'] == null
            ? 0.0
            : asT<double>("rewardAmount", jsonRes['rewardAmount'])!,
        rewardLevel: jsonRes['rewardLevel'] == null
            ? 0
            : asT<int>("rewardLevel", jsonRes['rewardLevel'])!,
        rewardRate: jsonRes['rewardRate'] == null
            ? 0.0
            : asT<double>("rewardRate", jsonRes['rewardRate'])!,
        rewardSerialnum: jsonRes['rewardSerialnum'] == null
            ? 0
            : asT<int>("rewardSerialnum", jsonRes['rewardSerialnum'])!,
        statisticsEndTime: jsonRes['statisticsEndTime'] == null
            ? ''
            : asT<String>("statisticsEndTime", jsonRes['statisticsEndTime'])!,
        statisticsRemainingDay: jsonRes['statisticsRemainingDay'] == null
            ? 0
            : asT<int>(
                "statisticsRemainingDay", jsonRes['statisticsRemainingDay'])!,
        statisticsStartTime: jsonRes['statisticsStartTime'] == null
            ? ''
            : asT<String>(
                "statisticsStartTime", jsonRes['statisticsStartTime'])!,
        totalAcctadjustAmount: jsonRes['totalAcctadjustAmount'] == null
            ? 0.0
            : asT<double>(
                "totalAcctadjustAmount", jsonRes['totalAcctadjustAmount'])!,
        totalAdjustnetwinAmount: jsonRes['totalAdjustnetwinAmount'] == null
            ? 0.0
            : asT<double>(
                "totalAdjustnetwinAmount", jsonRes['totalAdjustnetwinAmount'])!,
        totalChildCommissionAmount:
            jsonRes['totalChildCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalChildCommissionAmount",
                    jsonRes['totalChildCommissionAmount'])!,
        totalCommissionAmount: jsonRes['totalCommissionAmount'] == null
            ? 0.0
            : asT<double>(
                "totalCommissionAmount", jsonRes['totalCommissionAmount'])!,
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
        totalNetwinAmount: jsonRes['totalNetwinAmount'] == null
            ? 0.0
            : asT<double>("totalNetwinAmount", jsonRes['totalNetwinAmount'])!,
        contractRebate: jsonRes['contractRebate'] == null
            ? 0
            : asT<int>("contractRebate", jsonRes['contractRebate'])!,
        totalPersonCommissionAmount:
            jsonRes['totalPersonCommissionAmount'] == null
                ? 0.0
                : asT<double>("totalPersonCommissionAmount",
                    jsonRes['totalPersonCommissionAmount'])!,
        totalPlatformAmount: jsonRes['totalPlatformAmount'] == null
            ? 0.0
            : asT<double>(
                "totalPlatformAmount", jsonRes['totalPlatformAmount'])!,
        totalProxyRebateAmount: jsonRes['totalProxyRebateAmount'] == null
            ? 0.0
            : asT<double>(
                "totalProxyRebateAmount", jsonRes['totalProxyRebateAmount'])!,
        totalRebateAmount: jsonRes['totalRebateAmount'] == null
            ? 0.0
            : asT<double>("totalRebateAmount", jsonRes['totalRebateAmount'])!,
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
  double commissionRate = 0.0;
  int commissionVipSerialnum = 0;
  String contractId = '';
  int contractLevel = 0;
  int proxyVipLevel = 0;
  String proxyVipLevelName = '';
  String proxyAccount = '';
  String proxyId = '';
  double rewardAmount = 0.0;
  int rewardLevel = 0;
  double rewardRate = 0.0;
  int rewardSerialnum = 0;
  String statisticsEndTime = '';
  int statisticsRemainingDay = 0;
  String statisticsStartTime = '';
  double totalAcctadjustAmount = 0.0;
  double totalAdjustnetwinAmount = 0.0;
  double totalChildCommissionAmount = 0.0;
  double totalCommissionAmount = 0.0;
  double totalDiscountAmount = 0.0;
  double totalLastAmount = 0.0;
  double totalNetAmount = 0.0;
  double totalNetwinAmount = 0.0;
  int contractRebate = 0;
  double totalPersonCommissionAmount = 0.0;
  double totalPlatformAmount = 0.0;
  double totalProxyRebateAmount = 0.0;
  double totalRebateAmount = 0.0;
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
        'commissionRate': commissionRate,
        'commissionVipSerialnum': commissionVipSerialnum,
        'contractId': contractId,
        'contractLevel': contractLevel,
        'proxyVipLevel': proxyVipLevel,
        'proxyVipLevelName': proxyVipLevelName,
        'proxyAccount': proxyAccount,
        'proxyId': proxyId,
        'rewardAmount': rewardAmount,
        'rewardLevel': rewardLevel,
        'rewardRate': rewardRate,
        'rewardSerialnum': rewardSerialnum,
        'statisticsEndTime': statisticsEndTime,
        'statisticsRemainingDay': statisticsRemainingDay,
        'statisticsStartTime': statisticsStartTime,
        'totalAcctadjustAmount': totalAcctadjustAmount,
        'totalAdjustnetwinAmount': totalAdjustnetwinAmount,
        'totalChildCommissionAmount': totalChildCommissionAmount,
        'totalCommissionAmount': totalCommissionAmount,
        'totalDiscountAmount': totalDiscountAmount,
        'totalLastAmount': totalLastAmount,
        'totalNetAmount': totalNetAmount,
        'totalNetwinAmount': totalNetwinAmount,
        'contractRebate': contractRebate,
        'totalPersonCommissionAmount': totalPersonCommissionAmount,
        'totalPlatformAmount': totalPlatformAmount,
        'totalProxyRebateAmount': totalProxyRebateAmount,
        'totalRebateAmount': totalRebateAmount,
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
