import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameMaintainMyCollectPostReqModel {
  GameMaintainMyCollectPostReqModel({
    required this.gameId,
    required this.type,
  });

  factory GameMaintainMyCollectPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameMaintainMyCollectPostReqModel(
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  int gameId = 0;
  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameId': gameId,
        'type': type,
      };
}
