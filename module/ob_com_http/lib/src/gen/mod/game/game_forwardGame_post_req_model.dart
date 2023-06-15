import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameForwardGamePostReqModel {
  GameForwardGamePostReqModel({
    required this.deviceType,
    required this.anchorId,
    required this.lang,
    required this.tableId,
  });

  factory GameForwardGamePostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameForwardGamePostReqModel(
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
        anchorId: jsonRes['anchorId'] == null
            ? 0
            : asT<int>("anchorId", jsonRes['anchorId'])!,
        lang: jsonRes['lang'] == null ? 0 : asT<int>("lang", jsonRes['lang'])!,
        tableId: jsonRes['tableId'] == null
            ? 0
            : asT<int>("tableId", jsonRes['tableId'])!,
      );

  int deviceType = 0;
  int anchorId = 0;
  int lang = 0;
  int tableId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceType': deviceType,
        'anchorId': anchorId,
        'lang': lang,
        'tableId': tableId,
      };
}
