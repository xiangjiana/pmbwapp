import 'dart:convert';
import '../../gen/mod/proxySystem2/proxySystem2_bankerSettingUpdate_post_resp_model.dart';

class ProxySystem2BankerSettingUpdatePostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    ProxySystem2BankerSettingUpdatePostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model =
            ProxySystem2BankerSettingUpdatePostRespModel.fromJson({"data": {}});
      } else {
        model =
            ProxySystem2BankerSettingUpdatePostRespModel.fromJson(data['data']);
      }
    } else {
      model = ProxySystem2BankerSettingUpdatePostRespModel.fromJson(
          {"data": data['data']});
    }

    if (success != null) {
      if (success is Function(
          ProxySystem2BankerSettingUpdatePostRespModel data)) {
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
