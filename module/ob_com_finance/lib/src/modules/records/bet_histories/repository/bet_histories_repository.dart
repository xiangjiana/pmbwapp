import 'dart:async';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:record/record.dart';

class BetHistoriesRepository {
  final recordApi = Get.find<RecordApi>();

  Future<GameRecordMeta> getGameGameRecordAll(
      String startTime, String endTime, String obBetStatus) {
    try {
      return recordApi.all(GameRecordAllParam(
        startTime: startTime,
        endTime: endTime,
        obBetStatus: int.parse(obBetStatus),
      ));
    } catch (e) {
      return Future.error(e);
    }
  }
}
