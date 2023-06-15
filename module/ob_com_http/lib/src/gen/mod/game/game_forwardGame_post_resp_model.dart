import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameForwardGamePostRespModel {
  GameForwardGamePostRespModel({
    required this.type,
    required this.url,
  });

  factory GameForwardGamePostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameForwardGamePostRespModel(
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
        url: jsonRes['url'] == null ? '' : asT<String>("url", jsonRes['url'])!,
      );

  int type = 0;
  String url = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'url': url,
      };
}
