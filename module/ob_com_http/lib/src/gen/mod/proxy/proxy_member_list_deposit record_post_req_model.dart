import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMemberListDepositRecordPostReqModel {
  ProxyMemberListDepositRecordPostReqModel({
    required this.createdAtEnd,
    required this.createdAtStart,
    required this.pageNum,
    required this.pageSize,
    required this.payTypes,
    required this.orderStatus,
  });

  factory ProxyMemberListDepositRecordPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? payTypes =
        jsonRes['payTypes'] is List ? <String>[] : null;
    if (payTypes != null) {
      for (final dynamic item in jsonRes['payTypes']!) {
        if (item != null) {
          payTypes.add(asT<String>("payTypes", item)!);
        }
      }
    }
    return ProxyMemberListDepositRecordPostReqModel(
      createdAtEnd: jsonRes['createdAtEnd'] == null
          ? ''
          : asT<String>("createdAtEnd", jsonRes['createdAtEnd'])!,
      createdAtStart: jsonRes['createdAtStart'] == null
          ? ''
          : asT<String>("createdAtStart", jsonRes['createdAtStart'])!,
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      payTypes: payTypes == null ? [] : payTypes,
      orderStatus: jsonRes['orderStatus'] == null
          ? 0
          : asT<int>("orderStatus", jsonRes['orderStatus'])!,
    );
  }

  String createdAtEnd = '';
  String createdAtStart = '';
  int pageNum = 0;
  int pageSize = 0;
  List<String> payTypes;
  int orderStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAtEnd': createdAtEnd,
        'createdAtStart': createdAtStart,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'payTypes': payTypes,
        'orderStatus': orderStatus,
      };
}
