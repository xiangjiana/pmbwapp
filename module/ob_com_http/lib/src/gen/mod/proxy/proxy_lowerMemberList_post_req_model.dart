import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerMemberListPostReqModel {
  ProxyLowerMemberListPostReqModel({
    required this.orderType,
    required this.pageNum,
    required this.pageSize,
    required this.proxyLevel,
    required this.userName,
  });

  factory ProxyLowerMemberListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyLowerMemberListPostReqModel(
        orderType: jsonRes['orderType'] == null
            ? 0
            : asT<int>("orderType", jsonRes['orderType'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        proxyLevel: jsonRes['proxyLevel'] == null
            ? 0
            : asT<int>("proxyLevel", jsonRes['proxyLevel'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  int orderType = 0;
  int pageNum = 0;
  int pageSize = 0;
  int proxyLevel = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderType': orderType,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'proxyLevel': proxyLevel,
        'userName': userName,
      };
}
