import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class FirstDepositActivityDepositPostReqModel {
  FirstDepositActivityDepositPostReqModel({
    required this.activityId,
    required this.activityType,
    required this.amount,
    required this.gameCode,
    required this.vipSerialNum,
  });

  factory FirstDepositActivityDepositPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      FirstDepositActivityDepositPostReqModel(
        activityId: jsonRes['activityId'] == null
            ? ''
            : asT<String>("activityId", jsonRes['activityId'])!,
        activityType: jsonRes['activityType'] == null
            ? 0
            : asT<int>("activityType", jsonRes['activityType'])!,
        amount: jsonRes['amount'] == null
            ? 0
            : asT<int>("amount", jsonRes['amount'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? 0
            : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
      );

  String activityId = '';
  int activityType = 0;
  int amount = 0;
  String gameCode = '';
  int vipSerialNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityId': activityId,
        'activityType': activityType,
        'amount': amount,
        'gameCode': gameCode,
        'vipSerialNum': vipSerialNum,
      };
}
