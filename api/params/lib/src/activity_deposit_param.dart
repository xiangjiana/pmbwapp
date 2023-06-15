import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ActivityDepositReqParam {
  ActivityDepositReqParam({
    required this.activityId,
    required this.activityType,
    required this.amount,
    required this.deviceNo,
    required this.gameCode,
    required this.vipSerialNum,
  });

  final String activityId;
  final int activityType;
  final String amount;
  final String deviceNo;
  final String gameCode;
  final int vipSerialNum;
}
