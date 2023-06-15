import 'dart:convert';
import 'package:ob_com_http/src/gen/mod/game/game_queryLiveRooms_post_resp_model.dart';

class GameQueryLiveRoomsPostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    GameQueryLiveRoomsPostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = GameQueryLiveRoomsPostRespModel.fromJson({"data": {}});
      } else {
        model = GameQueryLiveRoomsPostRespModel.fromJson(data['data']);
      }
    } else {
      model = GameQueryLiveRoomsPostRespModel.fromJson({"data": data['data']});
    }

    if (success != null) {
      if (success is Function(GameQueryLiveRoomsPostRespModel data)) {
        success(model);
      } else {
        success(model, code, exp);
      }
    }
  }

  static void onFail(code, msg, fail) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    if (fail != null) {
      fail(code, msg);
    }
  }
}
