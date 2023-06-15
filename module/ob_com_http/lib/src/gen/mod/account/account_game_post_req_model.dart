import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccountGamePostReqModel {
  AccountGamePostReqModel({
    required this.gameCode,
  });

  factory AccountGamePostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      AccountGamePostReqModel(
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
      );

  String gameCode = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameCode': gameCode,
      };
}
