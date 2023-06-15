import 'dart:convert';
import 'package:ob_com_http/src/gen/mod/geetest/geetest_secondValidate_post_resp_model.dart';

class GeetestSecondValidatePostRespAdaptor {
  static void onSuccess(json, success, code, exp) {
    /// 在这里改写处理 toJson 数据，脚本不会覆盖此文件
    GeetestSecondValidatePostRespModel model;
    late Map<String, dynamic> data;
    if (json is String) data = jsonDecode(json);
    if (json is Map) {
      data = jsonDecode(jsonEncode(json));
    }
    if (data['data'] is Map) {
      if (data['data'].isEmpty) {
        model = GeetestSecondValidatePostRespModel.fromJson({"data": {}});
      } else {
        model = GeetestSecondValidatePostRespModel.fromJson(data['data']);
      }
    } else {
      model =
          GeetestSecondValidatePostRespModel.fromJson({"data": data['data']});
    }

    if (success != null) {
      if (success is Function(GeetestSecondValidatePostRespModel data)) {
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
