import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MessageSelectRespectiveUnReadAmountPostRespModel {
  MessageSelectRespectiveUnReadAmountPostRespModel({
    required this.activityUnReadAmount,
    required this.announceUnReadAmount,
    required this.bonusUnReadAmount,
    required this.noticeUnReadAmount,
  });

  factory MessageSelectRespectiveUnReadAmountPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MessageSelectRespectiveUnReadAmountPostRespModel(
        activityUnReadAmount: jsonRes['activityUnReadAmount'] == null
            ? 0
            : asT<int>(
                "activityUnReadAmount", jsonRes['activityUnReadAmount'])!,
        announceUnReadAmount: jsonRes['announceUnReadAmount'] == null
            ? 0
            : asT<int>(
                "announceUnReadAmount", jsonRes['announceUnReadAmount'])!,
        bonusUnReadAmount: jsonRes['bonusUnReadAmount'] == null
            ? 0
            : asT<int>("bonusUnReadAmount", jsonRes['bonusUnReadAmount'])!,
        noticeUnReadAmount: jsonRes['noticeUnReadAmount'] == null
            ? 0
            : asT<int>("noticeUnReadAmount", jsonRes['noticeUnReadAmount'])!,
      );

  int activityUnReadAmount = 0;
  int announceUnReadAmount = 0;
  int bonusUnReadAmount = 0;
  int noticeUnReadAmount = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityUnReadAmount': activityUnReadAmount,
        'announceUnReadAmount': announceUnReadAmount,
        'bonusUnReadAmount': bonusUnReadAmount,
        'noticeUnReadAmount': noticeUnReadAmount,
      };
}
