import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MessageCenterSelectRespectiveUnReadAmountPostRespModel {
  MessageCenterSelectRespectiveUnReadAmountPostRespModel({
    required this.data,
  });

  factory MessageCenterSelectRespectiveUnReadAmountPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MessageCenterSelectRespectiveUnReadAmountPostRespModel(
        data: jsonRes["data"] == null
            ? MessageCenterSelectRespectiveUnReadAmountPostRespModelData.fromJson({})
            : MessageCenterSelectRespectiveUnReadAmountPostRespModelData.fromJson(
                asT<Map<String, dynamic>>("data", jsonRes["data"])!),
      );

  MessageCenterSelectRespectiveUnReadAmountPostRespModelData data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class MessageCenterSelectRespectiveUnReadAmountPostRespModelData {
  MessageCenterSelectRespectiveUnReadAmountPostRespModelData({
    required this.activityUnReadAmount,
    required this.announceUnReadAmount,
    required this.bonusUnReadAmount,
    required this.noticeUnReadAmount,
  });

  factory MessageCenterSelectRespectiveUnReadAmountPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => MessageCenterSelectRespectiveUnReadAmountPostRespModelData(
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
