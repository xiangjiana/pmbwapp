import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerHandicapSwitchPostReqModel {
  ProxySystem2BankerHandicapSwitchPostReqModel({
    required this.handicapStatus,
  });

  factory ProxySystem2BankerHandicapSwitchPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2BankerHandicapSwitchPostReqModel(
        handicapStatus: jsonRes['handicapStatus'] == null
            ? 0
            : asT<int>("handicapStatus", jsonRes['handicapStatus'])!,
      );

  int handicapStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'handicapStatus': handicapStatus,
      };
}
