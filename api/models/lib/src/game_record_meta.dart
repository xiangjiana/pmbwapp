import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'game_metas.dart';

@jsonSerializable
class GameRecordMeta {
  GameRecordMeta({
    required this.betAmountTotal,
    required this.countTotal,
    required this.metas,
    required this.netAmountTotal,
  });

  final num betAmountTotal;
  final num countTotal;
  final List<Metas> metas;
  final num netAmountTotal;
}


