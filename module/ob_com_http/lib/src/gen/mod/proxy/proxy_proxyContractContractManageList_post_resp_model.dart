import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractContractManageListPostRespModel {
  ProxyProxyContractContractManageListPostRespModel({
    required this.data,
  });

  factory ProxyProxyContractContractManageListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractContractManageListPostRespModelData>? data = jsonRes['data'] is List ? <ProxyProxyContractContractManageListPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyProxyContractContractManageListPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyProxyContractContractManageListPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyProxyContractContractManageListPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyProxyContractContractManageListPostRespModelData {
  ProxyProxyContractContractManageListPostRespModelData({
    required this.accountType,
    required this.backNote,
    required this.beginRate,
    required this.contractDetailRespList,
    required this.contractStatus,
    required this.contractType,
    required this.createAccount,
    required this.createDt,
    required this.dataSources,
    required this.effectStatus,
    required this.endRate,
    required this.id,
    required this.parentProxyId,
    required this.parentProxyName,
    required this.proxyType,
    required this.sginType,
    required this.signDt,
    required this.signProxyId,
    required this.signProxyLevel,
    required this.signProxyLevelId,
    required this.signProxyName,
    required this.topImagesUrl,
  });

  factory ProxyProxyContractContractManageListPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractContractManageListPostRespModelContractDetailRespList>? contractDetailRespList =
        jsonRes['contractDetailRespList'] is List
            ? <ProxyProxyContractContractManageListPostRespModelContractDetailRespList>[]
            : null;
    if (contractDetailRespList != null) {
      for (final dynamic item in jsonRes['contractDetailRespList']!) {
        if (item != null) {
          contractDetailRespList.add(ProxyProxyContractContractManageListPostRespModelContractDetailRespList.fromJson(
              asT<Map<String, dynamic>>("contractDetailRespList", item)!));
        }
      }
    }
    return ProxyProxyContractContractManageListPostRespModelData(
      accountType: jsonRes['accountType'] == null
          ? 0
          : asT<int>("accountType", jsonRes['accountType'])!,
      backNote: jsonRes['backNote'] == null
          ? ''
          : asT<String>("backNote", jsonRes['backNote'])!,
      beginRate: jsonRes['beginRate'] == null
          ? 0.0
          : asT<double>("beginRate", jsonRes['beginRate'])!,
      contractDetailRespList:
          contractDetailRespList == null ? [] : contractDetailRespList,
      contractStatus: jsonRes['contractStatus'] == null
          ? 0
          : asT<int>("contractStatus", jsonRes['contractStatus'])!,
      contractType: jsonRes['contractType'] == null
          ? 0
          : asT<int>("contractType", jsonRes['contractType'])!,
      createAccount: jsonRes['createAccount'] == null
          ? ''
          : asT<String>("createAccount", jsonRes['createAccount'])!,
      createDt: jsonRes['createDt'] == null
          ? ''
          : asT<String>("createDt", jsonRes['createDt'])!,
      dataSources: jsonRes['dataSources'] == null
          ? 0
          : asT<int>("dataSources", jsonRes['dataSources'])!,
      effectStatus: jsonRes['effectStatus'] == null
          ? 0
          : asT<int>("effectStatus", jsonRes['effectStatus'])!,
      endRate: jsonRes['endRate'] == null
          ? 0.0
          : asT<double>("endRate", jsonRes['endRate'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      parentProxyId: jsonRes['parentProxyId'] == null
          ? ''
          : asT<String>("parentProxyId", jsonRes['parentProxyId'])!,
      parentProxyName: jsonRes['parentProxyName'] == null
          ? ''
          : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
      proxyType: jsonRes['proxyType'] == null
          ? 0
          : asT<int>("proxyType", jsonRes['proxyType'])!,
      sginType: jsonRes['sginType'] == null
          ? 0
          : asT<int>("sginType", jsonRes['sginType'])!,
      signDt: jsonRes['signDt'] == null
          ? ''
          : asT<String>("signDt", jsonRes['signDt'])!,
      signProxyId: jsonRes['signProxyId'] == null
          ? ''
          : asT<String>("signProxyId", jsonRes['signProxyId'])!,
      signProxyLevel: jsonRes['signProxyLevel'] == null
          ? 0
          : asT<int>("signProxyLevel", jsonRes['signProxyLevel'])!,
      signProxyLevelId: jsonRes['signProxyLevelId'] == null
          ? ''
          : asT<String>("signProxyLevelId", jsonRes['signProxyLevelId'])!,
      signProxyName: jsonRes['signProxyName'] == null
          ? ''
          : asT<String>("signProxyName", jsonRes['signProxyName'])!,
      topImagesUrl: jsonRes['topImagesUrl'] == null
          ? ''
          : asT<String>("topImagesUrl", jsonRes['topImagesUrl'])!,
    );
  }

  int accountType = 0;
  String backNote = '';
  double beginRate = 0.0;
  List<ProxyProxyContractContractManageListPostRespModelContractDetailRespList> contractDetailRespList;
  int contractStatus = 0;
  int contractType = 0;
  String createAccount = '';
  String createDt = '';
  int dataSources = 0;
  int effectStatus = 0;
  double endRate = 0.0;
  String id = '';
  String parentProxyId = '';
  String parentProxyName = '';
  int proxyType = 0;
  int sginType = 0;
  String signDt = '';
  String signProxyId = '';
  int signProxyLevel = 0;
  String signProxyLevelId = '';
  String signProxyName = '';
  String topImagesUrl = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'backNote': backNote,
        'beginRate': beginRate,
        'contractDetailRespList': contractDetailRespList,
        'contractStatus': contractStatus,
        'contractType': contractType,
        'createAccount': createAccount,
        'createDt': createDt,
        'dataSources': dataSources,
        'effectStatus': effectStatus,
        'endRate': endRate,
        'id': id,
        'parentProxyId': parentProxyId,
        'parentProxyName': parentProxyName,
        'proxyType': proxyType,
        'sginType': sginType,
        'signDt': signDt,
        'signProxyId': signProxyId,
        'signProxyLevel': signProxyLevel,
        'signProxyLevelId': signProxyLevelId,
        'signProxyName': signProxyName,
        'topImagesUrl': topImagesUrl,
      };
}

class ProxyProxyContractContractManageListPostRespModelContractDetailRespList {
  ProxyProxyContractContractManageListPostRespModelContractDetailRespList({
    required this.gameFlow,
    required this.gameLoss,
    required this.id,
    required this.level,
    required this.monthActiveCount,
    required this.monthAddActiveCount,
    required this.monthEffectiveActiveCount,
    required this.rebateRatio,
  });

  factory ProxyProxyContractContractManageListPostRespModelContractDetailRespList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyProxyContractContractManageListPostRespModelContractDetailRespList(
        gameFlow: jsonRes['gameFlow'] == null
            ? 0.0
            : asT<double>("gameFlow", jsonRes['gameFlow'])!,
        gameLoss: jsonRes['gameLoss'] == null
            ? 0.0
            : asT<double>("gameLoss", jsonRes['gameLoss'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        level:
            jsonRes['level'] == null ? 0 : asT<int>("level", jsonRes['level'])!,
        monthActiveCount: jsonRes['monthActiveCount'] == null
            ? 0
            : asT<int>("monthActiveCount", jsonRes['monthActiveCount'])!,
        monthAddActiveCount: jsonRes['monthAddActiveCount'] == null
            ? 0
            : asT<int>("monthAddActiveCount", jsonRes['monthAddActiveCount'])!,
        monthEffectiveActiveCount: jsonRes['monthEffectiveActiveCount'] == null
            ? 0
            : asT<int>("monthEffectiveActiveCount",
                jsonRes['monthEffectiveActiveCount'])!,
        rebateRatio: jsonRes['rebateRatio'] == null
            ? 0.0
            : asT<double>("rebateRatio", jsonRes['rebateRatio'])!,
      );

  double gameFlow = 0.0;
  double gameLoss = 0.0;
  String id = '';
  int level = 0;
  int monthActiveCount = 0;
  int monthAddActiveCount = 0;
  int monthEffectiveActiveCount = 0;
  double rebateRatio = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameFlow': gameFlow,
        'gameLoss': gameLoss,
        'id': id,
        'level': level,
        'monthActiveCount': monthActiveCount,
        'monthAddActiveCount': monthAddActiveCount,
        'monthEffectiveActiveCount': monthEffectiveActiveCount,
        'rebateRatio': rebateRatio,
      };
}
