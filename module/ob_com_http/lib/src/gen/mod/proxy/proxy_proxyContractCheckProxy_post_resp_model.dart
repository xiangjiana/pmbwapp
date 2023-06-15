import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractCheckProxyPostRespModel {
  ProxyProxyContractCheckProxyPostRespModel({
    required this.accountType,
    required this.commissionContractId,
    required this.commissionMaxRate,
    required this.contractModel,
    required this.enforceContractStatus,
    required this.id,
    required this.maxLevels,
    required this.ownContractModel,
    required this.parentProxyId,
    required this.parentProxyName,
    required this.proxyLevel,
    required this.proxyLevelId,
    required this.proxyLevelName,
    required this.rebateContractId,
    required this.rebateMaxRate,
    required this.signContractType,
    required this.userName,
  });

  factory ProxyProxyContractCheckProxyPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractCheckProxyPostRespModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        commissionContractId: jsonRes['commissionContractId'] == null
            ? ''
            : asT<String>(
                "commissionContractId", jsonRes['commissionContractId'])!,
        commissionMaxRate: jsonRes['commissionMaxRate'] == null
            ? 0.0
            : asT<double>("commissionMaxRate", jsonRes['commissionMaxRate'])!,
        contractModel: jsonRes['contractModel'] == null
            ? 0
            : asT<int>("contractModel", jsonRes['contractModel'])!,
        enforceContractStatus: jsonRes['enforceContractStatus'] == null
            ? 0
            : asT<int>(
                "enforceContractStatus", jsonRes['enforceContractStatus'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        maxLevels: jsonRes['maxLevels'] == null
            ? 0
            : asT<int>("maxLevels", jsonRes['maxLevels'])!,
        ownContractModel: jsonRes['ownContractModel'] == null
            ? 0
            : asT<int>("ownContractModel", jsonRes['ownContractModel'])!,
        parentProxyId: jsonRes['parentProxyId'] == null
            ? ''
            : asT<String>("parentProxyId", jsonRes['parentProxyId'])!,
        parentProxyName: jsonRes['parentProxyName'] == null
            ? ''
            : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
        proxyLevel: jsonRes['proxyLevel'] == null
            ? 0
            : asT<int>("proxyLevel", jsonRes['proxyLevel'])!,
        proxyLevelId: jsonRes['proxyLevelId'] == null
            ? ''
            : asT<String>("proxyLevelId", jsonRes['proxyLevelId'])!,
        proxyLevelName: jsonRes['proxyLevelName'] == null
            ? ''
            : asT<String>("proxyLevelName", jsonRes['proxyLevelName'])!,
        rebateContractId: jsonRes['rebateContractId'] == null
            ? ''
            : asT<String>("rebateContractId", jsonRes['rebateContractId'])!,
        rebateMaxRate: jsonRes['rebateMaxRate'] == null
            ? 0.0
            : asT<double>("rebateMaxRate", jsonRes['rebateMaxRate'])!,
        signContractType: jsonRes['signContractType'] == null
            ? 0
            : asT<int>("signContractType", jsonRes['signContractType'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  int accountType = 0;
  String commissionContractId = '';
  double commissionMaxRate = 0.0;
  int contractModel = 0;
  int enforceContractStatus = 0;
  String id = '';
  int maxLevels = 0;
  int ownContractModel = 0;
  String parentProxyId = '';
  String parentProxyName = '';
  int proxyLevel = 0;
  String proxyLevelId = '';
  String proxyLevelName = '';
  String rebateContractId = '';
  double rebateMaxRate = 0.0;
  int signContractType = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'commissionContractId': commissionContractId,
        'commissionMaxRate': commissionMaxRate,
        'contractModel': contractModel,
        'enforceContractStatus': enforceContractStatus,
        'id': id,
        'maxLevels': maxLevels,
        'ownContractModel': ownContractModel,
        'parentProxyId': parentProxyId,
        'parentProxyName': parentProxyName,
        'proxyLevel': proxyLevel,
        'proxyLevelId': proxyLevelId,
        'proxyLevelName': proxyLevelName,
        'rebateContractId': rebateContractId,
        'rebateMaxRate': rebateMaxRate,
        'signContractType': signContractType,
        'userName': userName,
      };
}
