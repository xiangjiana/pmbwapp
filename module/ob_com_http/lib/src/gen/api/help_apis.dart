import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/help/help_all_post_resp_adaptor.dart';

class HelpApis {
  static void helpAllPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/help/all',
      options: options,
      info: info,
      success: (Response r) {
        HelpAllPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        HelpAllPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
