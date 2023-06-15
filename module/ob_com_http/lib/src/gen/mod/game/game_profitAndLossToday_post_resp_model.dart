import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameProfitAndLossTodayPostRespModel {
  GameProfitAndLossTodayPostRespModel({
    required this.todayProfit,
  });

  factory GameProfitAndLossTodayPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameProfitAndLossTodayPostRespModel(
        todayProfit: jsonRes['todayProfit'] == null
            ? 0.0
            : asT<double>("todayProfit", jsonRes['todayProfit'])!,
      );

  double todayProfit = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'todayProfit': todayProfit,
      };
}
