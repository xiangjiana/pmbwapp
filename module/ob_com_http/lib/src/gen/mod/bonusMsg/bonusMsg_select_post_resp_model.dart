import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class BonusMsgSelectPostRespModel {
  BonusMsgSelectPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory BonusMsgSelectPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<BonusMsgSelectPostRespModelRecord>? record = jsonRes['record'] is List ? <BonusMsgSelectPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(BonusMsgSelectPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return BonusMsgSelectPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes['summary'] == null
          ? 0
          : asT<int>("summary", jsonRes['summary'])!,
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
  List<BonusMsgSelectPostRespModelRecord> record;
  int summary = 0;
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

class BonusMsgSelectPostRespModelRecord {
  BonusMsgSelectPostRespModelRecord({
    required this.billAmount,
    required this.bonusStatus,
    required this.bonusType,
    required this.bounsAmount,
    required this.businessId,
    required this.businessTime,
    required this.createdAt,
    required this.playerId,
    required this.playerName,
    required this.playerProxyId,
    required this.playerReal,
    required this.playerType,
    required this.reportTime,
  });

  factory BonusMsgSelectPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => BonusMsgSelectPostRespModelRecord(
        billAmount: jsonRes['billAmount'] == null
            ? 0.0
            : asT<double>("billAmount", jsonRes['billAmount'])!,
        bonusStatus: jsonRes['bonusStatus'] == null
            ? 0
            : asT<int>("bonusStatus", jsonRes['bonusStatus'])!,
        bonusType: jsonRes['bonusType'] == null
            ? 0
            : asT<int>("bonusType", jsonRes['bonusType'])!,
        bounsAmount: jsonRes['bounsAmount'] == null
            ? 0.0
            : asT<double>("bounsAmount", jsonRes['bounsAmount'])!,
        businessId: jsonRes['businessId'] == null
            ? ''
            : asT<String>("businessId", jsonRes['businessId'])!,
        businessTime: jsonRes['businessTime'] == null
            ? ''
            : asT<String>("businessTime", jsonRes['businessTime'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        playerId: jsonRes['playerId'] == null
            ? ''
            : asT<String>("playerId", jsonRes['playerId'])!,
        playerName: jsonRes['playerName'] == null
            ? ''
            : asT<String>("playerName", jsonRes['playerName'])!,
        playerProxyId: jsonRes['playerProxyId'] == null
            ? ''
            : asT<String>("playerProxyId", jsonRes['playerProxyId'])!,
        playerReal: jsonRes['playerReal'] == null
            ? ''
            : asT<String>("playerReal", jsonRes['playerReal'])!,
        playerType: jsonRes['playerType'] == null
            ? 0
            : asT<int>("playerType", jsonRes['playerType'])!,
        reportTime: jsonRes['reportTime'] == null
            ? 0
            : asT<int>("reportTime", jsonRes['reportTime'])!,
      );

  double billAmount = 0.0;
  int bonusStatus = 0;
  int bonusType = 0;
  double bounsAmount = 0.0;
  String businessId = '';
  String businessTime = '';
  String createdAt = '';
  String playerId = '';
  String playerName = '';
  String playerProxyId = '';
  String playerReal = '';
  int playerType = 0;
  int reportTime = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'billAmount': billAmount,
        'bonusStatus': bonusStatus,
        'bonusType': bonusType,
        'bounsAmount': bounsAmount,
        'businessId': businessId,
        'businessTime': businessTime,
        'createdAt': createdAt,
        'playerId': playerId,
        'playerName': playerName,
        'playerProxyId': playerProxyId,
        'playerReal': playerReal,
        'playerType': playerType,
        'reportTime': reportTime,
      };
}
