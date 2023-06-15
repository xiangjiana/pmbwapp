import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2OrderSettingQueryPostRespModel {
  ProxySystem2OrderSettingQueryPostRespModel({
    required this.autoOrderOnStatus,
    required this.effectiveTime,
    required this.maxWinAmount,
    required this.maxWinEffectiveVenue,
    required this.maxWinOnStatus,
    required this.oddsRangeEffectiveVenue,
    required this.oddsRangeEndValue,
    required this.oddsRangeOnStatus,
    required this.oddsRangeStartValue,
  });

  factory ProxySystem2OrderSettingQueryPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2OrderSettingQueryPostRespModel(
        autoOrderOnStatus: jsonRes['autoOrderOnStatus'] == null
            ? 0
            : asT<int>("autoOrderOnStatus", jsonRes['autoOrderOnStatus'])!,
        effectiveTime: jsonRes['effectiveTime'] == null
            ? ''
            : asT<String>("effectiveTime", jsonRes['effectiveTime'])!,
        maxWinAmount: jsonRes['maxWinAmount'] == null
            ? 0.0
            : asT<double>("maxWinAmount", jsonRes['maxWinAmount'])!,
        maxWinEffectiveVenue: jsonRes['maxWinEffectiveVenue'] == null
            ? ''
            : asT<String>(
                "maxWinEffectiveVenue", jsonRes['maxWinEffectiveVenue'])!,
        maxWinOnStatus: jsonRes['maxWinOnStatus'] == null
            ? 0
            : asT<int>("maxWinOnStatus", jsonRes['maxWinOnStatus'])!,
        oddsRangeEffectiveVenue: jsonRes['oddsRangeEffectiveVenue'] == null
            ? ''
            : asT<String>(
                "oddsRangeEffectiveVenue", jsonRes['oddsRangeEffectiveVenue'])!,
        oddsRangeEndValue: jsonRes['oddsRangeEndValue'] == null
            ? 0.0
            : asT<double>("oddsRangeEndValue", jsonRes['oddsRangeEndValue'])!,
        oddsRangeOnStatus: jsonRes['oddsRangeOnStatus'] == null
            ? 0
            : asT<int>("oddsRangeOnStatus", jsonRes['oddsRangeOnStatus'])!,
        oddsRangeStartValue: jsonRes['oddsRangeStartValue'] == null
            ? 0.0
            : asT<double>(
                "oddsRangeStartValue", jsonRes['oddsRangeStartValue'])!,
      );

  int autoOrderOnStatus = 0;
  String effectiveTime = '';
  double maxWinAmount = 0.0;
  String maxWinEffectiveVenue = '';
  int maxWinOnStatus = 0;
  String oddsRangeEffectiveVenue = '';
  double oddsRangeEndValue = 0.0;
  int oddsRangeOnStatus = 0;
  double oddsRangeStartValue = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'autoOrderOnStatus': autoOrderOnStatus,
        'effectiveTime': effectiveTime,
        'maxWinAmount': maxWinAmount,
        'maxWinEffectiveVenue': maxWinEffectiveVenue,
        'maxWinOnStatus': maxWinOnStatus,
        'oddsRangeEffectiveVenue': oddsRangeEffectiveVenue,
        'oddsRangeEndValue': oddsRangeEndValue,
        'oddsRangeOnStatus': oddsRangeOnStatus,
        'oddsRangeStartValue': oddsRangeStartValue,
      };
}
