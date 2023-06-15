import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMessageUnreadAmountPostRespModel {
  ProxyProxyMessageUnreadAmountPostRespModel({
    required this.activity,
    required this.safeCode,
    required this.notify,
    required this.announce,
  });

  factory ProxyProxyMessageUnreadAmountPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyMessageUnreadAmountPostRespModel(
        activity: jsonRes['activity'] == null
            ? 0
            : asT<int>("activity", jsonRes['activity'])!,
        safeCode: jsonRes['safeCode'] == null
            ? 0
            : asT<int>("safeCode", jsonRes['safeCode'])!,
        notify: jsonRes['notify'] == null
            ? 0
            : asT<int>("notify", jsonRes['notify'])!,
        announce: jsonRes['announce'] == null
            ? 0
            : asT<int>("announce", jsonRes['announce'])!,
      );

  int activity = 0;
  int safeCode = 0;
  int notify = 0;
  int announce = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activity': activity,
        'safeCode': safeCode,
        'notify': notify,
        'announce': announce,
      };
}
