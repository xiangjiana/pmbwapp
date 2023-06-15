import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameZrLoginPostReqModel {
  GameZrLoginPostReqModel({
    required this.gameCode,
    required this.lang,
  });

  factory GameZrLoginPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameZrLoginPostReqModel(
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        lang: jsonRes['lang'] == null ? 0 : asT<int>("lang", jsonRes['lang'])!,
      );

  String gameCode = '';
  int lang = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameCode': gameCode,
        'lang': lang,
      };
}
