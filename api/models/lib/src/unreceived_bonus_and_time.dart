import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UnReceivedBonusAndTime {
  UnReceivedBonusAndTime({
    required this.hasReceivedAmount,
    required this.timestamp,
  });

  final int hasReceivedAmount;
  final int timestamp;
}
