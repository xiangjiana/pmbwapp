import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameLatestPostRespModel {
  GameQueryGameLatestPostRespModel({
    required this.bodyTitle,
    required this.contentInfor,
    required this.gameDetail,
    required this.gameId,
    required this.gameName,
    required this.mainTitleInfo,
    required this.moduleCaption,
    required this.moduleDesc,
    required this.pictureHome,
    required this.pictureOne,
    required this.pictureTwo,
    required this.subTitleInfo,
  });

  factory GameQueryGameLatestPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameQueryGameLatestPostRespModel(
        bodyTitle: jsonRes['bodyTitle'] == null
            ? ''
            : asT<String>("bodyTitle", jsonRes['bodyTitle'])!,
        contentInfor: jsonRes['contentInfor'] == null
            ? ''
            : asT<String>("contentInfor", jsonRes['contentInfor'])!,
        gameDetail: jsonRes["gameDetail"] == null
            ? GameDetail.fromJson({})
            : GameDetail.fromJson(asT<Map<String, dynamic>>(
                "gameDetail", jsonRes["gameDetail"])!),
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        mainTitleInfo: jsonRes['mainTitleInfo'] == null
            ? ''
            : asT<String>("mainTitleInfo", jsonRes['mainTitleInfo'])!,
        moduleCaption: jsonRes['moduleCaption'] == null
            ? ''
            : asT<String>("moduleCaption", jsonRes['moduleCaption'])!,
        moduleDesc: jsonRes['moduleDesc'] == null
            ? ''
            : asT<String>("moduleDesc", jsonRes['moduleDesc'])!,
        pictureHome: jsonRes['pictureHome'] == null
            ? ''
            : asT<String>("pictureHome", jsonRes['pictureHome'])!,
        pictureOne: jsonRes['pictureOne'] == null
            ? ''
            : asT<String>("pictureOne", jsonRes['pictureOne'])!,
        pictureTwo: jsonRes['pictureTwo'] == null
            ? ''
            : asT<String>("pictureTwo", jsonRes['pictureTwo'])!,
        subTitleInfo: jsonRes['subTitleInfo'] == null
            ? ''
            : asT<String>("subTitleInfo", jsonRes['subTitleInfo'])!,
      );

  String bodyTitle = '';
  String contentInfor = '';
  GameDetail gameDetail;
  int gameId = 0;
  String gameName = '';
  String mainTitleInfo = '';
  String moduleCaption = '';
  String moduleDesc = '';
  String pictureHome = '';
  String pictureOne = '';
  String pictureTwo = '';
  String subTitleInfo = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bodyTitle': bodyTitle,
        'contentInfor': contentInfor,
        'gameDetail': gameDetail,
        'gameId': gameId,
        'gameName': gameName,
        'mainTitleInfo': mainTitleInfo,
        'moduleCaption': moduleCaption,
        'moduleDesc': moduleDesc,
        'pictureHome': pictureHome,
        'pictureOne': pictureOne,
        'pictureTwo': pictureTwo,
        'subTitleInfo': subTitleInfo,
      };
}

class GameDetail {
  GameDetail({
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
    required this.isCollect,
    required this.totalFavoritesNum,
  });

  factory GameDetail.fromJson(Map<String, dynamic> jsonRes) => GameDetail(
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
        isCollect: jsonRes['isCollect'] == null
            ? 0
            : asT<int>("isCollect", jsonRes['isCollect'])!,
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
  int isCollect = 0;
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
        'isCollect': isCollect,
        'totalFavoritesNum': totalFavoritesNum,
      };
}
