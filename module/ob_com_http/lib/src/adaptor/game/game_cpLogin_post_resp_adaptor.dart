import 'dart:convert';
import 'package:ob_com_http/src/gen/mod/game/game_cpLogin_post_resp_model.dart';

class GameCpLoginPostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    GameCpLoginPostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = GameCpLoginPostRespModel.fromJson({"data": {}});
      } else {
        model = GameCpLoginPostRespModel.fromJson(data['data']);
      }
    } else {
      model = GameCpLoginPostRespModel.fromJson({"data": data['data']});
    }

    if (success != null) {
      if (success is Function(GameCpLoginPostRespModel data)) {
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
