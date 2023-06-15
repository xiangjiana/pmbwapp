import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyProxyInfoPostRespModel {
  ProxyProxyProxyInfoPostRespModel({
    required this.accountType,
    required this.commissionBalance,
    required this.contractModel,
    required this.createAt,
    required this.flyGram,
    required this.headImgUrl,
    required this.maxLevels,
    required this.parentProxyId,
    required this.payPasswordFlag,
    required this.proxyId,
    required this.proxyLevelId,
    required this.proxyName,
    required this.qq,
    required this.quotaBalance,
    required this.signContractType,
    required this.unReadMsgCount,
    required this.unReceiveRebateCount,
    required this.rebatePolicyTypeId,
    required this.commissionPolicyTypeId,
    required this.rebateContractId,
    required this.commissionContractId,
  });

  factory ProxyProxyProxyInfoPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyProxyInfoPostRespModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        commissionBalance: jsonRes['commissionBalance'] == null
            ? 0.0
            : asT<double>("commissionBalance", jsonRes['commissionBalance'])!,
        contractModel: jsonRes['contractModel'] == null
            ? 0
            : asT<int>("contractModel", jsonRes['contractModel'])!,
        createAt: jsonRes['createAt'] == null
            ? ''
            : asT<String>("createAt", jsonRes['createAt'])!,
        flyGram: jsonRes['flyGram'] == null
            ? ''
            : asT<String>("flyGram", jsonRes['flyGram'])!,
        headImgUrl: jsonRes['headImgUrl'] == null
            ? ''
            : asT<String>("headImgUrl", jsonRes['headImgUrl'])!,
        maxLevels: jsonRes['maxLevels'] == null
            ? 0
            : asT<int>("maxLevels", jsonRes['maxLevels'])!,
        parentProxyId: jsonRes['parentProxyId'] == null
            ? 0
            : asT<int>("parentProxyId", jsonRes['parentProxyId'])!,
        payPasswordFlag: jsonRes['payPasswordFlag'] == null
            ? 0
            : asT<int>("payPasswordFlag", jsonRes['payPasswordFlag'])!,
        proxyId: jsonRes['proxyId'] == null
            ? 0
            : asT<int>("proxyId", jsonRes['proxyId'])!,
        proxyLevelId: jsonRes['proxyLevelId'] == null
            ? 0
            : asT<int>("proxyLevelId", jsonRes['proxyLevelId'])!,
        proxyName: jsonRes['proxyName'] == null
            ? ''
            : asT<String>("proxyName", jsonRes['proxyName'])!,
        qq: jsonRes['qq'] == null ? '' : asT<String>("qq", jsonRes['qq'])!,
        quotaBalance: jsonRes['quotaBalance'] == null
            ? 0.0
            : asT<double>("quotaBalance", jsonRes['quotaBalance'])!,
        signContractType: jsonRes['signContractType'] == null
            ? 0
            : asT<int>("signContractType", jsonRes['signContractType'])!,
        unReadMsgCount: jsonRes['unReadMsgCount'] == null
            ? 0
            : asT<int>("unReadMsgCount", jsonRes['unReadMsgCount'])!,
        unReceiveRebateCount: jsonRes['unReceiveRebateCount'] == null
            ? 0
            : asT<int>(
                "unReceiveRebateCount", jsonRes['unReceiveRebateCount'])!,
        rebatePolicyTypeId: jsonRes['rebatePolicyTypeId'] == null
            ? 0
            : asT<int>("rebatePolicyTypeId", jsonRes['rebatePolicyTypeId'])!,
        commissionPolicyTypeId: jsonRes['commissionPolicyTypeId'] == null
            ? 0
            : asT<int>(
                "commissionPolicyTypeId", jsonRes['commissionPolicyTypeId'])!,
        rebateContractId: jsonRes['rebateContractId'] == null
            ? '0'
            : asT<String>("rebateContractId", jsonRes['rebateContractId'])!,
        commissionContractId: jsonRes['commissionContractId'] == null
            ? '0'
            : asT<String>(
                "commissionContractId", jsonRes['commissionContractId'])!,
      );

  int accountType = 0;
  double commissionBalance = 0.0;
  int contractModel = 0;
  String createAt = '';
  String flyGram = '';
  String headImgUrl = '';
  int maxLevels = 0;
  int parentProxyId = 0;
  int payPasswordFlag = 0;
  int proxyId = 0;
  int proxyLevelId = 0;
  String proxyName = '';
  String qq = '';
  double quotaBalance = 0.0;
  int signContractType = 0;
  int unReadMsgCount = 0;
  int unReceiveRebateCount = 0;
  int rebatePolicyTypeId = 0;
  int commissionPolicyTypeId = 0;
  String rebateContractId = '0';
  String commissionContractId = '0';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'commissionBalance': commissionBalance,
        'contractModel': contractModel,
        'createAt': createAt,
        'flyGram': flyGram,
        'headImgUrl': headImgUrl,
        'maxLevels': maxLevels,
        'parentProxyId': parentProxyId,
        'payPasswordFlag': payPasswordFlag,
        'proxyId': proxyId,
        'proxyLevelId': proxyLevelId,
        'proxyName': proxyName,
        'qq': qq,
        'quotaBalance': quotaBalance,
        'signContractType': signContractType,
        'unReadMsgCount': unReadMsgCount,
        'unReceiveRebateCount': unReceiveRebateCount,
        'rebatePolicyTypeId': rebatePolicyTypeId,
        'commissionPolicyTypeId': commissionPolicyTypeId,
        'rebateContractId': rebateContractId,
        'commissionContractId': commissionContractId,
      };
}
