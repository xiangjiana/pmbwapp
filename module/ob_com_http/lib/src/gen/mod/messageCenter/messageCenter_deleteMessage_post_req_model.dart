import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MessageCenterDeleteMessagePostReqModel {
  MessageCenterDeleteMessagePostReqModel({
    required this.messageIds,
    required this.messageType,
  });

  factory MessageCenterDeleteMessagePostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? messageIds =
        jsonRes['messageIds'] is List ? <String>[] : null;
    if (messageIds != null) {
      for (final dynamic item in jsonRes['messageIds']!) {
        if (item != null) {
          messageIds.add(asT<String>("messageIds", item)!);
        }
      }
    }
    return MessageCenterDeleteMessagePostReqModel(
      messageIds: messageIds == null ? [] : messageIds,
      messageType: jsonRes['messageType'] == null
          ? 0
          : asT<int>("messageType", jsonRes['messageType'])!,
    );
  }

  List<String> messageIds;
  int messageType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'messageIds': messageIds,
        'messageType': messageType,
      };
}
