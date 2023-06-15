import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerSettingQueryPostRespModel {
  ProxySystem2BankerSettingQueryPostRespModel({
    required this.autoOrderOnStatus,
    required this.byTransferStatus,
    required this.cpTransferStatus,
    required this.djTransferPlay,
    required this.djTransferStatus,
    required this.dyTransferStatus,
    required this.effectiveTime,
    required this.maxWinAmount,
    required this.maxWinEffectiveVenue,
    required this.maxWinOnStatus,
    required this.oddsRangeEffectiveVenue,
    required this.oddsRangeEndValue,
    required this.oddsRangeOnStatus,
    required this.oddsRangeStartValue,
    required this.qpTransferStatus,
    required this.settingMemberList,
    required this.tyTransferPlay,
    required this.tyTransferStatus,
    required this.zrTransferStatus,
  });

  factory ProxySystem2BankerSettingQueryPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList>? settingMemberList =
        jsonRes['settingMemberList'] is List ? <ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList>[] : null;
    if (settingMemberList != null) {
      for (final dynamic item in jsonRes['settingMemberList']!) {
        if (item != null) {
          settingMemberList.add(ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList.fromJson(
              asT<Map<String, dynamic>>("settingMemberList", item)!));
        }
      }
    }
    return ProxySystem2BankerSettingQueryPostRespModel(
      autoOrderOnStatus: jsonRes['autoOrderOnStatus'] == null
          ? 0
          : asT<int>("autoOrderOnStatus", jsonRes['autoOrderOnStatus'])!,
      byTransferStatus: jsonRes['byTransferStatus'] == null
          ? 0
          : asT<int>("byTransferStatus", jsonRes['byTransferStatus'])!,
      cpTransferStatus: jsonRes['cpTransferStatus'] == null
          ? 0
          : asT<int>("cpTransferStatus", jsonRes['cpTransferStatus'])!,
      djTransferPlay: jsonRes['djTransferPlay'] == null
          ? ''
          : asT<String>("djTransferPlay", jsonRes['djTransferPlay'])!,
      djTransferStatus: jsonRes['djTransferStatus'] == null
          ? 0
          : asT<int>("djTransferStatus", jsonRes['djTransferStatus'])!,
      dyTransferStatus: jsonRes['dyTransferStatus'] == null
          ? 0
          : asT<int>("dyTransferStatus", jsonRes['dyTransferStatus'])!,
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
          ? 0
          : asT<double>("oddsRangeEndValue", jsonRes['oddsRangeEndValue'])!,
      oddsRangeOnStatus: jsonRes['oddsRangeOnStatus'] == null
          ? 0
          : asT<int>("oddsRangeOnStatus", jsonRes['oddsRangeOnStatus'])!,
      oddsRangeStartValue: jsonRes['oddsRangeStartValue'] == null
          ? 0.0
          : asT<double>("oddsRangeStartValue", jsonRes['oddsRangeStartValue'])!,
      qpTransferStatus: jsonRes['qpTransferStatus'] == null
          ? 0
          : asT<int>("qpTransferStatus", jsonRes['qpTransferStatus'])!,
      settingMemberList: settingMemberList == null ? [] : settingMemberList,
      tyTransferPlay: jsonRes['tyTransferPlay'] == null
          ? ''
          : asT<String>("tyTransferPlay", jsonRes['tyTransferPlay'])!,
      tyTransferStatus: jsonRes['tyTransferStatus'] == null
          ? 0
          : asT<int>("tyTransferStatus", jsonRes['tyTransferStatus'])!,
      zrTransferStatus: jsonRes['zrTransferStatus'] == null
          ? 0
          : asT<int>("zrTransferStatus", jsonRes['zrTransferStatus'])!,
    );
  }

  int autoOrderOnStatus = 0;
  int byTransferStatus = 0;
  int cpTransferStatus = 0;
  String djTransferPlay = '';
  int djTransferStatus = 0;
  int dyTransferStatus = 0;
  String effectiveTime = '';
  double maxWinAmount = 0;
  String maxWinEffectiveVenue = '';
  int maxWinOnStatus = 0;
  String oddsRangeEffectiveVenue = '';
  double oddsRangeEndValue = 0;
  int oddsRangeOnStatus = 0;
  double oddsRangeStartValue = 0;
  int qpTransferStatus = 0;
  List<ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList> settingMemberList;
  String tyTransferPlay = '';
  int tyTransferStatus = 0;
  int zrTransferStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'autoOrderOnStatus': autoOrderOnStatus,
        'byTransferStatus': byTransferStatus,
        'cpTransferStatus': cpTransferStatus,
        'djTransferPlay': djTransferPlay,
        'djTransferStatus': djTransferStatus,
        'dyTransferStatus': dyTransferStatus,
        'effectiveTime': effectiveTime,
        'maxWinAmount': maxWinAmount,
        'maxWinEffectiveVenue': maxWinEffectiveVenue,
        'maxWinOnStatus': maxWinOnStatus,
        'oddsRangeEffectiveVenue': oddsRangeEffectiveVenue,
        'oddsRangeEndValue': oddsRangeEndValue,
        'oddsRangeOnStatus': oddsRangeOnStatus,
        'oddsRangeStartValue': oddsRangeStartValue,
        'qpTransferStatus': qpTransferStatus,
        'settingMemberList': settingMemberList,
        'tyTransferPlay': tyTransferPlay,
        'tyTransferStatus': tyTransferStatus,
        'zrTransferStatus': zrTransferStatus,
      };
}

class ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList {
  ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList({
    required this.memberId,
    required this.memberName,
    required this.proxyName,
    required this.vipSerialNum,
  });

  factory ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxySystem2BankerSettingQueryPostRespModel_SettingMemberList(
        memberId: jsonRes['memberId'] == null
            ? ''
            : asT<String>("memberId", jsonRes['memberId'])!,
        memberName: jsonRes['memberName'] == null
            ? ''
            : asT<String>("memberName", jsonRes['memberName'])!,
        proxyName: jsonRes['proxyName'] == null
            ? ''
            : asT<String>("proxyName", jsonRes['proxyName'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? 0
            : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
      );

  String memberId = '';
  String memberName = '';
  String proxyName = '';
  int vipSerialNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'memberId': memberId,
        'memberName': memberName,
        'proxyName': proxyName,
        'vipSerialNum': vipSerialNum,
      };
}
