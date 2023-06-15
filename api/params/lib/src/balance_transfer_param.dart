import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BalanceTransferParam {
  BalanceTransferParam({
    required this.amount,
    required this.gameCode,
    required this.transferType,
  });

  final String amount;
  final String gameCode;
  final String transferType;
}
