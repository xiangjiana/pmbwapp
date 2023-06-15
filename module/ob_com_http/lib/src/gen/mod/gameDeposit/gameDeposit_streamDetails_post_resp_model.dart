import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameDepositStreamDetailsPostRespModel {
  GameDepositStreamDetailsPostRespModel({
    required this.percentage,
    required this.activityName,
    required this.billAmount,
    required this.completeBillAmount,
    required this.lowActivityAmount,
  });

  factory GameDepositStreamDetailsPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameDepositStreamDetailsPostRespModel(
        percentage: jsonRes['percentage'] == null
            ? 0.0
            : asT<double>("percentage", jsonRes['percentage'])!,
        activityName: jsonRes['activityName'] == null
            ? ''
            : asT<String>("activityName", jsonRes['activityName'])!,
        billAmount: jsonRes['billAmount'] == null
            ? 0.0
            : asT<double>("billAmount", jsonRes['billAmount'])!,
        completeBillAmount: jsonRes['completeBillAmount'] == null
            ? 0.0
            : asT<double>("completeBillAmount", jsonRes['completeBillAmount'])!,
        lowActivityAmount: jsonRes['lowActivityAmount'] == null
            ? 0.0
            : asT<double>("lowActivityAmount", jsonRes['lowActivityAmount'])!
      );

  double percentage = 0.0;
  String activityName = '';
  double billAmount = 0.0;
  double completeBillAmount = 0.0;
  double lowActivityAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'percentage': percentage,
        'activityName': activityName,
        'billAmount': billAmount,
        'completeBillAmount': completeBillAmount,
        'lowActivityAmount': lowActivityAmount,
      };
}
