import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/bonusMsg/bonusMsg_select_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/bonusMsg/bonusMsg_select_post_req_model.dart';

class BonusMsgApis {
  static void bonusMsgSelectPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is BonusMsgSelectPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/bonusMsg/select',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        BonusMsgSelectPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        BonusMsgSelectPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
