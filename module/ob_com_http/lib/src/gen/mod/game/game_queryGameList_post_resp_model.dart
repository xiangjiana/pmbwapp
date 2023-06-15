import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameListPostRespModel {
  GameQueryGameListPostRespModel({
    required this.data,
  });

  factory GameQueryGameListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryGameListPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryGameListPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryGameListPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryGameListPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryGameListPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryGameListPostRespModelData {
  GameQueryGameListPostRespModelData({
    required this.gameId,
    required this.gameName,
    required this.gameStatus,
    required this.gameTitle,
    required this.iconUrl,
  });

  factory GameQueryGameListPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameQueryGameListPostRespModelData(
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        gameStatus: jsonRes['gameStatus'] == null
            ? 0
            : asT<int>("gameStatus", jsonRes['gameStatus'])!,
        gameTitle: jsonRes['gameTitle'] == null
            ? ''
            : asT<String>("gameTitle", jsonRes['gameTitle'])!,
        iconUrl: jsonRes['iconUrl'] == null
            ? ''
            : asT<String>("iconUrl", jsonRes['iconUrl'])!,
      );

  int gameId = 0;
  String gameName = '';
  int gameStatus = 0;
  String gameTitle = '';
  String iconUrl = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameId': gameId,
        'gameName': gameName,
        'gameStatus': gameStatus,
        'gameTitle': gameTitle,
        'iconUrl': iconUrl,
      };
}
