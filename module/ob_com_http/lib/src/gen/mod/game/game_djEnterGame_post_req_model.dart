import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameDjEnterGamePostReqModel {
  GameDjEnterGamePostReqModel({
    required this.matchId,
  });

  factory GameDjEnterGamePostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameDjEnterGamePostReqModel(
        matchId: jsonRes['matchId'] == null
            ? ''
            : asT<String>("matchId", jsonRes['matchId'])!,
      );

  String matchId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'matchId': matchId,
      };
}
