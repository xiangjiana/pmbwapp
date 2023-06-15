import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameDepositDepositCountPostRespModel {
  GameDepositDepositCountPostRespModel({
    required this.isContinuityWithDraw,
    required this.depositSumAmount,
    required this.withdrawWater,
    required this.bonusSumAmount,
  });

  factory GameDepositDepositCountPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameDepositDepositCountPostRespModel(
        isContinuityWithDraw: jsonRes['isContinuityWithDraw'] == null
            ? 0.0
            : asT<double>(
                "isContinuityWithDraw", jsonRes['isContinuityWithDraw'])!,
        depositSumAmount: jsonRes['depositSumAmount'] == null
            ? 0.0
            : asT<double>("depositSumAmount", jsonRes['depositSumAmount'])!,
        withdrawWater: jsonRes['withdrawWater'] == null
            ? 0.0
            : asT<double>("withdrawWater", jsonRes['withdrawWater'])!,
        bonusSumAmount: jsonRes['bonusSumAmount'] == null
            ? 0.0
            : asT<double>("bonusSumAmount", jsonRes['bonusSumAmount'])!,
      );

  double isContinuityWithDraw = 0.0;
  double depositSumAmount = 0.0;
  double withdrawWater = 0.0;
  double bonusSumAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isContinuityWithDraw': isContinuityWithDraw,
        'depositSumAmount': depositSumAmount,
        'withdrawWater': withdrawWater,
        'bonusSumAmount': bonusSumAmount,
      };
}
