import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyCommissionCommissionHistoryPostReqModel {
  ProxyCommissionCommissionHistoryPostReqModel({
    required this.pageNum,
    required this.pageSize,
    required this.payoutStatus,
    required this.period,
  });

  factory ProxyCommissionCommissionHistoryPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyCommissionCommissionHistoryPostReqModel(
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        payoutStatus: jsonRes['payoutStatus'] == null
            ? 0
            : asT<int>("payoutStatus", jsonRes['payoutStatus'])!,
        period: jsonRes['period'] == null
            ? 0
            : asT<int>("period", jsonRes['period'])!,
      );

  int pageNum = 0;
  int pageSize = 0;
  int payoutStatus = 0;
  int period = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'payoutStatus': payoutStatus,
        'period': period,
      };
}
