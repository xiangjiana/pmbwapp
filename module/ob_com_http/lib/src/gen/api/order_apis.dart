import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/order/order_deposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/order/order_deposit_post_req_model.dart';

class OrderApis {
  static void orderDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is OrderDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/order/deposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        OrderDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        OrderDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
