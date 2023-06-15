import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentMemberQueryMemberNetAmountDetailPostRespModel {
  ProxyMultiAgentMemberQueryMemberNetAmountDetailPostRespModel({
    required this.artificialPatchAmount,
    required this.betAmount,
    required this.discountAmount,
    required this.flowCorrection,
    required this.netAmount,
    required this.rebateAmount,
    required this.staticsDate,
    required this.totalNetAmount,
    required this.validBetAmount,
  });

  factory ProxyMultiAgentMemberQueryMemberNetAmountDetailPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyMultiAgentMemberQueryMemberNetAmountDetailPostRespModel(
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
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        rebateAmount: jsonRes['rebateAmount'] == null
            ? 0.0
            : asT<double>("rebateAmount", jsonRes['rebateAmount'])!,
        staticsDate: jsonRes['staticsDate'] == null
            ? 0
            : asT<int>("staticsDate", jsonRes['staticsDate'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
      );

  double artificialPatchAmount = 0.0;
  double betAmount = 0.0;
  double discountAmount = 0.0;
  double flowCorrection = 0.0;
  double netAmount = 0.0;
  double rebateAmount = 0.0;
  int staticsDate = 0;
  double totalNetAmount = 0.0;
  double validBetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'artificialPatchAmount': artificialPatchAmount,
        'betAmount': betAmount,
        'discountAmount': discountAmount,
        'flowCorrection': flowCorrection,
        'netAmount': netAmount,
        'rebateAmount': rebateAmount,
        'staticsDate': staticsDate,
        'totalNetAmount': totalNetAmount,
        'validBetAmount': validBetAmount,
      };
}
