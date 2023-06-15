import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerProxyCurProxyPostRespModel {
  ProxyLowerProxyCurProxyPostRespModel({
    required this.createDt,
    required this.directlyUnderMemberNum,
    required this.directlyUnderProxyNum,
    required this.id,
    required this.lastLoginTime,
    required this.offLineDays,
    required this.proxyPathName,
    required this.registerType,
    required this.underMemberNum,
    required this.underProxyNum,
    required this.userName,
  });

  factory ProxyLowerProxyCurProxyPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyLowerProxyCurProxyPostRespModel(
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
        proxyPathName: jsonRes['proxyPathName'] == null
            ? ''
            : asT<String>("proxyPathName", jsonRes['proxyPathName'])!,
        registerType: jsonRes['registerType'] == null
            ? 0
            : asT<int>("registerType", jsonRes['registerType'])!,
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

  String createDt = '';
  int directlyUnderMemberNum = 0;
  int directlyUnderProxyNum = 0;
  String id = '';
  String lastLoginTime = '';
  int offLineDays = 0;
  String proxyPathName = '';
  int registerType = 0;
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
        'proxyPathName': proxyPathName,
        'registerType': registerType,
        'underMemberNum': underMemberNum,
        'underProxyNum': underProxyNum,
        'userName': userName,
      };
}
