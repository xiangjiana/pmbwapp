import 'dart:convert';
import 'package:ob_com_http/src/gen/mod/searchConfig/searchConfig_list_post_resp_model.dart';

class SearchConfigListPostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    SearchConfigListPostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = SearchConfigListPostRespModel.fromJson({"data": {}});
      } else {
        model = SearchConfigListPostRespModel.fromJson(data['data']);
      }
    } else {
      model = SearchConfigListPostRespModel.fromJson({"data": data['data']});
    }

    if (success != null) {
      if (success is Function(SearchConfigListPostRespModel data)) {
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
