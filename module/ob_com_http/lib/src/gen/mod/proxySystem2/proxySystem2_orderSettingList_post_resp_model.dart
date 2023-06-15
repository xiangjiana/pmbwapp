import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2OrderSettingListPostRespModel {
  ProxySystem2OrderSettingListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxySystem2OrderSettingListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxySystem2OrderSettingListPostRespModel_Record>? record = jsonRes['record'] is List ? <ProxySystem2OrderSettingListPostRespModel_Record>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxySystem2OrderSettingListPostRespModel_Record.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxySystem2OrderSettingListPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes['summary'] == null
          ? Map<String, dynamic>()
          : asT<Object>("summary", jsonRes['summary'])!,
      totalPage: jsonRes['totalPage'] == null
          ? 0
          : asT<int>("totalPage", jsonRes['totalPage'])!,
      totalRecord: jsonRes['totalRecord'] == null
          ? 0
          : asT<int>("totalRecord", jsonRes['totalRecord'])!,
    );
  }

  int pageNum = 0;
  int pageSize = 0;
  List<ProxySystem2OrderSettingListPostRespModel_Record> record;
  Object summary;
  int totalPage = 0;
  int totalRecord = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'record': record,
        'summary': summary,
        'totalPage': totalPage,
        'totalRecord': totalRecord,
      };
}

class ProxySystem2OrderSettingListPostRespModel_Record {
  ProxySystem2OrderSettingListPostRespModel_Record({
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

  factory ProxySystem2OrderSettingListPostRespModel_Record.fromJson(Map<String, dynamic> jsonRes) => ProxySystem2OrderSettingListPostRespModel_Record(
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
