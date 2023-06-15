import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyRebateDetailPagePostReqModel {
  ProxyRebateDetailPagePostReqModel({
    required this.pageNum,
    required this.pageSize,
    required this.proxyId,
    required this.reportDate,
  });

  factory ProxyRebateDetailPagePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyRebateDetailPagePostReqModel(
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        proxyId: jsonRes['proxyId'] == null
            ? ''
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        reportDate: jsonRes['reportDate'] == null
            ? 0
            : asT<int>("reportDate", jsonRes['reportDate'])!,
      );

  int pageNum = 0;
  int pageSize = 0;
  String proxyId = '';
  int reportDate = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'proxyId': proxyId,
        'reportDate': reportDate,
      };
}
