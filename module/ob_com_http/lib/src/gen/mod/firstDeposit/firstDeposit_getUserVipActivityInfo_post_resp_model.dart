import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class FirstDepositGetUserVipActivityInfoPostRespModel {
  FirstDepositGetUserVipActivityInfoPostRespModel({
    required this.activityId,
    required this.activityName,
    required this.activityStatus,
    required this.approveTime,
    required this.gameName,
    required this.merchantId,
    required this.undoneBillAmount,
    required this.userId,
    required this.vipSerialNum,
  });

  factory FirstDepositGetUserVipActivityInfoPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      FirstDepositGetUserVipActivityInfoPostRespModel(
        activityId: jsonRes['activityId'] == null
            ? 0
            : asT<int>("activityId", jsonRes['activityId'])!,
        activityName: jsonRes['activityName'] == null
            ? ''
            : asT<String>("activityName", jsonRes['activityName'])!,
        activityStatus: jsonRes['activityStatus'] == null
            ? 0
            : asT<int>("activityStatus", jsonRes['activityStatus'])!,
        approveTime: jsonRes['approveTime'] == null
            ? ''
            : asT<String>("approveTime", jsonRes['approveTime'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        undoneBillAmount: jsonRes['undoneBillAmount'] == null
            ? 0.0
            : asT<double>("undoneBillAmount", jsonRes['undoneBillAmount'])!,
        userId: jsonRes['userId'] == null
            ? 0
            : asT<int>("userId", jsonRes['userId'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? 0
            : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
      );

  int activityId = 0;
  String activityName = '';
  int activityStatus = 0;
  String approveTime = '';
  String gameName = '';
  int merchantId = 0;
  double undoneBillAmount = 0.0;
  int userId = 0;
  int vipSerialNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityId': activityId,
        'activityName': activityName,
        'activityStatus': activityStatus,
        'approveTime': approveTime,
        'gameName': gameName,
        'merchantId': merchantId,
        'undoneBillAmount': undoneBillAmount,
        'userId': userId,
        'vipSerialNum': vipSerialNum,
      };
}
