import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameHotMatchesPostReqModel {
  GameHotMatchesPostReqModel({
    required this.findType,
  });

  factory GameHotMatchesPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameHotMatchesPostReqModel(
        findType: jsonRes['findType'] == null
            ? 0
            : asT<int>("findType", jsonRes['findType'])!,
      );

  int findType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'findType': findType,
      };
}