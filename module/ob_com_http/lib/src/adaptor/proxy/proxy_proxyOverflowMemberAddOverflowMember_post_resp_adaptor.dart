import 'dart:convert';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyOverflowMemberAddOverflowMember_post_resp_model.dart';

class ProxyProxyOverflowMemberAddOverflowMemberPostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    ProxyProxyOverflowMemberAddOverflowMemberPostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = ProxyProxyOverflowMemberAddOverflowMemberPostRespModel.fromJson(
            {"data": {}});
      } else {
        model = ProxyProxyOverflowMemberAddOverflowMemberPostRespModel.fromJson(
            data['data']);
      }
    } else {
      model = ProxyProxyOverflowMemberAddOverflowMemberPostRespModel.fromJson(
          {"data": data['data']});
    }

    if (success != null) {
      if (success is Function(
          ProxyProxyOverflowMemberAddOverflowMemberPostRespModel data)) {
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
