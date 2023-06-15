import 'dart:async';

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:record/record.dart';

class BetDetailListRepository {
  final recordApi = Get.find<RecordApi>();

  Future<GameRecordDetail> getGameGameRecordByGameCode(
    String gameCode,
    String startTime,
    String endTime,
    String obBetStatus,
    String gameTypeName,
    String cid,
  ) async {
    try {
      return recordApi.game(GameCodeRecordParam(
        startTime: startTime,
        endTime: endTime,
        obBetStatus: int.parse(obBetStatus),
        gameCode: gameCode,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }
}
