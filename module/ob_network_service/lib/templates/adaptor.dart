import 'dart:convert';

import 'model.dart';

class Adaptor {
  static void onSuccess(json, success, code) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    TemplateModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = TemplateModel.fromJson({"data": {}});
      } else {
        model = TemplateModel.fromJson(data['data']);
      }
    } else {
      model = TemplateModel.fromJson({"data": data['data']});
    }
    if (success != null) {
      success(model, code);
    }
  }

  static void onFail(code, msg, fail) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    if (fail != null) {
      fail(code, msg);
    }
  }
}
