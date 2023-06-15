import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameByGameNamePostReqModel {
  GameQueryGameByGameNamePostReqModel({
    required this.gameName,
  });

  factory GameQueryGameByGameNamePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameQueryGameByGameNamePostReqModel(
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
      );

  String gameName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameName': gameName,
      };
}
