import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2MainTransferOutDataPostRespModel {
  ProxySystem2MainTransferOutDataPostRespModel({
    required this.amountUsedRate,
    required this.bankerOrderWalletAmount,
    required this.bankerOrderWalletAvailableAmount,
    required this.bankerOrderWalletLockAmount,
    required this.modelFlag,
    required this.requiredUsedAmount,
    required this.unFinishAmount,
    required this.unSettledOrderCount,
    required this.completeAmount,
    required this.userFlag,
  });

  factory ProxySystem2MainTransferOutDataPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2MainTransferOutDataPostRespModel(
        amountUsedRate: jsonRes['amountUsedRate'] == null
            ? 0.0
            : asT<double>("amountUsedRate", jsonRes['amountUsedRate'])!,
        bankerOrderWalletAmount: jsonRes['bankerOrderWalletAmount'] == null
            ? 0.0
            : asT<double>(
                "bankerOrderWalletAmount", jsonRes['bankerOrderWalletAmount'])!,
        bankerOrderWalletAvailableAmount:
            jsonRes['bankerOrderWalletAvailableAmount'] == null
                ? 0.0
                : asT<double>("bankerOrderWalletAvailableAmount",
                    jsonRes['bankerOrderWalletAvailableAmount'])!,
        bankerOrderWalletLockAmount:
            jsonRes['bankerOrderWalletLockAmount'] == null
                ? 0.0
                : asT<double>("bankerOrderWalletLockAmount",
                    jsonRes['bankerOrderWalletLockAmount'])!,
        modelFlag: jsonRes['modelFlag'] == null
            ? 0
            : asT<int>("modelFlag", jsonRes['modelFlag'])!,
        requiredUsedAmount: jsonRes['requiredUsedAmount'] == null
            ? 0.0
            : asT<double>("requiredUsedAmount", jsonRes['requiredUsedAmount'])!,
        unFinishAmount: jsonRes['unFinishAmount'] == null
            ? 0.0
            : asT<double>("unFinishAmount", jsonRes['unFinishAmount'])!,
        unSettledOrderCount: jsonRes['unSettledOrderCount'] == null
            ? 0.0
            : asT<double>(
                "unSettledOrderCount", jsonRes['unSettledOrderCount'])!,
        completeAmount: jsonRes['completeAmount'] == null
            ? 0.0
            : asT<double>(
            "completeAmount", jsonRes['completeAmount'])!,
        userFlag: jsonRes['userFlag'] == null
            ? false
            : asT<bool>(
            "userFlag", jsonRes['userFlag'])!,
      );




  double amountUsedRate = 0.0;
  double bankerOrderWalletAmount = 0.0;
  double bankerOrderWalletAvailableAmount = 0.0;
  double bankerOrderWalletLockAmount = 0.0;
  int modelFlag = 0;
  double requiredUsedAmount = 0.0;
  double unFinishAmount = 0.0;
  double unSettledOrderCount = 0.0;
  double completeAmount = 0.0;
  bool userFlag = false;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amountUsedRate': amountUsedRate,
        'bankerOrderWalletAmount': bankerOrderWalletAmount,
        'bankerOrderWalletAvailableAmount': bankerOrderWalletAvailableAmount,
        'bankerOrderWalletLockAmount': bankerOrderWalletLockAmount,
        'modelFlag': modelFlag,
        'requiredUsedAmount': requiredUsedAmount,
        'unFinishAmount': unFinishAmount,
        'unSettledOrderCount': unSettledOrderCount,
      };
}
