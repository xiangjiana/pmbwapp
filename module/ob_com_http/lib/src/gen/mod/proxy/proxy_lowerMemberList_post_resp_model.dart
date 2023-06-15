import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerMemberListPostRespModel {
  ProxyLowerMemberListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyLowerMemberListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyLowerMemberListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyLowerMemberListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyLowerMemberListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyLowerMemberListPostRespModel(
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
  List<ProxyLowerMemberListPostRespModelRecord> record;
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

class ProxyLowerMemberListPostRespModelRecord {
  ProxyLowerMemberListPostRespModelRecord({
    required this.netAmount,
    required this.balance,
    required this.createDt,
    required this.deposit,
    required this.id,
    required this.lastLoginTime,
    required this.parentProxyName,
    required this.proxyPathName,
    required this.userName,
    required this.vipGradeName,
    required this.vipSerialNum,
    required this.withdraw,
  });

  factory ProxyLowerMemberListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyLowerMemberListPostRespModelRecord(
    netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
        balance: jsonRes['balance'] == null
            ? 0.0
            : asT<double>("balance", jsonRes['balance'])!,
        createDt: jsonRes['createDt'] == null
            ? ''
            : asT<String>("createDt", jsonRes['createDt'])!,
        deposit: jsonRes['deposit'] == null
            ? 0.0
            : asT<double>("deposit", jsonRes['deposit'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        lastLoginTime: jsonRes['lastLoginTime'] == null
            ? ''
            : asT<String>("lastLoginTime", jsonRes['lastLoginTime'])!,
        parentProxyName: jsonRes['parentProxyName'] == null
            ? ''
            : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
        proxyPathName: jsonRes['proxyPathName'] == null
            ? ''
            : asT<String>("proxyPathName", jsonRes['proxyPathName'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
        vipGradeName: jsonRes['vipGradeName'] == null
            ? ''
            : asT<String>("vipGradeName", jsonRes['vipGradeName'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? 0
            : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
        withdraw: jsonRes['withdraw'] == null
            ? 0.0
            : asT<double>("withdraw", jsonRes['withdraw'])!,
      );

  double netAmount = 0.0;
  double balance = 0.0;
  String createDt = '';
  double deposit = 0.0;
  String id = '';
  String lastLoginTime = '';
  String parentProxyName = '';
  String proxyPathName = '';
  String userName = '';
  String vipGradeName = '';
  int vipSerialNum = 0;
  double withdraw = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'netAmount': netAmount,
        'balance': balance,
        'createDt': createDt,
        'deposit': deposit,
        'id': id,
        'lastLoginTime': lastLoginTime,
        'parentProxyName': parentProxyName,
        'proxyPathName': proxyPathName,
        'userName': userName,
        'vipGradeName': vipGradeName,
        'vipSerialNum': vipSerialNum,
        'withdraw': withdraw,
      };
}
