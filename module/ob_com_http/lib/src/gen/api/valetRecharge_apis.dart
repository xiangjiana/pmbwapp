import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/valetRecharge/valetRecharge_generateRecharge_post_resp_adaptor.dart';

class ValetRechargeApis {
  static void valetRechargeGenerateRechargePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/valetRecharge/generateRecharge',
      options: options,
      info: info,
      success: (Response r) {
        ValetRechargeGenerateRechargePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ValetRechargeGenerateRechargePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
