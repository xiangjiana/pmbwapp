import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DepositAggByLastWithdrawEs {
  DepositAggByLastWithdrawEs({
    required this.bonusSumAmount,
    required this.depositSumAmount,
    required this.isContinuityWithDraw,
    required this.withdrawWater,
  });

  final num bonusSumAmount;
  final num depositSumAmount;
  final int isContinuityWithDraw;
  final num withdrawWater;
}
