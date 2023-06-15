import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameModuleGetGameConfigAllPostRespModel {
  GameModuleGetGameConfigAllPostRespModel({
    required this.associatedGameModule,
    required this.associatedGames,
    required this.collectRespDtoList,
  });

  factory GameModuleGetGameConfigAllPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<AssociatedGameModule>? associatedGameModule =
        jsonRes['associatedGameModule'] is List
            ? <AssociatedGameModule>[]
            : null;
    if (associatedGameModule != null) {
      for (final dynamic item in jsonRes['associatedGameModule']!) {
        if (item != null) {
          associatedGameModule.add(AssociatedGameModule.fromJson(
              asT<Map<String, dynamic>>("associatedGameModule", item)!));
        }
      }
    }

    final List<AssociatedGames>? associatedGames =
        jsonRes['associatedGames'] is List ? <AssociatedGames>[] : null;
    if (associatedGames != null) {
      for (final dynamic item in jsonRes['associatedGames']!) {
        if (item != null) {
          associatedGames.add(AssociatedGames.fromJson(
              asT<Map<String, dynamic>>("associatedGames", item)!));
        }
      }
    }

    final List<CollectRespDtoList>? collectRespDtoList =
        jsonRes['collectRespDtoList'] is List ? <CollectRespDtoList>[] : null;
    if (collectRespDtoList != null) {
      for (final dynamic item in jsonRes['collectRespDtoList']!) {
        if (item != null) {
          collectRespDtoList.add(CollectRespDtoList.fromJson(
              asT<Map<String, dynamic>>("collectRespDtoList", item)!));
        }
      }
    }
    return GameModuleGetGameConfigAllPostRespModel(
      associatedGameModule:
          associatedGameModule == null ? [] : associatedGameModule,
      associatedGames: associatedGames == null ? [] : associatedGames,
      collectRespDtoList: collectRespDtoList == null ? [] : collectRespDtoList,
    );
  }

  List<AssociatedGameModule> associatedGameModule;
  List<AssociatedGames> associatedGames;
  List<CollectRespDtoList> collectRespDtoList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'associatedGameModule': associatedGameModule,
        'associatedGames': associatedGames,
        'collectRespDtoList': collectRespDtoList,
      };
}

class AssociatedGameModule {
  AssociatedGameModule({
    required this.allGameNum,
    required this.assortId,
    required this.commonId,
    required this.description,
    required this.displayOrder,
    required this.mainTitleInfo,
    required this.moduleCaption,
    required this.moduleDesc,
    required this.moduleId,
    required this.scrollingNum,
    required this.sort,
    required this.subTitleInfo,
  });

  factory AssociatedGameModule.fromJson(Map<String, dynamic> jsonRes) =>
      AssociatedGameModule(
        allGameNum: jsonRes['allGameNum'] == null
            ? 0
            : asT<int>("allGameNum", jsonRes['allGameNum'])!,
        assortId: jsonRes['assortId'] == null
            ? 0
            : asT<int>("assortId", jsonRes['assortId'])!,
        commonId: jsonRes['commonId'] == null
            ? 0
            : asT<int>("commonId", jsonRes['commonId'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
        displayOrder: jsonRes['displayOrder'] == null
            ? 0
            : asT<int>("displayOrder", jsonRes['displayOrder'])!,
        mainTitleInfo: jsonRes['mainTitleInfo'] == null
            ? ''
            : asT<String>("mainTitleInfo", jsonRes['mainTitleInfo'])!,
        moduleCaption: jsonRes['moduleCaption'] == null
            ? ''
            : asT<String>("moduleCaption", jsonRes['moduleCaption'])!,
        moduleDesc: jsonRes['moduleDesc'] == null
            ? ''
            : asT<String>("moduleDesc", jsonRes['moduleDesc'])!,
        moduleId: jsonRes['moduleId'] == null
            ? 0
            : asT<int>("moduleId", jsonRes['moduleId'])!,
        scrollingNum: jsonRes['scrollingNum'] == null
            ? 0
            : asT<int>("scrollingNum", jsonRes['scrollingNum'])!,
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        subTitleInfo: jsonRes['subTitleInfo'] == null
            ? ''
            : asT<String>("subTitleInfo", jsonRes['subTitleInfo'])!,
      );

  int allGameNum = 0;
  int assortId = 0;
  int commonId = 0;
  String description = '';
  int displayOrder = 0;
  String mainTitleInfo = '';
  String moduleCaption = '';
  String moduleDesc = '';
  int moduleId = 0;
  int scrollingNum = 0;
  int sort = 0;
  String subTitleInfo = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'allGameNum': allGameNum,
        'assortId': assortId,
        'commonId': commonId,
        'description': description,
        'displayOrder': displayOrder,
        'mainTitleInfo': mainTitleInfo,
        'moduleCaption': moduleCaption,
        'moduleDesc': moduleDesc,
        'moduleId': moduleId,
        'scrollingNum': scrollingNum,
        'sort': sort,
        'subTitleInfo': subTitleInfo,
      };
}

class AssociatedGames {
  AssociatedGames({
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

  factory AssociatedGames.fromJson(Map<String, dynamic> jsonRes) =>
      AssociatedGames(
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

class CollectRespDtoList {
  CollectRespDtoList({
    required this.accessInfo,
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
  });

  factory CollectRespDtoList.fromJson(Map<String, dynamic> jsonRes) =>
      CollectRespDtoList(
        accessInfo: jsonRes['accessInfo'] == null
            ? ''
            : asT<String>("accessInfo", jsonRes['accessInfo'])!,
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
      );

  String accessInfo = '';
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

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessInfo': accessInfo,
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
      };
}
