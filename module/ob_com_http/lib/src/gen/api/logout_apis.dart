import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/logout/logout_member_post_resp_adaptor.dart';

class LogoutApis {
  static void logoutMemberPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/main/logout',
      options: options,
      info: info,
      success: (Response r) {
        LogoutMemberPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        LogoutMemberPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
