import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/vip/vip_queryVipGrade_post_resp_adaptor.dart';

class VipApis {
  static void vipQueryVipGradePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/memberVipGrade/queryVipGrade',
      options: options,
      info: info,
      success: (Response r) {
        VipQueryVipGradePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        VipQueryVipGradePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
