import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerInventoryOrderListPostRespModel {
  ProxySystem2BankerInventoryOrderListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxySystem2BankerInventoryOrderListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxySystem2BankerInventoryOrderListPostRespModel_Record>? record = jsonRes['record'] is List ? <ProxySystem2BankerInventoryOrderListPostRespModel_Record>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxySystem2BankerInventoryOrderListPostRespModel_Record.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxySystem2BankerInventoryOrderListPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? ProxySystem2BankerInventoryOrderListPostRespModel_Summary.fromJson({})
          : ProxySystem2BankerInventoryOrderListPostRespModel_Summary.fromJson(
              asT<Map<String, dynamic>>("summary", jsonRes["summary"])!),
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
  List<ProxySystem2BankerInventoryOrderListPostRespModel_Record> record;
  ProxySystem2BankerInventoryOrderListPostRespModel_Summary summary;
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

class ProxySystem2BankerInventoryOrderListPostRespModel_Record {
  ProxySystem2BankerInventoryOrderListPostRespModel_Record({
    required this.betAmount,
    required this.changeDescription,
    required this.createAt,
    required this.detail,
    required this.id,
    required this.matchName,
    required this.maxWin,
    required this.memberName,
    required this.netAmount,
    required this.obBetStatus,
    required this.operateStatus,
    required this.reason,
    required this.sportName,
    required this.startTime,
    required this.validBetAmount,
  });

  factory ProxySystem2BankerInventoryOrderListPostRespModel_Record.fromJson(Map<String, dynamic> jsonRes) {
    final List<ProxySystem2BankerInventoryOrderListPostRespModel_Detail>? detail = jsonRes['detail'] is List ? <ProxySystem2BankerInventoryOrderListPostRespModel_Detail>[] : null;
    if (detail != null) {
      for (final dynamic item in jsonRes['detail']!) {
        if (item != null) {
          detail
              .add(ProxySystem2BankerInventoryOrderListPostRespModel_Detail.fromJson(asT<Map<String, dynamic>>("detail", item)!));
        }
      }
    }
    return ProxySystem2BankerInventoryOrderListPostRespModel_Record(
      betAmount: jsonRes['betAmount'] == null
          ? 0.0
          : asT<double>("betAmount", jsonRes['betAmount'])!,
      changeDescription: jsonRes['changeDescription'] == null
          ? ''
          : asT<String>("changeDescription", jsonRes['changeDescription'])!,
      createAt: jsonRes['createAt'] == null
          ? ''
          : asT<String>("createAt", jsonRes['createAt'])!,
      detail: detail == null ? [] : detail,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      matchName: jsonRes['matchName'] == null
          ? ''
          : asT<String>("matchName", jsonRes['matchName'])!,
      maxWin: jsonRes['maxWin'] == null
          ? 0.0
          : asT<double>("maxWin", jsonRes['maxWin'])!,
      memberName: jsonRes['memberName'] == null
          ? ''
          : asT<String>("memberName", jsonRes['memberName'])!,
      netAmount: jsonRes['netAmount'] == null
          ? 0.0
          : asT<double>("netAmount", jsonRes['netAmount'])!,
      obBetStatus: jsonRes['obBetStatus'] == null
          ? ''
          : asT<String>("obBetStatus", jsonRes['obBetStatus'])!,
      operateStatus: jsonRes['operateStatus'] == null
          ? 0
          : asT<int>("operateStatus", jsonRes['operateStatus'])!,
      reason: jsonRes['reason'] == null
          ? 0
          : asT<int>("reason", jsonRes['reason'])!,
      sportName: jsonRes['sportName'] == null
          ? ''
          : asT<String>("sportName", jsonRes['sportName'])!,
      startTime: jsonRes['startTime'] == null
          ? ''
          : asT<String>("startTime", jsonRes['startTime'])!,
      validBetAmount: jsonRes['validBetAmount'] == null
          ? 0.0
          : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
    );
  }

  double betAmount = 0.0;
  String changeDescription = '';
  String createAt = '';
  List<ProxySystem2BankerInventoryOrderListPostRespModel_Detail> detail;
  String id = '';
  String matchName = '';
  double maxWin = 0.0;
  String memberName = '';
  double netAmount = 0.0;
  String obBetStatus = '';
  int operateStatus = 0;
  int reason = 0;
  String sportName = '';
  String startTime = '';
  double validBetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'changeDescription': changeDescription,
        'createAt': createAt,
        'detail': detail,
        'id': id,
        'matchName': matchName,
        'maxWin': maxWin,
        'memberName': memberName,
        'netAmount': netAmount,
        'obBetStatus': obBetStatus,
        'operateStatus': operateStatus,
        'reason': reason,
        'sportName': sportName,
        'startTime': startTime,
        'validBetAmount': validBetAmount,
      };
}

