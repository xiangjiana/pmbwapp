import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class GameRecordAllParam {
  GameRecordAllParam({
    required this.endTime,
    required this.obBetStatus,
    required this.startTime,
  });

  final String endTime;
  final int obBetStatus;
  final String startTime;
}
