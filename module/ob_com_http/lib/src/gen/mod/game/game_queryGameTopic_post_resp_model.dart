import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameTopicPostRespModel {
  GameQueryGameTopicPostRespModel({
    required this.data,
  });

  factory GameQueryGameTopicPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryGameTopicPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryGameTopicPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryGameTopicPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryGameTopicPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryGameTopicPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryGameTopicPostRespModelData {
  GameQueryGameTopicPostRespModelData({
    required this.assortId,
    required this.gameTopicList,
    required this.mainTitleInfo,
    required this.subTitleInfo,
    required this.topicId,
  });

  factory GameQueryGameTopicPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameTopicList>? gameTopicList =
        jsonRes['gameTopicList'] is List ? <GameTopicList>[] : null;
    if (gameTopicList != null) {
      for (final dynamic item in jsonRes['gameTopicList']!) {
        if (item != null) {
          gameTopicList.add(GameTopicList.fromJson(
              asT<Map<String, dynamic>>("gameTopicList", item)!));
        }
      }
    }
    return GameQueryGameTopicPostRespModelData(
      assortId: jsonRes['assortId'] == null
          ? ''
          : asT<String>("assortId", jsonRes['assortId'])!,
      gameTopicList: gameTopicList == null ? [] : gameTopicList,
      mainTitleInfo: jsonRes['mainTitleInfo'] == null
          ? ''
          : asT<String>("mainTitleInfo", jsonRes['mainTitleInfo'])!,
      subTitleInfo: jsonRes['subTitleInfo'] == null
          ? ''
          : asT<String>("subTitleInfo", jsonRes['subTitleInfo'])!,
      topicId: jsonRes['topicId'] == null
          ? ''
          : asT<String>("topicId", jsonRes['topicId'])!,
    );
  }

  String assortId = '';
  List<GameTopicList> gameTopicList;
  String mainTitleInfo = '';
  String subTitleInfo = '';
  String topicId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'assortId': assortId,
        'gameTopicList': gameTopicList,
        'mainTitleInfo': mainTitleInfo,
        'subTitleInfo': subTitleInfo,
        'topicId': topicId,
      };
}

class GameTopicList {
  GameTopicList({
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

  factory GameTopicList.fromJson(Map<String, dynamic> jsonRes) => GameTopicList(
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
