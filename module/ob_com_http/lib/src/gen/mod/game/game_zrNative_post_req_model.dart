import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameZrNativePostReqModel {
  GameZrNativePostReqModel({
    required this.gameCode,
    required this.gameId,
    required this.lang,
  });

  factory GameZrNativePostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameZrNativePostReqModel(
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        lang: jsonRes['lang'] == null ? 0 : asT<int>("lang", jsonRes['lang'])!,
      );

  String gameCode = '';
  int gameId = 0;
  int lang = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameCode': gameCode,
        'gameId': gameId,
        'lang': lang,
      };
}
