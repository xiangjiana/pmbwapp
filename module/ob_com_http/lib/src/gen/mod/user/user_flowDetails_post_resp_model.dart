import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserFlowDetailsPostRespModel {
  UserFlowDetailsPostRespModel({
    required this.allowWithdraw,
    required this.differentAmount,
    required this.completeAmount,
    required this.validAmount,
    required this.totalAdjust,
    required this.totalBonus,
    required this.totalDeposit,
    required this.totalGameActivity,
    required this.clacTime,
  });

  factory UserFlowDetailsPostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserFlowDetailsPostRespModel(
        allowWithdraw: jsonRes['allowWithdraw'] == null
            ? false
            : asT<bool>("allowWithdraw", jsonRes['allowWithdraw'])!,
        differentAmount: jsonRes['differentAmount'] == null
            ? 0.0
            : asT<double>("differentAmount", jsonRes['differentAmount'])!,
        completeAmount: jsonRes['completeAmount'] == null
            ? 0.0
            : asT<double>("completeAmount", jsonRes['completeAmount'])!,
        validAmount: jsonRes['validAmount'] == null
            ? 0.0
            : asT<double>("validAmount", jsonRes['validAmount'])!,
        totalAdjust: jsonRes['totalAdjust'] == null
            ? 0.0
            : asT<double>("totalAdjust", jsonRes['totalAdjust'])!,
        totalBonus: jsonRes['totalBonus'] == null
            ? 0.0
            : asT<double>("totalBonus", jsonRes['totalBonus'])!,
        totalDeposit: jsonRes['totalDeposit'] == null
            ? 0.0
            : asT<double>("totalDeposit", jsonRes['totalDeposit'])!,

        totalGameActivity: jsonRes['totalGameActivity'] == null
            ? 0.0
            : asT<double>("totalGameActivity", jsonRes['totalGameActivity'])!,
        clacTime: jsonRes['clacTime'] == null
            ? ""
            : asT<String>("clacTime", jsonRes['clacTime'])!,
      );

  bool allowWithdraw = false;
  double differentAmount = 0.0;
  String  clacTime = "";
  double completeAmount = 0.0;
  double validAmount = 0.0;
  double totalAdjust = 0.0;
  double totalBonus = 0.0;
  double totalDeposit = 0.0;
  double totalGameActivity = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'allowWithdraw': allowWithdraw,
    'differentAmount': differentAmount,
    'completeAmount': completeAmount,
    'validAmount': validAmount,
  };
}
