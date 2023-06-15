import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameModuleCollectPostRespModel {
  GameModuleCollectPostRespModel({
    required this.data,
  });

  factory GameModuleCollectPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameModuleCollectPostRespModelData>? data = jsonRes['data'] is List ? <GameModuleCollectPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameModuleCollectPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameModuleCollectPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameModuleCollectPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameModuleCollectPostRespModelData {
  GameModuleCollectPostRespModelData({
    required this.createDt,
    required this.gameIcon,
    required this.gameId,
    required this.gameName,
    required this.gamePlatform,
    required this.gameStatus,
    required this.imageAddress,
    required this.supportTerminal,
    required this.totalFavoritesNum,
    required this.userId,
    required this.accessInfo,
  });

  factory GameModuleCollectPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameModuleCollectPostRespModelData(
        createDt: jsonRes['createDt'] == null
            ? ''
            : asT<String>("createDt", jsonRes['createDt'])!,
        gameIcon: jsonRes['gameIcon'] == null
            ? ''
            : asT<String>("gameIcon", jsonRes['gameIcon'])!,
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
        supportTerminal: jsonRes['supportTerminal'] == null
            ? ''
            : asT<String>("supportTerminal", jsonRes['supportTerminal'])!,
        totalFavoritesNum: jsonRes['totalFavoritesNum'] == null
            ? 0
            : asT<int>("totalFavoritesNum", jsonRes['totalFavoritesNum'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
        accessInfo: jsonRes['accessInfo'] == null
            ? ''
            : asT<String>("accessInfo", jsonRes['accessInfo'])!,
      );

  String createDt = '';
  String gameIcon = '';
  int gameId = 0;
  String gameName = '';
  String gamePlatform = '';
  int gameStatus = 0;
  String imageAddress = '';
  String supportTerminal = '';
  int totalFavoritesNum = 0;
  String userId = '';
  String accessInfo = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createDt': createDt,
        'gameIcon': gameIcon,
        'gameId': gameId,
        'gameName': gameName,
        'gamePlatform': gamePlatform,
        'gameStatus': gameStatus,
        'imageAddress': imageAddress,
        'supportTerminal': supportTerminal,
        'totalFavoritesNum': totalFavoritesNum,
        'userId': userId,
        'accessInfo': accessInfo,
      };
}
