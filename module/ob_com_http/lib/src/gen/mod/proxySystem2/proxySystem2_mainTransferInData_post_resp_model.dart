import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2MainTransferInDataPostRespModel {
  ProxySystem2MainTransferInDataPostRespModel({
    required this.availableWalletAmount,
    required this.bankerOrderWalletAmount,
    required this.bankerOrderWalletAvailableAmount,
    required this.bankerOrderWalletLockAmount,
    required this.quotaChangeMinAmount,
    required this.commissionChangeMinAmount,
    required this.commissionAvailableBalance,
    required this.modelFlag,
    required this.quotaAvailableBalance,
    required this.rebateWalletAmount,
  });

  factory ProxySystem2MainTransferInDataPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2MainTransferInDataPostRespModel(
        availableWalletAmount: jsonRes['availableWalletAmount'] == null
            ? 0.0
            : asT<double>(
                "availableWalletAmount", jsonRes['availableWalletAmount'])!,
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
        quotaChangeMinAmount: jsonRes['quotaChangeMinAmount'] == null
            ? 0.0
            : asT<double>("quotaChangeMinAmount", jsonRes['quotaChangeMinAmount'])!,

        commissionChangeMinAmount: jsonRes['commissionChangeMinAmount'] == null
            ? 0.0
            : asT<double>("commissionChangeMinAmount", jsonRes['commissionChangeMinAmount'])!,



        commissionAvailableBalance:
            jsonRes['commissionAvailableBalance'] == null
                ? 0.0
                : asT<double>("commissionAvailableBalance",
                    jsonRes['commissionAvailableBalance'])!,
        modelFlag: jsonRes['modelFlag'] == null
            ? 0
            : asT<int>("modelFlag", jsonRes['modelFlag'])!,
        quotaAvailableBalance: jsonRes['quotaAvailableBalance'] == null
            ? 0.0
            : asT<double>(
                "quotaAvailableBalance", jsonRes['quotaAvailableBalance'])!,
        rebateWalletAmount: jsonRes['rebateWalletAmount'] == null
            ? 0.0
            : asT<double>("rebateWalletAmount", jsonRes['rebateWalletAmount'])!,
      );

  double availableWalletAmount = 0.0;
  double bankerOrderWalletAmount = 0.0;
  double bankerOrderWalletAvailableAmount = 0.0;
  double bankerOrderWalletLockAmount = 0.0;

  double quotaChangeMinAmount = 0.0;
  double commissionChangeMinAmount = 0.0;

  double commissionAvailableBalance = 0.0;
  int modelFlag = 0;
  double quotaAvailableBalance = 0.0;
  double rebateWalletAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'availableWalletAmount': availableWalletAmount,
        'bankerOrderWalletAmount': bankerOrderWalletAmount,
        'bankerOrderWalletAvailableAmount': bankerOrderWalletAvailableAmount,
        'bankerOrderWalletLockAmount': bankerOrderWalletLockAmount,
        'quotaChangeMinAmount': quotaChangeMinAmount,
        'commissionChangeMinAmount': commissionChangeMinAmount,
        'commissionAvailableBalance': commissionAvailableBalance,
        'modelFlag': modelFlag,
        'quotaAvailableBalance': quotaAvailableBalance,
        'rebateWalletAmount': rebateWalletAmount,
      };
}
