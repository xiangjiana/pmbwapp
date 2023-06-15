import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MessageCenterSelectBonusUnReadAmountPostRespModel {
  MessageCenterSelectBonusUnReadAmountPostRespModel({
    required this.data,
  });

  factory MessageCenterSelectBonusUnReadAmountPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MessageCenterSelectBonusUnReadAmountPostRespModel(
        data: jsonRes['data'] == null ? 0 : asT<int>("data", jsonRes['data'])!,
      );

  int data = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}
