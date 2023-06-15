
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class GameRecordDetails {
  GameRecordDetails({
    required this.matchInfo,
    required this.matchName,
    required this.matchResult,
    required this.playName,
    required this.playOptionName,
    required this.sportName,
  });

  String matchInfo = '';
  String matchName = '';
  String matchResult = '';
  String playName = '';
  String playOptionName = '';
  String sportName = '';
}