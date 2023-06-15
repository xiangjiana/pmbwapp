import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryLiveRoomsPostRespModel {
  GameQueryLiveRoomsPostRespModel({
    required this.data,
  });

  factory GameQueryLiveRoomsPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryLiveRoomsPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryLiveRoomsPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryLiveRoomsPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryLiveRoomsPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryLiveRoomsPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryLiveRoomsPostRespModelData {
  GameQueryLiveRoomsPostRespModelData({
    required this.anchorId,
    required this.anchorVideoUrl,
    required this.gameTableId,
    required this.gameTypeId,
    required this.gameTypeName,
    required this.physicsTableNo,
    required this.tableName,
    required this.tableVideoUrl,
  });

  factory GameQueryLiveRoomsPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? anchorVideoUrl =
        jsonRes['anchorVideoUrl'] is List ? <String>[] : null;
    if (anchorVideoUrl != null) {
      for (final dynamic item in jsonRes['anchorVideoUrl']!) {
        if (item != null) {
          anchorVideoUrl.add(asT<String>("anchorVideoUrl", item)!);
        }
      }
    }

    final List<String>? tableVideoUrl =
        jsonRes['tableVideoUrl'] is List ? <String>[] : null;
    if (tableVideoUrl != null) {
      for (final dynamic item in jsonRes['tableVideoUrl']!) {
        if (item != null) {
          tableVideoUrl.add(asT<String>("tableVideoUrl", item)!);
        }
      }
    }
    return GameQueryLiveRoomsPostRespModelData(
      anchorId: jsonRes['anchorId'] == null
          ? 0
          : asT<int>("anchorId", jsonRes['anchorId'])!,
      anchorVideoUrl: anchorVideoUrl == null ? [] : anchorVideoUrl,
      gameTableId: jsonRes['gameTableId'] == null
          ? 0
          : asT<int>("gameTableId", jsonRes['gameTableId'])!,
      gameTypeId: jsonRes['gameTypeId'] == null
          ? 0
          : asT<int>("gameTypeId", jsonRes['gameTypeId'])!,
      gameTypeName: jsonRes['gameTypeName'] == null
          ? ''
          : asT<String>("gameTypeName", jsonRes['gameTypeName'])!,
      physicsTableNo: jsonRes['physicsTableNo'] == null
          ? ''
          : asT<String>("physicsTableNo", jsonRes['physicsTableNo'])!,
      tableName: jsonRes['tableName'] == null
          ? ''
          : asT<String>("tableName", jsonRes['tableName'])!,
      tableVideoUrl: tableVideoUrl == null ? [] : tableVideoUrl,
    );
  }

  int anchorId = 0;
  List<String> anchorVideoUrl;
  int gameTableId = 0;
  int gameTypeId = 0;
  String gameTypeName = '';
  String physicsTableNo = '';
  String tableName = '';
  List<String> tableVideoUrl;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'anchorId': anchorId,
        'anchorVideoUrl': anchorVideoUrl,
        'gameTableId': gameTableId,
        'gameTypeId': gameTypeId,
        'gameTypeName': gameTypeName,
        'physicsTableNo': physicsTableNo,
        'tableName': tableName,
        'tableVideoUrl': tableVideoUrl,
      };
}
