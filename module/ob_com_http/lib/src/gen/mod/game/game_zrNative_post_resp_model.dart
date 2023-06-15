import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameZrNativePostRespModel {
  GameZrNativePostRespModel({
    required this.domain,
    required this.playerId,
    required this.token,
    required this.wss,
  });

  factory GameZrNativePostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameZrNativePostRespModel(
        domain: jsonRes['domain'] == null
            ? ''
            : asT<String>("domain", jsonRes['domain'])!,
        playerId: jsonRes['playerId'] == null
            ? ''
            : asT<String>("playerId", jsonRes['playerId'])!,
        token: jsonRes['token'] == null
            ? ''
            : asT<String>("token", jsonRes['token'])!,
        wss: jsonRes['wss'] == null ? '' : asT<String>("wss", jsonRes['wss'])!,
      );

  String domain = '';
  String playerId = '';
  String token = '';
  String wss = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'domain': domain,
        'playerId': playerId,
        'token': token,
        'wss': wss,
      };
}
