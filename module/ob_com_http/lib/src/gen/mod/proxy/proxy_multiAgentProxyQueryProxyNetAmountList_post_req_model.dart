import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentProxyQueryProxyNetAmountListPostReqModel {
  ProxyMultiAgentProxyQueryProxyNetAmountListPostReqModel({
    required this.pageNum,
    required this.pageSize,
    required this.proxyName,
    required this.sortType,
    required this.staticDate,
    required this.staticDateType,
  });

  factory ProxyMultiAgentProxyQueryProxyNetAmountListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyMultiAgentProxyQueryProxyNetAmountListPostReqModel(
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        proxyName: jsonRes['proxyName'] == null
            ? ''
            : asT<String>("proxyName", jsonRes['proxyName'])!,
        sortType: jsonRes['sortType'] == null
            ? 0
            : asT<int>("sortType", jsonRes['sortType'])!,
        staticDate: jsonRes['staticDate'] == null
            ? 0
            : asT<int>("staticDate", jsonRes['staticDate'])!,
        staticDateType: jsonRes['staticDateType'] == null
            ? 0
            : asT<int>("staticDateType", jsonRes['staticDateType'])!,
      );

  int pageNum = 0;
  int pageSize = 0;
  String proxyName = '';
  int sortType = 0;
  int staticDate = 0;
  int staticDateType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'proxyName': proxyName,
        'sortType': sortType,
        'staticDate': staticDate,
        'staticDateType': staticDateType,
      };
}
