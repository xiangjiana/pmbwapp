import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerDataPostRespModel {
  ProxySystem2BankerDataPostRespModel({
    required this.bankerOrderWalletAmount,
    required this.bankerOrderWalletAvailableAmount,
    required this.bankerOrderWalletLockAmount,
    required this.handicapLastCloseTime,
    required this.handicapLastOpenTime,
    required this.handicapStatus,
  });

  factory ProxySystem2BankerDataPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2BankerDataPostRespModel(
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
        handicapLastCloseTime: jsonRes['handicapLastCloseTime'] == null
            ? ''
            : asT<String>(
                "handicapLastCloseTime", jsonRes['handicapLastCloseTime'])!,
        handicapLastOpenTime: jsonRes['handicapLastOpenTime'] == null
            ? ''
            : asT<String>(
                "handicapLastOpenTime", jsonRes['handicapLastOpenTime'])!,
        handicapStatus: jsonRes['handicapStatus'] == null
            ? 0
            : asT<int>("handicapStatus", jsonRes['handicapStatus'])!,
      );

  double bankerOrderWalletAmount = 0;
  double bankerOrderWalletAvailableAmount = 0;
  double bankerOrderWalletLockAmount = 0;
  String handicapLastCloseTime = '';
  String handicapLastOpenTime = '';
  int handicapStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankerOrderWalletAmount': bankerOrderWalletAmount,
        'bankerOrderWalletAvailableAmount': bankerOrderWalletAvailableAmount,
        'bankerOrderWalletLockAmount': bankerOrderWalletLockAmount,
        'handicapLastCloseTime': handicapLastCloseTime,
        'handicapLastOpenTime': handicapLastOpenTime,
        'handicapStatus': handicapStatus,
      };
}
