import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class InviteInviteNotificationPostRespModel {
  InviteInviteNotificationPostRespModel({
    required this.number,
    required this.rewardSendPosition,
  });

  factory InviteInviteNotificationPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      InviteInviteNotificationPostRespModel(
        number: jsonRes['number'] == null
            ? 0
            : asT<int>("number", jsonRes['number'])!,
        rewardSendPosition: jsonRes['rewardSendPosition'] == null
            ? 0
            : asT<int>("rewardSendPosition", jsonRes['rewardSendPosition'])!,
      );

  int number = 0;
  int rewardSendPosition = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'number': number,
        'rewardSendPosition': rewardSendPosition,
      };
}
