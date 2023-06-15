import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberWithdrawAble {
  MemberWithdrawAble({
    required this.bankCardMaxAmount,
    required this.bankCardMinAmount,
    required this.dateNum,
    required this.dateWithdrawAbleAmount,
    required this.isWithdrawalByBank,
    required this.virtualCardMaxAmount,
    required this.virtualCardMinAmount,
  });

  final double bankCardMaxAmount;
  final double bankCardMinAmount;
  final int dateNum;
  final double dateWithdrawAbleAmount;
  final int isWithdrawalByBank;
  final double virtualCardMaxAmount;
  final double virtualCardMinAmount;
}
