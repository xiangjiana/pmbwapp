import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameDyLoginPostReqModel {
  GameDyLoginPostReqModel({
    required this.gameId,
    required this.lang,
  });

  factory GameDyLoginPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameDyLoginPostReqModel(
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        lang: jsonRes['lang'] == null ? 0 : asT<int>("lang", jsonRes['lang'])!,
      );

  int gameId = 0;
  int lang = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameId': gameId,
        'lang': lang,
      };
}
