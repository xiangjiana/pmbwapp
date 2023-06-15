import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class GameCodeRecordParam {
  GameCodeRecordParam({
    required this.endTime,
    required this.gameCode,
    required this.obBetStatus,
    required this.startTime,
  });

  final String endTime;
  final String gameCode;
  final int obBetStatus;
  final String startTime;
}
