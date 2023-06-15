import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameProfitAndLossTodayPostReqModel {
  GameProfitAndLossTodayPostReqModel({
    required this.createAtEnd,
    required this.createAtStart,
  });

  factory GameProfitAndLossTodayPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameProfitAndLossTodayPostReqModel(
        createAtEnd: jsonRes['createAtEnd'] == null
            ? ''
            : asT<String>("createAtEnd", jsonRes['createAtEnd'])!,
        createAtStart: jsonRes['createAtStart'] == null
            ? ''
            : asT<String>("createAtStart", jsonRes['createAtStart'])!,
      );

  String createAtEnd = '';
  String createAtStart = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createAtEnd': createAtEnd,
        'createAtStart': createAtStart,
      };
}
