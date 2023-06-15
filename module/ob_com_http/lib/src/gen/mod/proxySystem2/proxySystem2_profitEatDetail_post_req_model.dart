import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2ProfitEatDetailPostReqModel {
  ProxySystem2ProfitEatDetailPostReqModel({
    required this.endTime,
    required this.startTime,
  });

  factory ProxySystem2ProfitEatDetailPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2ProfitEatDetailPostReqModel(
        endTime: jsonRes['endTime'] == null
            ? ''
            : asT<String>("endTime", jsonRes['endTime'])!,
        startTime: jsonRes['startTime'] == null
            ? ''
            : asT<String>("startTime", jsonRes['startTime'])!,
      );

  String endTime = '';
  String startTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'endTime': endTime,
        'startTime': startTime,
      };
}
