import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryPlatformGamesPostReqModel {
  GameQueryPlatformGamesPostReqModel({
    required this.gameIcon,
    required this.gamePlatform,
  });

  factory GameQueryPlatformGamesPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameQueryPlatformGamesPostReqModel(
        gameIcon: jsonRes['gameIcon'] == null
            ? ''
            : asT<String>("gameIcon", jsonRes['gameIcon'])!,
        gamePlatform: jsonRes['gamePlatform'] == null
            ? ''
            : asT<String>("gamePlatform", jsonRes['gamePlatform'])!,
      );

  String gameIcon = '';
  String gamePlatform = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameIcon': gameIcon,
        'gamePlatform': gamePlatform,
      };
}
