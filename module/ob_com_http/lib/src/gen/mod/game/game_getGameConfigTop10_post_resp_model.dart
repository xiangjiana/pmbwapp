import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameGetGameConfigTop10PostRespModel {
  GameGetGameConfigTop10PostRespModel({
    required this.data,
  });

  factory GameGetGameConfigTop10PostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameGetGameConfigTop10PostRespModelData>? data = jsonRes['data'] is List ? <GameGetGameConfigTop10PostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameGetGameConfigTop10PostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameGetGameConfigTop10PostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameGetGameConfigTop10PostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameGetGameConfigTop10PostRespModelData {
  GameGetGameConfigTop10PostRespModelData({
    required this.baseRebate,
    required this.gameCategory,
    required this.gameCode,
    required this.gameId,
    required this.gameName,
    required this.gameTitle,
    required this.iconUrl,
    required this.labelId,
    required this.labelName,
    required this.order,
    required this.riseOrFall,
    required this.status,
    required this.timeRebate,
    required this.typeIds,
    required this.typeNames,
    required this.winLine,
  });

  factory GameGetGameConfigTop10PostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameGetGameConfigTop10PostRespModelData(
        baseRebate: jsonRes['baseRebate'] == null
            ? ''
            : asT<String>("baseRebate", jsonRes['baseRebate'])!,
        gameCategory: jsonRes['gameCategory'] == null
            ? 0
            : asT<int>("gameCategory", jsonRes['gameCategory'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        gameTitle: jsonRes['gameTitle'] == null
            ? ''
            : asT<String>("gameTitle", jsonRes['gameTitle'])!,
        iconUrl: jsonRes['iconUrl'] == null
            ? ''
            : asT<String>("iconUrl", jsonRes['iconUrl'])!,
        labelId: jsonRes['labelId'] == null
            ? ''
            : asT<String>("labelId", jsonRes['labelId'])!,
        labelName: jsonRes['labelName'] == null
            ? ''
            : asT<String>("labelName", jsonRes['labelName'])!,
        order:
            jsonRes['order'] == null ? 0 : asT<int>("order", jsonRes['order'])!,
        riseOrFall: jsonRes['riseOrFall'] == null
            ? ''
            : asT<String>("riseOrFall", jsonRes['riseOrFall'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        timeRebate: jsonRes['timeRebate'] == null
            ? ''
            : asT<String>("timeRebate", jsonRes['timeRebate'])!,
        typeIds: jsonRes['typeIds'] == null
            ? ''
            : asT<String>("typeIds", jsonRes['typeIds'])!,
        typeNames: jsonRes['typeNames'] == null
            ? ''
            : asT<String>("typeNames", jsonRes['typeNames'])!,
        winLine: jsonRes['winLine'] == null
            ? ''
            : asT<String>("winLine", jsonRes['winLine'])!,
      );

  String baseRebate = '';
  int gameCategory = 0;
  String gameCode = '';
  int gameId = 0;
  String gameName = '';
  String gameTitle = '';
  String iconUrl = '';
  String labelId = '';
  String labelName = '';
  int order = 0;
  String riseOrFall = '';
  int status = 0;
  String timeRebate = '';
  String typeIds = '';
  String typeNames = '';
  String winLine = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'baseRebate': baseRebate,
        'gameCategory': gameCategory,
        'gameCode': gameCode,
        'gameId': gameId,
        'gameName': gameName,
        'gameTitle': gameTitle,
        'iconUrl': iconUrl,
        'labelId': labelId,
        'labelName': labelName,
        'order': order,
        'riseOrFall': riseOrFall,
        'status': status,
        'timeRebate': timeRebate,
        'typeIds': typeIds,
        'typeNames': typeNames,
        'winLine': winLine,
      };
}
