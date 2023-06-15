import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class FirstDepositGetUserVipActivityInfoPostReqModel {
  FirstDepositGetUserVipActivityInfoPostReqModel({
    required this.gameCode,
    required this.vipSerialNum,
  });

  factory FirstDepositGetUserVipActivityInfoPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      FirstDepositGetUserVipActivityInfoPostReqModel(
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? 0
            : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
      );

  String gameCode = '';
  int vipSerialNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameCode': gameCode,
        'vipSerialNum': vipSerialNum,
      };
}
