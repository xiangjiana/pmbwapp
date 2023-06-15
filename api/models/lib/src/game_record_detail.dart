import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/models.dart';

@jsonSerializable
class GameRecordDetail {
  GameRecordDetail({
    required this.betAmountTotal,
    required this.validBetAmountTotal,
    required this.countTotal,
    // required this.gameTypeNames,
    required this.metas,
    required this.netAmountTotal,
  });

  final num betAmountTotal;
  final num countTotal;
  // final List<String> gameTypeNames;
  final List<DateAndGameRecordList> metas;
  final num netAmountTotal;
  final num validBetAmountTotal;
}


