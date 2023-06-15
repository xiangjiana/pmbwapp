import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameAssortListPostRespModel {
  GameQueryGameAssortListPostRespModel({
    required this.data,
  });

  factory GameQueryGameAssortListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryGameAssortListPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryGameAssortListPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryGameAssortListPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryGameAssortListPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryGameAssortListPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryGameAssortListPostRespModelData {
  GameQueryGameAssortListPostRespModelData({
    required this.id,
    required this.assortName,
    required this.assortSort,
  });

  factory GameQueryGameAssortListPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameQueryGameAssortListPostRespModelData(
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        assortName: jsonRes['assortName'] == null
            ? ''
            : asT<String>("assortName", jsonRes['assortName'])!,
        assortSort: jsonRes['assortSort'] == null
            ? 0
            : asT<int>("assortSort", jsonRes['assortSort'])!,
      );

  String id = '';
  String assortName = '';
  int assortSort = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'assortName': assortName,
        'assortSort': assortSort,
      };
}
