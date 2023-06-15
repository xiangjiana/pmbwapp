import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2OrderDataPostRespModel {
  ProxySystem2OrderDataPostRespModel({
    required this.eatOrderWalletAmount,
    required this.eatOrderWalletAvailableAmount,
    required this.eatOrderWalletLockAmount,
    required this.inventoryOrderBetAmount,
    required this.inventoryOrderMaxWinAmount,
    required this.inventoryOrderNum,
  });

  factory ProxySystem2OrderDataPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2OrderDataPostRespModel(
        eatOrderWalletAmount: jsonRes['eatOrderWalletAmount'] == null
            ? 0.0
            : asT<double>(
                "eatOrderWalletAmount", jsonRes['eatOrderWalletAmount'])!,
        eatOrderWalletAvailableAmount:
            jsonRes['eatOrderWalletAvailableAmount'] == null
                ? 0.0
                : asT<double>("eatOrderWalletAvailableAmount",
                    jsonRes['eatOrderWalletAvailableAmount'])!,
        eatOrderWalletLockAmount: jsonRes['eatOrderWalletLockAmount'] == null
            ? 0.0
            : asT<double>("eatOrderWalletLockAmount",
                jsonRes['eatOrderWalletLockAmount'])!,
        inventoryOrderBetAmount: jsonRes['inventoryOrderBetAmount'] == null
            ? 0.0
            : asT<double>(
                "inventoryOrderBetAmount", jsonRes['inventoryOrderBetAmount'])!,
        inventoryOrderMaxWinAmount:
            jsonRes['inventoryOrderMaxWinAmount'] == null
                ? 0.0
                : asT<double>("inventoryOrderMaxWinAmount",
                    jsonRes['inventoryOrderMaxWinAmount'])!,
        inventoryOrderNum: jsonRes['inventoryOrderNum'] == null
            ? 0
            : asT<int>("inventoryOrderNum", jsonRes['inventoryOrderNum'])!,
      );

  double eatOrderWalletAmount = 0.0;
  double eatOrderWalletAvailableAmount = 0.0;
  double eatOrderWalletLockAmount = 0.0;
  double inventoryOrderBetAmount = 0.0;
  double inventoryOrderMaxWinAmount = 0.0;
  int inventoryOrderNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'eatOrderWalletAmount': eatOrderWalletAmount,
        'eatOrderWalletAvailableAmount': eatOrderWalletAvailableAmount,
        'eatOrderWalletLockAmount': eatOrderWalletLockAmount,
        'inventoryOrderBetAmount': inventoryOrderBetAmount,
        'inventoryOrderMaxWinAmount': inventoryOrderMaxWinAmount,
        'inventoryOrderNum': inventoryOrderNum,
      };
}
