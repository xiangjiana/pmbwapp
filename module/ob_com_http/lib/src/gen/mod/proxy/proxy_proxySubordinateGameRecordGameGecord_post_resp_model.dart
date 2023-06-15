import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxySubordinateGameRecordGameGecordPostRespModel {
  ProxyProxySubordinateGameRecordGameGecordPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxySubordinateGameRecordGameGecordPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxySubordinateGameRecordGameGecordPostRespModel(
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
  List<ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord> record;
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

class ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord {
  ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord({
    required this.betStatus,
    required this.createAt,
    required this.gameTypeName,
    required this.id,
    required this.memberName,
    required this.netAmount,
    required this.validBetAmount,
    required this.venueName,
  });

  factory ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxySubordinateGameRecordGameGecordPostRespModelRecord(
        betStatus: jsonRes['betStatus'] == null
            ? 0
            : asT<int>("betStatus", jsonRes['betStatus'])!,
        createAt: jsonRes['createAt'] == null
            ? ''
            : asT<String>("createAt", jsonRes['createAt'])!,
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
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
        venueName: jsonRes['venueName'] == null
            ? ''
            : asT<String>("venueName", jsonRes['venueName'])!,
      );

  int betStatus = 0;
  String createAt = '';
  String gameTypeName = '';
  String id = '';
  String memberName = '';
  double netAmount = 0.0;
  double validBetAmount = 0.0;
  String venueName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betStatus': betStatus,
        'createAt': createAt,
        'gameTypeName': gameTypeName,
        'id': id,
        'memberName': memberName,
        'netAmount': netAmount,
        'validBetAmount': validBetAmount,
        'venueName': venueName,
      };
}
