import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentProxyQueryProxyNetAmountDetailPostRespModel {
  ProxyMultiAgentProxyQueryProxyNetAmountDetailPostRespModel({
    required this.artificialPatchAmount,
    required this.betAmount,
    required this.discountAmount,
    required this.flowCorrection,
    required this.lastMonthBalance,
    required this.netAmount,
    required this.proxyName,
    required this.proxyNet,
    required this.proxyRebatePoint,
    required this.rebateAmount,
    required this.rushNet,
    required this.staticsDate,
    required this.totalNetAmount,
    required this.validBetAmount,
    required this.venueFee,
  });

  factory ProxyMultiAgentProxyQueryProxyNetAmountDetailPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyMultiAgentProxyQueryProxyNetAmountDetailPostRespModel(
        artificialPatchAmount: jsonRes['artificialPatchAmount'] == null
            ? 0.0
            : asT<double>(
                "artificialPatchAmount", jsonRes['artificialPatchAmount'])!,
        betAmount: jsonRes['betAmount'] == null
            ? 0.0
            : asT<double>("betAmount", jsonRes['betAmount'])!,
        discountAmount: jsonRes['discountAmount'] == null
            ? 0.0
            : asT<double>("discountAmount", jsonRes['discountAmount'])!,
        flowCorrection: jsonRes['flowCorrection'] == null
            ? 0.0
            : asT<double>("flowCorrection", jsonRes['flowCorrection'])!,
        lastMonthBalance: jsonRes['lastMonthBalance'] == null
            ? 0.0
            : asT<double>("lastMonthBalance", jsonRes['lastMonthBalance'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        proxyName: jsonRes['proxyName'] == null
            ? ''
            : asT<String>("proxyName", jsonRes['proxyName'])!,
        proxyNet: jsonRes['proxyNet'] == null
            ? 0.0
            : asT<double>("proxyNet", jsonRes['proxyNet'])!,
        proxyRebatePoint: jsonRes['proxyRebatePoint'] == null
            ? 0.0
            : asT<double>("proxyRebatePoint", jsonRes['proxyRebatePoint'])!,
        rebateAmount: jsonRes['rebateAmount'] == null
            ? 0.0
            : asT<double>("rebateAmount", jsonRes['rebateAmount'])!,
        rushNet: jsonRes['rushNet'] == null
            ? 0.0
            : asT<double>("rushNet", jsonRes['rushNet'])!,
        staticsDate: jsonRes['staticsDate'] == null
            ? 0
            : asT<int>("staticsDate", jsonRes['staticsDate'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
        venueFee: jsonRes['venueFee'] == null
            ? 0.0
            : asT<double>("venueFee", jsonRes['venueFee'])!,
      );

  double artificialPatchAmount = 0.0;
  double betAmount = 0.0;
  double discountAmount = 0.0;
  double flowCorrection = 0.0;
  double lastMonthBalance = 0.0;
  double netAmount = 0.0;
  String proxyName = '';
  double proxyNet = 0.0;
  double proxyRebatePoint = 0.0;
  double rebateAmount = 0.0;
  double rushNet = 0.0;
  int staticsDate = 0;
  double totalNetAmount = 0.0;
  double validBetAmount = 0.0;
  double venueFee = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'artificialPatchAmount': artificialPatchAmount,
        'betAmount': betAmount,
        'discountAmount': discountAmount,
        'flowCorrection': flowCorrection,
        'lastMonthBalance': lastMonthBalance,
        'netAmount': netAmount,
        'proxyName': proxyName,
        'proxyNet': proxyNet,
        'proxyRebatePoint': proxyRebatePoint,
        'rebateAmount': rebateAmount,
        'rushNet': rushNet,
        'staticsDate': staticsDate,
        'totalNetAmount': totalNetAmount,
        'validBetAmount': validBetAmount,
        'venueFee': venueFee,
      };
}
