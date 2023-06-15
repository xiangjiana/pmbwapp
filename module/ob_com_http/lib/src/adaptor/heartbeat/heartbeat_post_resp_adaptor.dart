import 'dart:convert';
import 'package:ob_com_http/src/gen/mod/heartbeat/heartbeat_post_resp_model.dart';

class HeartbeatPostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    HeartbeatPostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = HeartbeatPostRespModel.fromJson({"data": {}});
      } else {
        model = HeartbeatPostRespModel.fromJson(data['data']);
      }
    } else {
      model = HeartbeatPostRespModel.fromJson({"data": data['data']});
    }

    if (success != null) {
      if (success is Function(HeartbeatPostRespModel data)) {
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
