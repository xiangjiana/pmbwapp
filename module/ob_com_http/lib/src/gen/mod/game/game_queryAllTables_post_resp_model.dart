import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryAllTablesPostRespModel {
  GameQueryAllTablesPostRespModel({
    required this.data,
  });

  factory GameQueryAllTablesPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryAllTablesPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryAllTablesPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryAllTablesPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryAllTablesPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryAllTablesPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryAllTablesPostRespModelData {
  GameQueryAllTablesPostRespModelData({
    required this.labelId,
    required this.labelName,
    required this.tableDetailList,
  });

  factory GameQueryAllTablesPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<TableDetailList>? tableDetailList =
        jsonRes['tableDetailList'] is List ? <TableDetailList>[] : null;
    if (tableDetailList != null) {
      for (final dynamic item in jsonRes['tableDetailList']!) {
        if (item != null) {
          tableDetailList.add(TableDetailList.fromJson(
              asT<Map<String, dynamic>>("tableDetailList", item)!));
        }
      }
    }
    return GameQueryAllTablesPostRespModelData(
      labelId: jsonRes['labelId'] == null
          ? 0
          : asT<int>("labelId", jsonRes['labelId'])!,
      labelName: jsonRes['labelName'] == null
          ? ''
          : asT<String>("labelName", jsonRes['labelName'])!,
      tableDetailList: tableDetailList == null ? [] : tableDetailList,
    );
  }

  int labelId = 0;
  String labelName = '';
  List<TableDetailList> tableDetailList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'labelId': labelId,
        'labelName': labelName,
        'tableDetailList': tableDetailList,
      };
}

class TableDetailList {
  TableDetailList({
    required this.dealerPic,
    required this.dealerName,
    required this.gameTypeId,
    required this.gameTypeName,
    required this.goodRoads,
    required this.index,
    required this.roadPaper,
    required this.tableId,
    required this.tableName,
    required this.tableOnline,
  });

  factory TableDetailList.fromJson(Map<String, dynamic> jsonRes) =>
      TableDetailList(
        dealerPic: jsonRes['dealerPic'] == null
            ? ''
            : asT<String>("dealerPic", jsonRes['dealerPic'])!,
        dealerName: jsonRes['dealerName'] == null
            ? ''
            : asT<String>("dealerName", jsonRes['dealerName'])!,
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
            ? RoadPaper.fromJson({})
            : RoadPaper.fromJson(
                asT<Map<String, dynamic>>("roadPaper", jsonRes["roadPaper"])!),
        tableId: jsonRes['tableId'] == null
            ? 0
            : asT<int>("tableId", jsonRes['tableId'])!,
        tableName: jsonRes['tableName'] == null
            ? ''
            : asT<String>("tableName", jsonRes['tableName'])!,
        tableOnline: jsonRes["tableOnline"] == null
            ? TableOnline.fromJson({})
            : TableOnline.fromJson(asT<Map<String, dynamic>>(
                "tableOnline", jsonRes["tableOnline"])!),
      );

  String dealerPic = '';
  String dealerName = '';
  int gameTypeId = 0;
  String gameTypeName = '';
  int goodRoads = 0;
  int index = 0;
  RoadPaper roadPaper;
  int tableId = 0;
  String tableName = '';
  TableOnline tableOnline;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dealerPic': dealerPic,
        'dealerName': dealerName,
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

class RoadPaper {
  RoadPaper({
    required this.beadRoad,
    required this.bigPairRoad,
    required this.bigRoad,
    required this.resultRoad,
    required this.singleDoubleRoad,
    required this.winNumberRoad,
  });

  factory RoadPaper.fromJson(Map<String, dynamic> jsonRes) => RoadPaper(
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

class TableOnline {
  TableOnline({
    required this.onlineNumber,
  });

  factory TableOnline.fromJson(Map<String, dynamic> jsonRes) => TableOnline(
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
