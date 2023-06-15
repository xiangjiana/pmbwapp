
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/models.dart';

@jsonSerializable
class DateAndGameRecordList {
  DateAndGameRecordList({
    required this.date,
    required this.gameRecords,
  });

  final String date;
  final List<GameRecords> gameRecords;
}

