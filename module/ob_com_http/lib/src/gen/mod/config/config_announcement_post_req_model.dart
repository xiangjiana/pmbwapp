import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigAnnouncementPostReqModel {
  ConfigAnnouncementPostReqModel({
    required this.terminal,
  });

  factory ConfigAnnouncementPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ConfigAnnouncementPostReqModel(
        terminal: jsonRes['terminal'] == null
            ? ''
            : asT<String>("terminal", jsonRes['terminal'])!,
      );

  String terminal = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'terminal': terminal,
      };
}
