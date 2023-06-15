import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameGameGetPlatfromGamePostRespModel {
  GameGameGetPlatfromGamePostRespModel({
    required this.data,
  });

  factory GameGameGetPlatfromGamePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameGameGetPlatfromGamePostRespModelData>? data = jsonRes['data'] is List ? <GameGameGetPlatfromGamePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameGameGetPlatfromGamePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameGameGetPlatfromGamePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameGameGetPlatfromGamePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameGameGetPlatfromGamePostRespModelData {
  GameGameGetPlatfromGamePostRespModelData({
    required this.deviceType,
    required this.gameCode,
    required this.imgUrl,
    required this.status,
  });

  factory GameGameGetPlatfromGamePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameGameGetPlatfromGamePostRespModelData(
        deviceType: jsonRes['deviceType'] == null
            ? ''
            : asT<String>("deviceType", jsonRes['deviceType'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        imgUrl: jsonRes['imgUrl'] == null
            ? ''
            : asT<String>("imgUrl", jsonRes['imgUrl'])!,
        status: jsonRes['status'] == null
            ? ''
            : asT<String>("status", jsonRes['status'])!,
      );

  String deviceType = '';
  String gameCode = '';
  String imgUrl = '';
  String status = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceType': deviceType,
        'gameCode': gameCode,
        'imgUrl': imgUrl,
        'status': status,
      };
}
