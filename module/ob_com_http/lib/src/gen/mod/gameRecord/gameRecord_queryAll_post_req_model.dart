import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameRecordQueryAllPostReqModel {
  GameRecordQueryAllPostReqModel({
    required this.endTime,
    required this.obBetStatus,
    required this.startTime,
  });

  factory GameRecordQueryAllPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameRecordQueryAllPostReqModel(
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        obBetStatus: jsonRes['obBetStatus'] == null
            ? 0
            : asT<int>("obBetStatus", jsonRes['obBetStatus'])!,
        startTime: jsonRes['startTime'] == null
            ? ''
            : asT<String>("startTime", jsonRes['startTime'])!,
      );

  String endTime = '';
  int obBetStatus = 0;
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endTime': endTime,
        'obBetStatus': obBetStatus,
        'startTime': startTime,
      };
}
