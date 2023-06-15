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
  final int amount;
  final String deviceNo;
  final String gameCode;
  final int vipSerialNum;
}
