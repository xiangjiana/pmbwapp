import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/homeapi/homeapi_homeapi_post_resp_adaptor.dart';

class HomeapiApis {
  static void homeapiHomeapiPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/common/getCountryName',
      options: options,
      info: info,
      success: (Response r) {
        HomeapiHomeapiPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        HomeapiHomeapiPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
