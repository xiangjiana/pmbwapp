import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameRecordQueryGamePostReqModel {
  GameRecordQueryGamePostReqModel({
    required this.endTime,
    required this.gameCode,
    required this.obBetStatus,
    required this.startTime,
  });

  factory GameRecordQueryGamePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameRecordQueryGamePostReqModel(
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        obBetStatus: jsonRes['obBetStatus'] == null
            ? 0
            : asT<int>("obBetStatus", jsonRes['obBetStatus'])!,
        startTime: jsonRes['startTime'] == null
            ? ''
            : asT<String>("startTime", jsonRes['startTime'])!,
      );

  String endTime = '';
  String gameCode = '';
  int obBetStatus = 0;
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endTime': endTime,
        'gameCode': gameCode,
        'obBetStatus': obBetStatus,
        'startTime': startTime,
      };
}
