import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/account/account_game_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/account/account_game_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/account/account_noTransfer_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/account/account_noTransfer_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/account/account_balance_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/account/account_balance_post_req_model.dart';

class AccountApis {
  static void accountGamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is AccountGamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/account/balance/game',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        AccountGamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccountGamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void accountNoTransferPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is AccountNoTransferPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/capital/noTransfer',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        AccountNoTransferPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccountNoTransferPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void accountBalancePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is AccountBalancePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/account/balance',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        AccountBalancePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccountBalancePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
