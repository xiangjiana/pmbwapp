import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/firstDeposit/firstDeposit_activityDeposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/firstDeposit/firstDeposit_activityDeposit_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/firstDeposit/firstDeposit_getUserVipActivityInfo_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/firstDeposit/firstDeposit_getUserVipActivityInfo_post_req_model.dart';

class FirstDepositApis {
  static void firstDepositActivityDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is FirstDepositActivityDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/activity/firstDeposit/activityDeposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        FirstDepositActivityDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        FirstDepositActivityDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void firstDepositGetUserVipActivityInfoPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is FirstDepositGetUserVipActivityInfoPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/activity/firstDeposit/getUserVipActivityInfo',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        FirstDepositGetUserVipActivityInfoPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        FirstDepositGetUserVipActivityInfoPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }
}
