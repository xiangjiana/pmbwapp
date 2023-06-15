import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractMyContractPostRespModel {
  ProxyProxyContractMyContractPostRespModel({
    required this.data,
  });

  factory ProxyProxyContractMyContractPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractMyContractPostRespModelData>? data = jsonRes['data'] is List ? <ProxyProxyContractMyContractPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyProxyContractMyContractPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyProxyContractMyContractPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyProxyContractMyContractPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyProxyContractMyContractPostRespModelData {
  ProxyProxyContractMyContractPostRespModelData({
    required this.accountType,
    required this.beginRate,
    required this.contractDetailRespList,
    required this.contractStatus,
    required this.contractType,
    required this.createDt,
    required this.dataSources,
    required this.effectStatus,
    required this.endRate,
    required this.id,
    required this.proxyType,
    required this.signDt,
    required this.signProxyName,
    required this.topImagesUrl,
  });

  factory ProxyProxyContractMyContractPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<ProxyProxyContractMyContractPostRespModelContractDetailRespList>? contractDetailRespList =
        jsonRes['contractDetailRespList'] is List
            ? <ProxyProxyContractMyContractPostRespModelContractDetailRespList>[]
            : null;
    if (contractDetailRespList != null) {
      for (final dynamic item in jsonRes['contractDetailRespList']!) {
        if (item != null) {
          contractDetailRespList.add(ProxyProxyContractMyContractPostRespModelContractDetailRespList.fromJson(
              asT<Map<String, dynamic>>("contractDetailRespList", item)!));
        }
      }
    }
    return ProxyProxyContractMyContractPostRespModelData(
      accountType: jsonRes['accountType'] == null
          ? 0
          : asT<int>("accountType", jsonRes['accountType'])!,
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
      proxyType: jsonRes['proxyType'] == null
          ? 0
          : asT<int>("proxyType", jsonRes['proxyType'])!,
      signDt: jsonRes['signDt'] == null
          ? ''
          : asT<String>("signDt", jsonRes['signDt'])!,
      signProxyName: jsonRes['signProxyName'] == null
          ? ''
          : asT<String>("signProxyName", jsonRes['signProxyName'])!,
      topImagesUrl: jsonRes['topImagesUrl'] == null
          ? ''
          : asT<String>("topImagesUrl", jsonRes['topImagesUrl'])!,
    );
  }

  int accountType = 0;
  double beginRate = 0.0;
  List<ProxyProxyContractMyContractPostRespModelContractDetailRespList> contractDetailRespList;
  int contractStatus = 0;
  int contractType = 0;
  String createDt = '';
  int dataSources = 0;
  int effectStatus = 0;
  double endRate = 0.0;
  String id = '';
  int proxyType = 0;
  String signDt = '';
  String signProxyName = '';
  String topImagesUrl = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'beginRate': beginRate,
        'contractDetailRespList': contractDetailRespList,
        'contractStatus': contractStatus,
        'contractType': contractType,
        'createDt': createDt,
        'dataSources': dataSources,
        'effectStatus': effectStatus,
        'endRate': endRate,
        'id': id,
        'proxyType': proxyType,
        'signDt': signDt,
        'signProxyName': signProxyName,
        'topImagesUrl': topImagesUrl,
      };
}

class ProxyProxyContractMyContractPostRespModelContractDetailRespList {
  ProxyProxyContractMyContractPostRespModelContractDetailRespList({
    required this.gameFlow,
    required this.gameLoss,
    required this.id,
    required this.monthActiveCount,
    required this.monthAddActiveCount,
    required this.monthEffectiveActiveCount,
    required this.rebateRatio,
  });

  factory ProxyProxyContractMyContractPostRespModelContractDetailRespList.fromJson(Map<String, dynamic> jsonRes) =>
      ProxyProxyContractMyContractPostRespModelContractDetailRespList(
        gameFlow: jsonRes['gameFlow'] == null
            ? 0.0
            : asT<double>("gameFlow", jsonRes['gameFlow'])!,
        gameLoss: jsonRes['gameLoss'] == null
            ? 0.0
            : asT<double>("gameLoss", jsonRes['gameLoss'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
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
        'monthActiveCount': monthActiveCount,
        'monthAddActiveCount': monthAddActiveCount,
        'monthEffectiveActiveCount': monthEffectiveActiveCount,
        'rebateRatio': rebateRatio,
      };
}
