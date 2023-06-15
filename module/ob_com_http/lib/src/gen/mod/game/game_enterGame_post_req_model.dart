import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameEnterGamePostReqModel {
  GameEnterGamePostReqModel({
    required this.mid,
    required this.mobile,
  });

  factory GameEnterGamePostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      GameEnterGamePostReqModel(
        mid: jsonRes['mid'] == null ? '' : asT<String>("mid", jsonRes['mid'])!,
        mobile: jsonRes['mobile'] == null
            ? false
            : asT<bool>("mobile", jsonRes['mobile'])!,
      );

  String mid = '';
  bool mobile = false;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mid': mid,
        'mobile': mobile,
      };
}
