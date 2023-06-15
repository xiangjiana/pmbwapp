import 'dart:convert';
import '../../gen/mod/proxySystem2/proxySystem2_orderEatOrder_post_resp_model.dart';

class ProxySystem2OrderEatOrderPostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    ProxySystem2OrderEatOrderPostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = ProxySystem2OrderEatOrderPostRespModel.fromJson({"data": {}});
      } else {
        model = ProxySystem2OrderEatOrderPostRespModel.fromJson(data['data']);
      }
    } else {
      model = ProxySystem2OrderEatOrderPostRespModel.fromJson(
          {"data": data['data']});
    }

    if (success != null) {
      if (success is Function(ProxySystem2OrderEatOrderPostRespModel data)) {
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
