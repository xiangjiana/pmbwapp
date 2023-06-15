import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameLoginPostReqModel {
  GameLoginPostReqModel({
    required this.deviceType,
    required this.gameCode,
    required this.lang,
    required this.gameId,
  });

  factory GameLoginPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameLoginPostReqModel(
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        lang: jsonRes['lang'] == null ? 0 : asT<int>("lang", jsonRes['lang'])!,
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
      );

  int deviceType = 0;
  String gameCode = '';
  int lang = 0;
  int gameId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceType': deviceType,
        'gameCode': gameCode,
        'lang': lang,
        'gameId': gameId,
      };
}
