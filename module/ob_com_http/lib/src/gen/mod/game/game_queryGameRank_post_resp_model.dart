import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameRankPostRespModel {
  GameQueryGameRankPostRespModel({
    required this.data,
  });

  factory GameQueryGameRankPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryGameRankPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryGameRankPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryGameRankPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryGameRankPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryGameRankPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryGameRankPostRespModelData {
  GameQueryGameRankPostRespModelData({
    required this.accessInfo,
    required this.betAmount,
    required this.gameCode,
    required this.gameIcon,
    required this.gameId,
    required this.gameName,
    required this.gameStatus,
    required this.imageAddress,
    required this.number,
  });

  factory GameQueryGameRankPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameQueryGameRankPostRespModelData(
        accessInfo: jsonRes['accessInfo'] == null
            ? ''
            : asT<String>("accessInfo", jsonRes['accessInfo'])!,
        betAmount: jsonRes['betAmount'] == null
            ? 0.0
            : asT<double>("betAmount", jsonRes['betAmount'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        gameIcon: jsonRes['gameIcon'] == null
            ? 0
            : asT<int>("gameIcon", jsonRes['gameIcon'])!,
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        gameStatus: jsonRes['gameStatus'] == null
            ? 0
            : asT<int>("gameStatus", jsonRes['gameStatus'])!,
        imageAddress: jsonRes['imageAddress'] == null
            ? ''
            : asT<String>("imageAddress", jsonRes['imageAddress'])!,
        number: jsonRes['number'] == null
            ? 0
            : asT<int>("number", jsonRes['number'])!,
      );

  String accessInfo = '';
  double betAmount = 0.0;
  String gameCode = '';
  int gameIcon = 0;
  int gameId = 0;
  String gameName = '';
  int gameStatus = 0;
  String imageAddress = '';
  int number = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessInfo': accessInfo,
        'betAmount': betAmount,
        'gameCode': gameCode,
        'gameIcon': gameIcon,
        'gameId': gameId,
        'gameName': gameName,
        'gameStatus': gameStatus,
        'imageAddress': imageAddress,
        'number': number,
      };
}