class ProxySystem2BankerInventoryOrderListPostRespModel_Detail {
  ProxySystem2BankerInventoryOrderListPostRespModel_Detail({
    required this.marketType,
    required this.matchInfo,
    required this.matchName,
    required this.matchResult,
    required this.matchType,
    required this.oddsValue,
    required this.playName,
    required this.playOptionName,
    required this.scoreBenchmark,
    required this.sportName,
  });

  factory ProxySystem2BankerInventoryOrderListPostRespModel_Detail.fromJson(Map<String, dynamic> jsonRes) => ProxySystem2BankerInventoryOrderListPostRespModel_Detail(
        marketType: jsonRes['marketType'] == null
            ? ''
            : asT<String>("marketType", jsonRes['marketType'])!,
        matchInfo: jsonRes['matchInfo'] == null
            ? ''
            : asT<String>("matchInfo", jsonRes['matchInfo'])!,
        matchName: jsonRes['matchName'] == null
            ? ''
            : asT<String>("matchName", jsonRes['matchName'])!,
        matchResult: jsonRes['matchResult'] == null
            ? ''
            : asT<String>("matchResult", jsonRes['matchResult'])!,
        matchType: jsonRes['matchType'] == null
            ? ''
            : asT<String>("matchType", jsonRes['matchType'])!,
        oddsValue: jsonRes['oddsValue'] == null
            ? ''
            : asT<String>("oddsValue", jsonRes['oddsValue'])!,
        playName: jsonRes['playName'] == null
            ? ''
            : asT<String>("playName", jsonRes['playName'])!,
        playOptionName: jsonRes['playOptionName'] == null
            ? ''
            : asT<String>("playOptionName", jsonRes['playOptionName'])!,
        scoreBenchmark: jsonRes['scoreBenchmark'] == null
            ? ''
            : asT<String>("scoreBenchmark", jsonRes['scoreBenchmark'])!,
        sportName: jsonRes['sportName'] == null
            ? ''
            : asT<String>("sportName", jsonRes['sportName'])!,
      );

  String marketType = '';
  String matchInfo = '';
  String matchName = '';
  String matchResult = '';
  String matchType = '';
  String oddsValue = '';
  String playName = '';
  String playOptionName = '';
  String scoreBenchmark = '';
  String sportName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'marketType': marketType,
        'matchInfo': matchInfo,
        'matchName': matchName,
        'matchResult': matchResult,
        'matchType': matchType,
        'oddsValue': oddsValue,
        'playName': playName,
        'playOptionName': playOptionName,
        'scoreBenchmark': scoreBenchmark,
        'sportName': sportName,
      };
}

class ProxySystem2BankerInventoryOrderListPostRespModel_Summary {
  ProxySystem2BankerInventoryOrderListPostRespModel_Summary({
    required this.sportNames,
  });

  factory ProxySystem2BankerInventoryOrderListPostRespModel_Summary.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? sportNames =
        jsonRes['sportNames'] is List ? <String>[] : null;
    if (sportNames != null) {
      for (final dynamic item in jsonRes['sportNames']!) {
        if (item != null) {
          sportNames.add(asT<String>("sportNames", item)!);
        }
      }
    }
    return ProxySystem2BankerInventoryOrderListPostRespModel_Summary(
      sportNames: sportNames == null ? [] : sportNames,
    );
  }

  List<String> sportNames;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'sportNames': sportNames,
      };
}
