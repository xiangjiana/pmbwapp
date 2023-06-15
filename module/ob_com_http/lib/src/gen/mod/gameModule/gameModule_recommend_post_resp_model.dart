import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameModuleRecommendPostRespModel {
  GameModuleRecommendPostRespModel({
    required this.data,
  });

  factory GameModuleRecommendPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameModuleRecommendPostRespModelData>? data = jsonRes['data'] is List ? <GameModuleRecommendPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameModuleRecommendPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameModuleRecommendPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameModuleRecommendPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameModuleRecommendPostRespModelData {
  GameModuleRecommendPostRespModelData({
    required this.accessInfo,
    required this.actualFavoritesNum,
    required this.createdAt,
    required this.createdBy,
    required this.description,
    required this.gameIcon,
    required this.gameId,
    required this.gameName,
    required this.gamePlatform,
    required this.gameRebateRate,
    required this.gameStatus,
    required this.id,
    required this.imageAddress,
    required this.increaseAmountOneTime,
    required this.initFavoritesNum,
    required this.isCollect,
    required this.relationGameModuleId,
    required this.relationGameModuleName,
    required this.relationOtherGameId,
    required this.supportTerminal,
    required this.totalFavoritesNum,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory GameModuleRecommendPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameModuleRecommendPostRespModelData(
        accessInfo: jsonRes['accessInfo'] == null
            ? ''
            : asT<String>("accessInfo", jsonRes['accessInfo'])!,
        actualFavoritesNum: jsonRes['actualFavoritesNum'] == null
            ? 0
            : asT<int>("actualFavoritesNum", jsonRes['actualFavoritesNum'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
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
        gameRebateRate: jsonRes['gameRebateRate'] == null
            ? ''
            : asT<String>("gameRebateRate", jsonRes['gameRebateRate'])!,
        gameStatus: jsonRes['gameStatus'] == null
            ? 0
            : asT<int>("gameStatus", jsonRes['gameStatus'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
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
        isCollect: jsonRes['isCollect'] == null
            ? 0
            : asT<int>("isCollect", jsonRes['isCollect'])!,
        relationGameModuleId: jsonRes['relationGameModuleId'] == null
            ? ''
            : asT<String>(
                "relationGameModuleId", jsonRes['relationGameModuleId'])!,
        relationGameModuleName: jsonRes['relationGameModuleName'] == null
            ? ''
            : asT<String>(
                "relationGameModuleName", jsonRes['relationGameModuleName'])!,
        relationOtherGameId: jsonRes['relationOtherGameId'] == null
            ? ''
            : asT<String>(
                "relationOtherGameId", jsonRes['relationOtherGameId'])!,
        supportTerminal: jsonRes['supportTerminal'] == null
            ? ''
            : asT<String>("supportTerminal", jsonRes['supportTerminal'])!,
        totalFavoritesNum: jsonRes['totalFavoritesNum'] == null
            ? 0
            : asT<int>("totalFavoritesNum", jsonRes['totalFavoritesNum'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String accessInfo = '';
  int actualFavoritesNum = 0;
  String createdAt = '';
  String createdBy = '';
  String description = '';
  int gameIcon = 0;
  int gameId = 0;
  String gameName = '';
  String gamePlatform = '';
  String gameRebateRate = '';
  int gameStatus = 0;
  String id = '';
  String imageAddress = '';
  String increaseAmountOneTime = '';
  int initFavoritesNum = 0;
  int isCollect = 0;
  String relationGameModuleId = '';
  String relationGameModuleName = '';
  String relationOtherGameId = '';
  String supportTerminal = '';
  int totalFavoritesNum = 0;
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessInfo': accessInfo,
        'actualFavoritesNum': actualFavoritesNum,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'description': description,
        'gameIcon': gameIcon,
        'gameId': gameId,
        'gameName': gameName,
        'gamePlatform': gamePlatform,
        'gameRebateRate': gameRebateRate,
        'gameStatus': gameStatus,
        'id': id,
        'imageAddress': imageAddress,
        'increaseAmountOneTime': increaseAmountOneTime,
        'initFavoritesNum': initFavoritesNum,
        'isCollect': isCollect,
        'relationGameModuleId': relationGameModuleId,
        'relationGameModuleName': relationGameModuleName,
        'relationOtherGameId': relationOtherGameId,
        'supportTerminal': supportTerminal,
        'totalFavoritesNum': totalFavoritesNum,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}
