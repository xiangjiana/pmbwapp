import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2MainDataPostRespModel {
  ProxySystem2MainDataPostRespModel({
    required this.bankerOrderWalletAmount,
    required this.bankerOrderWalletLockAmount,
    required this.modelFlag,
    required this.openStatus,
    required this.updatedStatus,
  });

  factory ProxySystem2MainDataPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2MainDataPostRespModel(
        bankerOrderWalletAmount: jsonRes['bankerOrderWalletAmount'] == null
            ? 0.0
            : asT<double>(
                "bankerOrderWalletAmount", jsonRes['bankerOrderWalletAmount'])!,
        bankerOrderWalletLockAmount:
            jsonRes['bankerOrderWalletLockAmount'] == null
                ? 0.0
                : asT<double>("bankerOrderWalletLockAmount",
                    jsonRes['bankerOrderWalletLockAmount'])!,
        modelFlag: jsonRes['modelFlag'] == null
            ? 0
            : asT<int>("modelFlag", jsonRes['modelFlag'])!,
        openStatus: jsonRes['openStatus'] == null
            ? 0
            : asT<int>("openStatus", jsonRes['openStatus'])!,
        updatedStatus: jsonRes['updatedStatus'] == null
            ? 0
            : asT<int>("updatedStatus", jsonRes['updatedStatus'])!,
      );

  double bankerOrderWalletAmount = 0.0;
  double bankerOrderWalletLockAmount = 0;
  int modelFlag = 0;
  int openStatus = 0;
  int updatedStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankerOrderWalletAmount': bankerOrderWalletAmount,
        'bankerOrderWalletLockAmount': bankerOrderWalletLockAmount,
        'modelFlag': modelFlag,
        'openStatus': openStatus,
        'updatedStatus': updatedStatus,
      };
}
