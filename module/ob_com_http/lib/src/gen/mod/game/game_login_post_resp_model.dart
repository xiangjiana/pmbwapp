import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameLoginPostRespModel {
  GameLoginPostRespModel({
    required this.type,
    required this.url,
    required this.token,
    required this.domain,
  });

  factory GameLoginPostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameLoginPostRespModel(
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
        url: jsonRes['url'] == null ? '' : asT<String>("url", jsonRes['url'])!,
        token: jsonRes['token'] == null ? '' : asT<String>("token", jsonRes['token'])!,
        domain: jsonRes['domain'] == null ? '' : asT<String>("domain", jsonRes['domain'])!,
      );

  int type = 0;
  String url = '';
  String token = '';
  String domain = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'url': url,
        'token': token,
        'domain': domain,
      };
}
