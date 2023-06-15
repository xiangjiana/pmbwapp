import 'dart:convert';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerProxyCurProxy_post_resp_model.dart';

class ProxyLowerProxyCurProxyPostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    ProxyLowerProxyCurProxyPostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = ProxyLowerProxyCurProxyPostRespModel.fromJson({"data": {}});
      } else {
        model = ProxyLowerProxyCurProxyPostRespModel.fromJson(data['data']);
      }
    } else {
      model =
          ProxyLowerProxyCurProxyPostRespModel.fromJson({"data": data['data']});
    }

    if (success != null) {
      if (success is Function(ProxyLowerProxyCurProxyPostRespModel data)) {
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
