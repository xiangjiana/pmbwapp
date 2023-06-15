import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class CheckActivityParam {
  CheckActivityParam({
    required this.activityId,
    required this.amount,
    required this.clientType,
    required this.gameCode,
  });

  final int activityId;
  final int amount;
  final String clientType;
  final String gameCode;
}
