import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerProxyListPostRespModel {
  ProxyLowerProxyListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyLowerProxyListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyLowerProxyListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyLowerProxyListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyLowerProxyListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyLowerProxyListPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? ProxyLowerProxyListPostRespModelSummary.fromJson({})
          : ProxyLowerProxyListPostRespModelSummary.fromJson(
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
  List<ProxyLowerProxyListPostRespModelRecord> record;
  ProxyLowerProxyListPostRespModelSummary summary;
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

class ProxyLowerProxyListPostRespModelRecord {
  ProxyLowerProxyListPostRespModelRecord({
    required this.createDt,
    required this.directlyUnderMemberNum,
    required this.directlyUnderProxyNum,
    required this.id,
    required this.lastLoginTime,
    required this.offLineDays,
    required this.proxyPathUsername,
    required this.registerType,
    required this.totalFirstDepositNum,
    required this.underMemberNum,
    required this.underProxyNum,
    required this.userName,
  });

  factory ProxyLowerProxyListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? proxyPathUsername =
        jsonRes['proxyPathUsername'] is List ? <String>[] : null;
    if (proxyPathUsername != null) {
      for (final dynamic item in jsonRes['proxyPathUsername']!) {
        if (item != null) {
          proxyPathUsername.add(asT<String>("proxyPathUsername", item)!);
        }
      }
    }
    return ProxyLowerProxyListPostRespModelRecord(
      createDt: jsonRes['createDt'] == null
          ? ''
          : asT<String>("createDt", jsonRes['createDt'])!,
      directlyUnderMemberNum: jsonRes['directlyUnderMemberNum'] == null
          ? 0
          : asT<int>(
              "directlyUnderMemberNum", jsonRes['directlyUnderMemberNum'])!,
      directlyUnderProxyNum: jsonRes['directlyUnderProxyNum'] == null
          ? 0
          : asT<int>(
              "directlyUnderProxyNum", jsonRes['directlyUnderProxyNum'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      lastLoginTime: jsonRes['lastLoginTime'] == null
          ? ''
          : asT<String>("lastLoginTime", jsonRes['lastLoginTime'])!,
      offLineDays: jsonRes['offLineDays'] == null
          ? 0
          : asT<int>("offLineDays", jsonRes['offLineDays'])!,
      proxyPathUsername: proxyPathUsername == null ? [] : proxyPathUsername,
      registerType: jsonRes['registerType'] == null
          ? 0
          : asT<int>("registerType", jsonRes['registerType'])!,
      totalFirstDepositNum: jsonRes['totalFirstDepositNum'] == null
          ? 0
          : asT<int>("totalFirstDepositNum", jsonRes['totalFirstDepositNum'])!,
      underMemberNum: jsonRes['underMemberNum'] == null
          ? 0
          : asT<int>("underMemberNum", jsonRes['underMemberNum'])!,
      underProxyNum: jsonRes['underProxyNum'] == null
          ? 0
          : asT<int>("underProxyNum", jsonRes['underProxyNum'])!,
      userName: jsonRes['userName'] == null
          ? ''
          : asT<String>("userName", jsonRes['userName'])!,
    );
  }

  String createDt = '';
  int directlyUnderMemberNum = 0;
  int directlyUnderProxyNum = 0;
  String id = '';
  String lastLoginTime = '';
  int offLineDays = 0;
  List<String> proxyPathUsername;
  int registerType = 0;
  int totalFirstDepositNum = 0;
  int underMemberNum = 0;
  int underProxyNum = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createDt': createDt,
        'directlyUnderMemberNum': directlyUnderMemberNum,
        'directlyUnderProxyNum': directlyUnderProxyNum,
        'id': id,
        'lastLoginTime': lastLoginTime,
        'offLineDays': offLineDays,
        'proxyPathUsername': proxyPathUsername,
        'registerType': registerType,
        'totalFirstDepositNum': totalFirstDepositNum,
        'underMemberNum': underMemberNum,
        'underProxyNum': underProxyNum,
        'userName': userName,
      };
}

class ProxyLowerProxyListPostRespModelSummary {
  ProxyLowerProxyListPostRespModelSummary({
    required this.createDt,
    required this.directlyUnderMemberNum,
    required this.directlyUnderProxyNum,
    required this.id,
    required this.lastLoginTime,
    required this.offLineDays,
    required this.proxyPathUsername,
    required this.registerType,
    required this.totalFirstDepositNum,
    required this.underMemberNum,
    required this.underProxyNum,
    required this.userName,
  });

  factory ProxyLowerProxyListPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? proxyPathUsername =
        jsonRes['proxyPathUsername'] is List ? <String>[] : null;
    if (proxyPathUsername != null) {
      for (final dynamic item in jsonRes['proxyPathUsername']!) {
        if (item != null) {
          proxyPathUsername.add(asT<String>("proxyPathUsername", item)!);
        }
      }
    }
    return ProxyLowerProxyListPostRespModelSummary(
      createDt: jsonRes['createDt'] == null
          ? ''
          : asT<String>("createDt", jsonRes['createDt'])!,
      directlyUnderMemberNum: jsonRes['directlyUnderMemberNum'] == null
          ? 0
          : asT<int>(
              "directlyUnderMemberNum", jsonRes['directlyUnderMemberNum'])!,
      directlyUnderProxyNum: jsonRes['directlyUnderProxyNum'] == null
          ? 0
          : asT<int>(
              "directlyUnderProxyNum", jsonRes['directlyUnderProxyNum'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      lastLoginTime: jsonRes['lastLoginTime'] == null
          ? ''
          : asT<String>("lastLoginTime", jsonRes['lastLoginTime'])!,
      offLineDays: jsonRes['offLineDays'] == null
          ? 0
          : asT<int>("offLineDays", jsonRes['offLineDays'])!,
      proxyPathUsername: proxyPathUsername == null ? [] : proxyPathUsername,
      registerType: jsonRes['registerType'] == null
          ? 0
          : asT<int>("registerType", jsonRes['registerType'])!,
      totalFirstDepositNum: jsonRes['totalFirstDepositNum'] == null
          ? 0
          : asT<int>("totalFirstDepositNum", jsonRes['totalFirstDepositNum'])!,
      underMemberNum: jsonRes['underMemberNum'] == null
          ? 0
          : asT<int>("underMemberNum", jsonRes['underMemberNum'])!,
      underProxyNum: jsonRes['underProxyNum'] == null
          ? 0
          : asT<int>("underProxyNum", jsonRes['underProxyNum'])!,
      userName: jsonRes['userName'] == null
          ? ''
          : asT<String>("userName", jsonRes['userName'])!,
    );
  }

  String createDt = '';
  int directlyUnderMemberNum = 0;
  int directlyUnderProxyNum = 0;
  String id = '';
  String lastLoginTime = '';
  int offLineDays = 0;
  List<String> proxyPathUsername;
  int registerType = 0;
  int totalFirstDepositNum = 0;
  int underMemberNum = 0;
  int underProxyNum = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createDt': createDt,
        'directlyUnderMemberNum': directlyUnderMemberNum,
        'directlyUnderProxyNum': directlyUnderProxyNum,
        'id': id,
        'lastLoginTime': lastLoginTime,
        'offLineDays': offLineDays,
        'proxyPathUsername': proxyPathUsername,
        'registerType': registerType,
        'totalFirstDepositNum': totalFirstDepositNum,
        'underMemberNum': underMemberNum,
        'underProxyNum': underProxyNum,
        'userName': userName,
      };
}
