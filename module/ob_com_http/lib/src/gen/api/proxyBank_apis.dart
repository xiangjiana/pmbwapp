import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/proxyBank/proxyBank_addBank_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxyBank/proxyBank_addBank_post_req_model.dart';

class ProxyBankApis {
  static void proxyBankAddBankPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyBankAddBankPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyBank/addBank',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyBankAddBankPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyBankAddBankPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
