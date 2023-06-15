import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class StillBillAmount {
  StillBillAmount({
    required this.allowWithdraw,
    required this.calTime,
    required this.completeAmount,
    required this.differentAmount,
    required this.validAmount,
  }); 

  final bool allowWithdraw;
  final String calTime;
  final num completeAmount;
  final num differentAmount;
  final num validAmount;
}
