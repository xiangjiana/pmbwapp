import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameListByAssortIdPostReqModel {
  GameQueryGameListByAssortIdPostReqModel({
    required this.assortId,
  });

  factory GameQueryGameListByAssortIdPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameQueryGameListByAssortIdPostReqModel(
        assortId: jsonRes['assortId'] == null
            ? 0
            : asT<int>("assortId", jsonRes['assortId'])!,
      );

  int assortId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'assortId': assortId,
      };
}
