import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MessageCenterHasUnReceivedBonusPostRespModel {
  MessageCenterHasUnReceivedBonusPostRespModel({
    required this.hasReceivedAmount,
    required this.timestamp,
  });

  factory MessageCenterHasUnReceivedBonusPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MessageCenterHasUnReceivedBonusPostRespModel(
        hasReceivedAmount: jsonRes['hasReceivedAmount'] == null
            ? 0
            : asT<int>("hasReceivedAmount", jsonRes['hasReceivedAmount'])!,
        timestamp: jsonRes['timestamp'] == null
            ? 0
            : asT<int>("timestamp", jsonRes['timestamp'])!,
      );

  int hasReceivedAmount = 0;
  int timestamp = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'hasReceivedAmount': hasReceivedAmount,
        'timestamp': timestamp,
      };
}
