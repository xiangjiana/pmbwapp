import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyCommissionCommissionPaymentOrderPostReqModel {
  ProxyCommissionCommissionPaymentOrderPostReqModel({
    required this.directProxyAccount,
    required this.pageNum,
    required this.pageSize,
    required this.period,
    required this.proxyId,
    required this.transStatus,
  });

  factory ProxyCommissionCommissionPaymentOrderPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyCommissionCommissionPaymentOrderPostReqModel(
        directProxyAccount: jsonRes['directProxyAccount'] == null
            ? ''
            : asT<String>("directProxyAccount", jsonRes['directProxyAccount'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        period: jsonRes['period'] == null
            ? 0
            : asT<int>("period", jsonRes['period'])!,
        proxyId: jsonRes['proxyId'] == null
            ? 0
            : asT<int>("proxyId", jsonRes['proxyId'])!,
        transStatus: jsonRes['transStatus'] == null
            ? 0
            : asT<int>("transStatus", jsonRes['transStatus'])!,
      );

  String directProxyAccount = '';
  int pageNum = 0;
  int pageSize = 0;
  int period = 0;
  int proxyId = 0;
  int transStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'directProxyAccount': directProxyAccount,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'period': period,
        'proxyId': proxyId,
        'transStatus': transStatus,
      };
}
