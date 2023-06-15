import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/gameDeposit/gameDeposit_streamDetails_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/gameDeposit/gameDeposit_streamDetails_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/gameDeposit/gameDeposit_deposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/gameDeposit/gameDeposit_deposit_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/gameDeposit/gameDeposit_depositCount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/gameDeposit/gameDeposit_depositCount_post_req_model.dart';

class GameDepositApis {
  static void gameDepositStreamDetailsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameDepositStreamDetailsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/records/streamDetails',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameDepositStreamDetailsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameDepositStreamDetailsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameDepositDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameDepositDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/gameDeposit/deposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameDepositDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameDepositDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameDepositDepositCountPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameDepositDepositCountPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/wallet/depositCount',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameDepositDepositCountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameDepositDepositCountPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
