import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class InviteInviteNotificationPostReqModel {
  InviteInviteNotificationPostReqModel({
    required this.type,
  });

  factory InviteInviteNotificationPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      InviteInviteNotificationPostReqModel(
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
      };
}
