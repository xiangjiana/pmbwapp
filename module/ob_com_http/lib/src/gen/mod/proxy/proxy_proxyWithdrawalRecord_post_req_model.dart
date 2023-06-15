import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyWithdrawalRecordPostReqModel {
  ProxyProxyWithdrawalRecordPostReqModel({
    required this.createdAtEnd,
    required this.createdAtStart,
    required this.eventId,
    required this.orderStatus,
    required this.pageNum,
    required this.pageSize,
    required this.withdrawType,
  });

  factory ProxyProxyWithdrawalRecordPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyWithdrawalRecordPostReqModel(
        createdAtEnd: jsonRes['createdAtEnd'] == null
            ? ''
            : asT<String>("createdAtEnd", jsonRes['createdAtEnd'])!,
        createdAtStart: jsonRes['createdAtStart'] == null
            ? ''
            : asT<String>("createdAtStart", jsonRes['createdAtStart'])!,
        eventId: jsonRes['eventId'] == null
            ? ''
            : asT<String>("eventId", jsonRes['eventId'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        withdrawType: jsonRes['withdrawType'] == null
            ? ''
            : asT<String>("withdrawType", jsonRes['withdrawType'])!,
      );

  String createdAtEnd = '';
  String createdAtStart = '';
  String eventId = '';
  int orderStatus = 0;
  int pageNum = 0;
  int pageSize = 0;
  String withdrawType = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAtEnd': createdAtEnd,
        'createdAtStart': createdAtStart,
        'eventId': eventId,
        'orderStatus': orderStatus,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'withdrawType': withdrawType,
      };
}
