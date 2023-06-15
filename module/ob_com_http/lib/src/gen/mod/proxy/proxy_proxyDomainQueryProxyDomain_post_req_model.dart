import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyDomainQueryProxyDomainPostReqModel {
  ProxyProxyDomainQueryProxyDomainPostReqModel({
    required this.domainType,
    required this.pageNum,
    required this.pageSize,
  });

  factory ProxyProxyDomainQueryProxyDomainPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyDomainQueryProxyDomainPostReqModel(
        domainType: jsonRes['domainType'] == null
            ? 0
            : asT<int>("domainType", jsonRes['domainType'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
      );

  int domainType = 0;
  int pageNum = 0;
  int pageSize = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'domainType': domainType,
        'pageNum': pageNum,
        'pageSize': pageSize,
      };
}
