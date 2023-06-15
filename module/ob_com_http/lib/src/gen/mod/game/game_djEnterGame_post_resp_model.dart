import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameDjEnterGamePostRespModel {
  GameDjEnterGamePostRespModel({
    required this.url,
    required this.type,
  });

  factory GameDjEnterGamePostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameDjEnterGamePostRespModel(
        url: jsonRes['url'] == null ? '' : asT<String>("url", jsonRes['url'])!,
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  String url = '';
  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'type': type,
      };
}
