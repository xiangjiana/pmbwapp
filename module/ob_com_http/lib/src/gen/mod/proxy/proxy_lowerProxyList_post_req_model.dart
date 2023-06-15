import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerProxyListPostReqModel {
  ProxyLowerProxyListPostReqModel({
    required this.orderType,
    required this.pageNum,
    required this.pageSize,
    required this.uerName,
  });

  factory ProxyLowerProxyListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyLowerProxyListPostReqModel(
        orderType: jsonRes['orderType'] == null
            ? 0
            : asT<int>("orderType", jsonRes['orderType'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        uerName: jsonRes['uerName'] == null
            ? ''
            : asT<String>("uerName", jsonRes['uerName'])!,
      );

  int orderType = 0;
  int pageNum = 0;
  int pageSize = 0;
  String uerName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderType': orderType,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'uerName': uerName,
      };
}
