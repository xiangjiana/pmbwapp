import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerSettingUpdatePostReqModel {
  ProxySystem2BankerSettingUpdatePostReqModel({
    required this.autoOrderOnStatus,
    required this.byTransferStatus,
    required this.cpTransferStatus,
    required this.djTransferPlay,
    required this.djTransferStatus,
    required this.dyTransferStatus,
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

  factory ProxySystem2BankerSettingUpdatePostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList>? settingMemberList =
        jsonRes['settingMemberList'] is List ? <ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList>[] : null;
    if (settingMemberList != null) {
      for (final dynamic item in jsonRes['settingMemberList']!) {
        if (item != null) {
          settingMemberList.add(ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList.fromJson(
              asT<Map<String, dynamic>>("settingMemberList", item)!));
        }
      }
    }
    return ProxySystem2BankerSettingUpdatePostReqModel(
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
          ? 0
          : asT<int>("djTransferPlay", jsonRes['djTransferPlay'])!,
      djTransferStatus: jsonRes['djTransferStatus'] == null
          ? 0
          : asT<int>("djTransferStatus", jsonRes['djTransferStatus'])!,
      dyTransferStatus: jsonRes['dyTransferStatus'] == null
          ? 0
          : asT<int>("dyTransferStatus", jsonRes['dyTransferStatus'])!,
      maxWinAmount: jsonRes['maxWinAmount'] == null
          ? 0
          : asT<int>("maxWinAmount", jsonRes['maxWinAmount'])!,
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
          : asT<int>("oddsRangeEndValue", jsonRes['oddsRangeEndValue'])!,
      oddsRangeOnStatus: jsonRes['oddsRangeOnStatus'] == null
          ? 0
          : asT<int>("oddsRangeOnStatus", jsonRes['oddsRangeOnStatus'])!,
      oddsRangeStartValue: jsonRes['oddsRangeStartValue'] == null
          ? 0
          : asT<int>("oddsRangeStartValue", jsonRes['oddsRangeStartValue'])!,
      qpTransferStatus: jsonRes['qpTransferStatus'] == null
          ? 0
          : asT<int>("qpTransferStatus", jsonRes['qpTransferStatus'])!,
      settingMemberList: settingMemberList == null ? [] : settingMemberList,
      tyTransferPlay: jsonRes['tyTransferPlay'] == null
          ? 0
          : asT<int>("tyTransferPlay", jsonRes['tyTransferPlay'])!,
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
  int djTransferPlay = 0;
  int djTransferStatus = 0;
  int dyTransferStatus = 0;
  int maxWinAmount = 0;
  String maxWinEffectiveVenue = '';
  int maxWinOnStatus = 0;
  String oddsRangeEffectiveVenue = '';
  int oddsRangeEndValue = 0;
  int oddsRangeOnStatus = 0;
  int oddsRangeStartValue = 0;
  int qpTransferStatus = 0;
  List<ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList> settingMemberList;
  int tyTransferPlay = 0;
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

class ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList {
  ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList({
    required this.memberId,
    required this.memberName,
    required this.proxyName,
    required this.vipSerialNum,
  });

  factory ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxySystem2BankerSettingUpdatePostReqModel_SettingMemberList(
        memberId: jsonRes['memberId'] == null
            ? ''
            : asT<String>("memberId", jsonRes['memberId'])!,
        memberName: jsonRes['memberName'] == null
            ? ''
            : asT<String>("memberName", jsonRes['memberName'])!,
        proxyName: jsonRes['proxyName'] == null
            ? 0
            : asT<int>("proxyName", jsonRes['proxyName'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? 0
            : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
      );

  String memberId = '';
  String memberName = '';
  int proxyName = 0;
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
