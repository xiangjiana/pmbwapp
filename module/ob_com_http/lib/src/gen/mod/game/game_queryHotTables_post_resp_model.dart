import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryHotTablesPostRespModel {
  GameQueryHotTablesPostRespModel({
    required this.data,
  });

  factory GameQueryHotTablesPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryHotTablesPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryHotTablesPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryHotTablesPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryHotTablesPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryHotTablesPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryHotTablesPostRespModelData {
  GameQueryHotTablesPostRespModelData({
    required this.dealerEntertainPic,
    required this.dealerName,
    required this.dealerPic,
    required this.gameTypeId,
    required this.gameTypeName,
    required this.goodRoads,
    required this.index,
    required this.roadPaper,
    required this.tableId,
    required this.tableName,
    required this.tableOnline,
  });

  factory GameQueryHotTablesPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameQueryHotTablesPostRespModelData(
        dealerEntertainPic: jsonRes['dealerEntertainPic'] == null
            ? ''
            : asT<String>("dealerEntertainPic", jsonRes['dealerEntertainPic'])!,
        dealerName: jsonRes['dealerName'] == null
            ? ''
            : asT<String>("dealerName", jsonRes['dealerName'])!,
        dealerPic: jsonRes['dealerPic'] == null
            ? ''
            : asT<String>("dealerPic", jsonRes['dealerPic'])!,
        gameTypeId: jsonRes['gameTypeId'] == null
            ? 0
            : asT<int>("gameTypeId", jsonRes['gameTypeId'])!,
        gameTypeName: jsonRes['gameTypeName'] == null
            ? ''
            : asT<String>("gameTypeName", jsonRes['gameTypeName'])!,
        goodRoads: jsonRes['goodRoads'] == null
            ? 0
            : asT<int>("goodRoads", jsonRes['goodRoads'])!,
        index:
            jsonRes['index'] == null ? 0 : asT<int>("index", jsonRes['index'])!,
        roadPaper: jsonRes["roadPaper"] == null
            ? GameQueryHotTablesPostRespModelRoadPaper.fromJson({})
            : GameQueryHotTablesPostRespModelRoadPaper.fromJson(
                asT<Map<String, dynamic>>("roadPaper", jsonRes["roadPaper"])!),
        tableId: jsonRes['tableId'] == null
            ? 0
            : asT<int>("tableId", jsonRes['tableId'])!,
        tableName: jsonRes['tableName'] == null
            ? ''
            : asT<String>("tableName", jsonRes['tableName'])!,
        tableOnline: jsonRes["tableOnline"] == null
            ? GameQueryHotTablesPostRespModelTableOnline.fromJson({})
            : GameQueryHotTablesPostRespModelTableOnline.fromJson(asT<Map<String, dynamic>>(
                "tableOnline", jsonRes["tableOnline"])!),
      );

  String dealerEntertainPic = '';
  String dealerName = '';
  String dealerPic = '';
  int gameTypeId = 0;
  String gameTypeName = '';
  int goodRoads = 0;
  int index = 0;
  GameQueryHotTablesPostRespModelRoadPaper roadPaper;
  int tableId = 0;
  String tableName = '';
  GameQueryHotTablesPostRespModelTableOnline tableOnline;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dealerEntertainPic': dealerEntertainPic,
        'dealerName': dealerName,
        'dealerPic': dealerPic,
        'gameTypeId': gameTypeId,
        'gameTypeName': gameTypeName,
        'goodRoads': goodRoads,
        'index': index,
        'roadPaper': roadPaper,
        'tableId': tableId,
        'tableName': tableName,
        'tableOnline': tableOnline,
      };
}

class GameQueryHotTablesPostRespModelRoadPaper {
  GameQueryHotTablesPostRespModelRoadPaper({
    required this.beadRoad,
    required this.bigPairRoad,
    required this.bigRoad,
    required this.resultRoad,
    required this.singleDoubleRoad,
    required this.winNumberRoad,
  });

  factory GameQueryHotTablesPostRespModelRoadPaper.fromJson(Map<String, dynamic> jsonRes) => GameQueryHotTablesPostRespModelRoadPaper(
        beadRoad: jsonRes['beadRoad'] == null
            ? ''
            : asT<String>("beadRoad", jsonRes['beadRoad'])!,
        bigPairRoad: jsonRes['bigPairRoad'] == null
            ? ''
            : asT<String>("bigPairRoad", jsonRes['bigPairRoad'])!,
        bigRoad: jsonRes['bigRoad'] == null
            ? ''
            : asT<String>("bigRoad", jsonRes['bigRoad'])!,
        resultRoad: jsonRes['resultRoad'] == null
            ? ''
            : asT<String>("resultRoad", jsonRes['resultRoad'])!,
        singleDoubleRoad: jsonRes['singleDoubleRoad'] == null
            ? ''
            : asT<String>("singleDoubleRoad", jsonRes['singleDoubleRoad'])!,
        winNumberRoad: jsonRes['winNumberRoad'] == null
            ? ''
            : asT<String>("winNumberRoad", jsonRes['winNumberRoad'])!,
      );

  String beadRoad = '';
  String bigPairRoad = '';
  String bigRoad = '';
  String resultRoad = '';
  String singleDoubleRoad = '';
  String winNumberRoad = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'beadRoad': beadRoad,
        'bigPairRoad': bigPairRoad,
        'bigRoad': bigRoad,
        'resultRoad': resultRoad,
        'singleDoubleRoad': singleDoubleRoad,
        'winNumberRoad': winNumberRoad,
      };
}

class GameQueryHotTablesPostRespModelTableOnline {
  GameQueryHotTablesPostRespModelTableOnline({
    required this.onlineNumber,
  });

  factory GameQueryHotTablesPostRespModelTableOnline.fromJson(Map<String, dynamic> jsonRes) => GameQueryHotTablesPostRespModelTableOnline(
        onlineNumber: jsonRes['onlineNumber'] == null
            ? 0
            : asT<int>("onlineNumber", jsonRes['onlineNumber'])!,
      );

  int onlineNumber = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'onlineNumber': onlineNumber,
      };
}
