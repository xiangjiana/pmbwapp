import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameDepositDepositPostReqModel {
  GameDepositDepositPostReqModel({
    required this.gameCode,
  });

  factory GameDepositDepositPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameDepositDepositPostReqModel(
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
