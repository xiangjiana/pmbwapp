import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameBalancetransferPostReqModel {
  GameBalancetransferPostReqModel({
    required this.amount,
    required this.gameCode,
    required this.transferType,
  });

  factory GameBalancetransferPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameBalancetransferPostReqModel(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        transferType: jsonRes['transferType'] == null
            ? 0.0
            : asT<double>("transferType", jsonRes['transferType'])!,
      );

  double amount = 0.0;
  String gameCode = '';
  double transferType = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'gameCode': gameCode,
        'transferType': transferType,
      };
}
