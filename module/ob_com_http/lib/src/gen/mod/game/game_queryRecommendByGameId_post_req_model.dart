import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryRecommendByGameIdPostReqModel {
  GameQueryRecommendByGameIdPostReqModel({
    required this.typeId,
  });

  factory GameQueryRecommendByGameIdPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameQueryRecommendByGameIdPostReqModel(
        typeId: jsonRes['typeId'] == null
            ? ''
            : asT<String>("typeId", jsonRes['typeId'])!,
      );

  String typeId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'typeId': typeId,
      };
}
