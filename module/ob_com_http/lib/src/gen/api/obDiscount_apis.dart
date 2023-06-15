import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/obDiscount/obDiscount_config_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/obDiscount/obDiscount_config_post_req_model.dart';

class ObDiscountApis {
  static void obDiscountConfigPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ObDiscountConfigPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/obDiscount/query/config',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ObDiscountConfigPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ObDiscountConfigPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
