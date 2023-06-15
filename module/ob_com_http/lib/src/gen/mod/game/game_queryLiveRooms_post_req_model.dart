import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryLiveRoomsPostReqModel {
  GameQueryLiveRoomsPostReqModel({
    required this.ip,
    required this.clientType,
  });

  factory GameQueryLiveRoomsPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameQueryLiveRoomsPostReqModel(
        ip: jsonRes['ip'] == null ? '' : asT<String>("ip", jsonRes['ip'])!,
        clientType: jsonRes['clientType'] == null
            ? 0
            : asT<int>("clientType", jsonRes['clientType'])!,
      );

  String ip = '';
  int clientType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ip': ip,
        'clientType': clientType,
      };
}
