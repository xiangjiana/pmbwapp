import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerMemberGameRecordsPostRespModel {
  ProxyLowerMemberGameRecordsPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyLowerMemberGameRecordsPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyLowerMemberGameRecordsPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyLowerMemberGameRecordsPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyLowerMemberGameRecordsPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyLowerMemberGameRecordsPostRespModel(
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
  List<ProxyLowerMemberGameRecordsPostRespModelRecord> record;
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

class ProxyLowerMemberGameRecordsPostRespModelRecord {
  ProxyLowerMemberGameRecordsPostRespModelRecord({
    required this.betAmount,
    required this.createAt,
    required this.gameCode,
    required this.gameTypeName,
    required this.id,
    required this.memberName,
    required this.netAmount,
    required this.netAt,
    required this.obBetStatus,
    required this.playerName,
    required this.validBetAmount,
    required this.venueName,
  });

  factory ProxyLowerMemberGameRecordsPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyLowerMemberGameRecordsPostRespModelRecord(
        betAmount: jsonRes['betAmount'] == null
            ? 0.0
            : asT<double>("betAmount", jsonRes['betAmount'])!,
        createAt: jsonRes['createAt'] == null
            ? ''
            : asT<String>("createAt", jsonRes['createAt'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        gameTypeName: jsonRes['gameTypeName'] == null
            ? ''
            : asT<String>("gameTypeName", jsonRes['gameTypeName'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        memberName: jsonRes['memberName'] == null
            ? ''
            : asT<String>("memberName", jsonRes['memberName'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        netAt: jsonRes['netAt'] == null
            ? ''
            : asT<String>("netAt", jsonRes['netAt'])!,
        obBetStatus: jsonRes['obBetStatus'] == null
            ? 0
            : asT<int>("obBetStatus", jsonRes['obBetStatus'])!,
        playerName: jsonRes['playerName'] == null
            ? ''
            : asT<String>("playerName", jsonRes['playerName'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
        venueName: jsonRes['venueName'] == null
            ? ''
            : asT<String>("venueName", jsonRes['venueName'])!,
      );

  double betAmount = 0.0;
  String createAt = '';
  String gameCode = '';
  String gameTypeName = '';
  String id = '';
  String memberName = '';
  double netAmount = 0.0;
  String netAt = '';
  int obBetStatus = 0;
  String playerName = '';
  double validBetAmount = 0.0;
  String venueName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'createAt': createAt,
        'gameCode': gameCode,
        'gameTypeName': gameTypeName,
        'id': id,
        'memberName': memberName,
        'netAmount': netAmount,
        'netAt': netAt,
        'obBetStatus': obBetStatus,
        'playerName': playerName,
        'validBetAmount': validBetAmount,
        'venueName': venueName,
      };
}
