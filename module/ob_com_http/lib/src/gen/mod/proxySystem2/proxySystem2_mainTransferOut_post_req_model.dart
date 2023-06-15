import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2MainTransferOutPostReqModel {
  ProxySystem2MainTransferOutPostReqModel({
    required this.sourceWalletType,
    required this.transferIn,
    required this.transferOutAmount,
  });

  factory ProxySystem2MainTransferOutPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2MainTransferOutPostReqModel(
        sourceWalletType: jsonRes['sourceWalletType'] == null
            ? 0
            : asT<int>("sourceWalletType", jsonRes['sourceWalletType'])!,
        transferIn: jsonRes['transferIn'] == null
            ? 0
            : asT<int>("transferIn", jsonRes['transferIn'])!,
        transferOutAmount: jsonRes['transferOutAmount'] == null
            ? 0.0
            : asT<double>("transferOutAmount", jsonRes['transferOutAmount'])!,
      );

  int sourceWalletType = 0;
  int transferIn = 0;
  double transferOutAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'sourceWalletType': sourceWalletType,
        'transferIn': transferIn,
        'transferOutAmount': transferOutAmount,
      };
}
