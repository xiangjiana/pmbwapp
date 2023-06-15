import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/models.dart';

@jsonSerializable
class GameRecords {
  GameRecords({
    required this.betAmount,
    required this.betContent,
    required this.createAt,
    required this.createAtString,
    required this.gameTypeName,
    required this.generatedId,
    required this.id,
    required this.netAmount,
    required this.obBetStatus,
    required this.validBetAmount,
  //  List<GameRecordDetails>? details,
  }) ;
     // : this.details = details ?? [];

  final num betAmount;
  final String betContent;
  final int createAt;
  final String createAtString;
  final String gameTypeName;
  final String generatedId;
  final String id;
  final num netAmount;
  final String obBetStatus;
  final num validBetAmount;
  //final List<GameRecordDetails> details;
}
