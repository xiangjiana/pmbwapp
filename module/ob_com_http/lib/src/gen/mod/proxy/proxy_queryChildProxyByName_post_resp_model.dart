import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyQueryChildProxyByNamePostRespModel {
  ProxyQueryChildProxyByNamePostRespModel({
    required this.proxyId,
    required this.proxyName,
    required this.parentProxyId,
    required this.accountType,
    required this.headImgUrl,
    required this.createAt,
    required this.commissionBalance,
    required this.unReadMsgCount,
    required this.payPasswordFlag,
    required this.qqFlag,
    required this.flyGramFlag,
  });

  factory ProxyQueryChildProxyByNamePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyQueryChildProxyByNamePostRespModel(
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        proxyName: jsonRes['proxyName'] == null
            ? ''
            : asT<String>("proxyName", jsonRes['proxyName'])!,
        parentProxyId: jsonRes['parentProxyId'] == null
            ? 0
            : asT<int>("parentProxyId", jsonRes['parentProxyId'])!,
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        headImgUrl: jsonRes['headImgUrl'] == null
            ? ''
            : asT<String>("headImgUrl", jsonRes['headImgUrl'])!,
        createAt: jsonRes['createAt'] == null
            ? ''
            : asT<String>("createAt", jsonRes['createAt'])!,
        commissionBalance: jsonRes['commissionBalance'] == null
            ? 0.0
            : asT<double>("commissionBalance", jsonRes['commissionBalance'])!,
        unReadMsgCount: jsonRes['unReadMsgCount'] == null
            ? 0
            : asT<int>("unReadMsgCount", jsonRes['unReadMsgCount'])!,
        payPasswordFlag: jsonRes['payPasswordFlag'] == null
            ? 0
            : asT<int>("payPasswordFlag", jsonRes['payPasswordFlag'])!,
        qqFlag: jsonRes['qqFlag'] == null
            ? 0
            : asT<int>("qqFlag", jsonRes['qqFlag'])!,
        flyGramFlag: jsonRes['flyGramFlag'] == null
            ? 0
            : asT<int>("flyGramFlag", jsonRes['flyGramFlag'])!,
      );

  String proxyId = '';
  String proxyName = '';
  int parentProxyId = 0;
  int accountType = 0;
  String headImgUrl = '';
  String createAt = '';
  double commissionBalance = 0.0;
  int unReadMsgCount = 0;
  int payPasswordFlag = 0;
  int qqFlag = 0;
  int flyGramFlag = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'proxyId': proxyId,
        'proxyName': proxyName,
        'parentProxyId': parentProxyId,
        'accountType': accountType,
        'headImgUrl': headImgUrl,
        'createAt': createAt,
        'commissionBalance': commissionBalance,
        'unReadMsgCount': unReadMsgCount,
        'payPasswordFlag': payPasswordFlag,
        'qqFlag': qqFlag,
        'flyGramFlag': flyGramFlag,
      };
}
