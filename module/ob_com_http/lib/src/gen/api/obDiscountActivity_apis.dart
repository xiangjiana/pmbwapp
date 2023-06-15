import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/obDiscountActivity/obDiscountActivity_queryDiscountActivity_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/obDiscountActivity/obDiscountActivity_queryDiscountActivity_post_req_model.dart';

class ObDiscountActivityApis {
  static void obDiscountActivityQueryDiscountActivityPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ObDiscountActivityQueryDiscountActivityPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/obDiscountActivity/queryDiscountActivity',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ObDiscountActivityQueryDiscountActivityPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ObDiscountActivityQueryDiscountActivityPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }
}
