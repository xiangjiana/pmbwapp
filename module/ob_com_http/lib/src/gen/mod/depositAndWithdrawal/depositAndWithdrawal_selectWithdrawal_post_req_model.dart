import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DepositAndWithdrawalSelectWithdrawalPostReqModel {
  DepositAndWithdrawalSelectWithdrawalPostReqModel({
    required this.appStatus,
    required this.bizType,
    required this.clientStatus,
    required this.createdAtEnd,
    required this.createdAtStart,
    required this.pageNum,
    required this.pageSize,
    required this.withdrawType,
  });

  factory DepositAndWithdrawalSelectWithdrawalPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      DepositAndWithdrawalSelectWithdrawalPostReqModel(
        appStatus: jsonRes['appStatus'] == null
            ? 0
            : asT<int>("appStatus", jsonRes['appStatus'])!,
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        clientStatus: jsonRes['clientStatus'] == null
            ? 0
            : asT<int>("clientStatus", jsonRes['clientStatus'])!,
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
        withdrawType: jsonRes['withdrawType'] == null
            ? 0
            : asT<int>("withdrawType", jsonRes['withdrawType'])!,
      );

  int appStatus = 0;
  int bizType = 0;
  int clientStatus = 0;
  String createdAtEnd = '';
  String createdAtStart = '';
  int pageNum = 0;
  int pageSize = 0;
  int withdrawType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appStatus': appStatus,
        'bizType': bizType,
        'clientStatus': clientStatus,
        'createdAtEnd': createdAtEnd,
        'createdAtStart': createdAtStart,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'withdrawType': withdrawType,
      };
}
