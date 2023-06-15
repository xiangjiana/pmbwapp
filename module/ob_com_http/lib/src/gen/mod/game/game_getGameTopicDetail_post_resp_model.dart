import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameGetGameTopicDetailPostRespModel {
  GameGetGameTopicDetailPostRespModel({
    required this.data,
  });

  factory GameGetGameTopicDetailPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameGetGameTopicDetailPostRespModelData>? data = jsonRes['data'] is List ? <GameGetGameTopicDetailPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameGetGameTopicDetailPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameGetGameTopicDetailPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameGetGameTopicDetailPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameGetGameTopicDetailPostRespModelData {
  GameGetGameTopicDetailPostRespModelData({
    required this.accessInfo,
    required this.actualFavoritesNum,
    required this.description,
    required this.gameIcon,
    required this.gameId,
    required this.gameName,
    required this.gamePlatform,
    required this.gameStatus,
    required this.imageAddress,
    required this.increaseAmountOneTime,
    required this.initFavoritesNum,
    required this.totalFavoritesNum,
  });

  factory GameGetGameTopicDetailPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameGetGameTopicDetailPostRespModelData(
        accessInfo: jsonRes['accessInfo'] == null
            ? ''
            : asT<String>("accessInfo", jsonRes['accessInfo'])!,
        actualFavoritesNum: jsonRes['actualFavoritesNum'] == null
            ? 0
            : asT<int>("actualFavoritesNum", jsonRes['actualFavoritesNum'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
        gameIcon: jsonRes['gameIcon'] == null
            ? 0
            : asT<int>("gameIcon", jsonRes['gameIcon'])!,
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        gamePlatform: jsonRes['gamePlatform'] == null
            ? ''
            : asT<String>("gamePlatform", jsonRes['gamePlatform'])!,
        gameStatus: jsonRes['gameStatus'] == null
            ? 0
            : asT<int>("gameStatus", jsonRes['gameStatus'])!,
        imageAddress: jsonRes['imageAddress'] == null
            ? ''
            : asT<String>("imageAddress", jsonRes['imageAddress'])!,
        increaseAmountOneTime: jsonRes['increaseAmountOneTime'] == null
            ? ''
            : asT<String>(
                "increaseAmountOneTime", jsonRes['increaseAmountOneTime'])!,
        initFavoritesNum: jsonRes['initFavoritesNum'] == null
            ? 0
            : asT<int>("initFavoritesNum", jsonRes['initFavoritesNum'])!,
        totalFavoritesNum: jsonRes['totalFavoritesNum'] == null
            ? 0
            : asT<int>("totalFavoritesNum", jsonRes['totalFavoritesNum'])!,
      );

  String accessInfo = '';
  int actualFavoritesNum = 0;
  String description = '';
  int gameIcon = 0;
  int gameId = 0;
  String gameName = '';
  String gamePlatform = '';
  int gameStatus = 0;
  String imageAddress = '';
  String increaseAmountOneTime = '';
  int initFavoritesNum = 0;
  int totalFavoritesNum = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessInfo': accessInfo,
        'actualFavoritesNum': actualFavoritesNum,
        'description': description,
        'gameIcon': gameIcon,
        'gameId': gameId,
        'gameName': gameName,
        'gamePlatform': gamePlatform,
        'gameStatus': gameStatus,
        'imageAddress': imageAddress,
        'increaseAmountOneTime': increaseAmountOneTime,
        'initFavoritesNum': initFavoritesNum,
        'totalFavoritesNum': totalFavoritesNum,
      };
}
