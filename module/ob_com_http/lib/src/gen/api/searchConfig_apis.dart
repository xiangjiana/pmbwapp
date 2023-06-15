import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/searchConfig/searchConfig_list_post_resp_adaptor.dart';

class SearchConfigApis {
  static void searchConfigListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/searchConfig/list',
      options: options,
      info: info,
      success: (Response r) {
        SearchConfigListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        SearchConfigListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
