import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameGetHotResultListPostRespModel {
  GameGetHotResultListPostRespModel({
    required this.data,
  });

  factory GameGetHotResultListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameGetHotResultListPostRespModelData>? data = jsonRes['data'] is List ? <GameGetHotResultListPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameGetHotResultListPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameGetHotResultListPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameGetHotResultListPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameGetHotResultListPostRespModelData {
  GameGetHotResultListPostRespModelData({
    required this.planId,
    required this.gameName,
    required this.lastPlanId,
    required this.startTime,
    required this.lastCode,
    required this.ticketId,
    required this.gameIcon,
    required this.down,
  });

  factory GameGetHotResultListPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameGetHotResultListPostRespModelData(
        planId: jsonRes['planId'] == null
            ? ''
            : asT<String>("planId", jsonRes['planId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        lastPlanId: jsonRes['lastPlanId'] == null
            ? ''
            : asT<String>("lastPlanId", jsonRes['lastPlanId'])!,
        startTime: jsonRes['startTime'] == null
            ? ''
            : asT<String>("startTime", jsonRes['startTime'])!,
        lastCode: jsonRes['lastCode'] == null
            ? ''
            : asT<String>("lastCode", jsonRes['lastCode'])!,
        ticketId: jsonRes['ticketId'] == null
            ? ''
            : asT<String>("ticketId", jsonRes['ticketId'])!,
        gameIcon: jsonRes['gameIcon'] == null
            ? ''
            : asT<String>("gameIcon", jsonRes['gameIcon'])!,
        down: jsonRes['down'] == null
            ? ''
            : asT<String>("down", jsonRes['down'])!,
      );

  String planId = '';
  String gameName = '';
  String lastPlanId = '';
  String startTime = '';
  String lastCode = '';
  String ticketId = '';
  String gameIcon = '';
  String down = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'planId': planId,
        'gameName': gameName,
        'lastPlanId': lastPlanId,
        'startTime': startTime,
        'lastCode': lastCode,
        'ticketId': ticketId,
        'gameIcon': gameIcon,
        'down': down,
      };
}
