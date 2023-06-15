import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameTypesPostRespModel {
  GameQueryGameTypesPostRespModel({
    required this.data,
  });

  factory GameQueryGameTypesPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryGameTypesPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryGameTypesPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryGameTypesPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryGameTypesPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryGameTypesPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryGameTypesPostRespModelData {
  GameQueryGameTypesPostRespModelData({
    required this.id,
    required this.name,
  });

  factory GameQueryGameTypesPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameQueryGameTypesPostRespModelData(
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        name: jsonRes['name'] == null
            ? ''
            : asT<String>("name", jsonRes['name'])!,
      );

  int id = 0;
  String name = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
