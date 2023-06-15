import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserActivityInfo {
  UserActivityInfo({
    this.activityId,
    this.activityName,
    this.activityStatus,
    this.approveTime,
    this.gameName,
    this.merchantId,
    this.undoneBillAmount,
    this.userId,
    this.vipSerialNum,
  });

  int? activityId;
  String? activityName;
  int? activityStatus;
  String? approveTime;
  String? gameName;
  int? merchantId;
  num? undoneBillAmount;
  int? userId;
  int? vipSerialNum;
}
