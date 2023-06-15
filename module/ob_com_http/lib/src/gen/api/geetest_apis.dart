import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/geetest/geetest_firstRegister_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/geetest/geetest_secondValidate_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/geetest/geetest_secondValidate_post_req_model.dart';

class GeetestApis {
  static void geetestFirstRegisterPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/common/firstRegister',
      options: options,
      info: info,
      success: (Response r) {
        GeetestFirstRegisterPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GeetestFirstRegisterPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void geetestSecondValidatePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GeetestSecondValidatePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/common/secondValidate',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GeetestSecondValidatePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GeetestSecondValidatePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
