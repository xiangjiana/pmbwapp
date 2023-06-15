import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameGetMatchTypePostRespModel {
  GameGetMatchTypePostRespModel({
    required this.data,
  });

  factory GameGetMatchTypePostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameGetMatchTypePostRespModelData>? data = jsonRes['data'] is List ? <GameGetMatchTypePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameGetMatchTypePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameGetMatchTypePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameGetMatchTypePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameGetMatchTypePostRespModelData {
  GameGetMatchTypePostRespModelData({
    required this.typeId,
    required this.typeName,
  });

  factory GameGetMatchTypePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameGetMatchTypePostRespModelData(
        typeId: jsonRes['typeId'] == null
            ? ''
            : asT<String>("typeId", jsonRes['typeId'])!,
        typeName: jsonRes['typeName'] == null
            ? ''
            : asT<String>("typeName", jsonRes['typeName'])!,
      );

  String typeId = '';
  String typeName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'typeId': typeId,
        'typeName': typeName,
      };
}
