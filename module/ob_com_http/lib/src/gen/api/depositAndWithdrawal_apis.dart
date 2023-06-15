import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/depositAndWithdrawal/depositAndWithdrawal_selectDeposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/depositAndWithdrawal/depositAndWithdrawal_selectDeposit_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/depositAndWithdrawal/depositAndWithdrawal_selectWithdrawal_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/depositAndWithdrawal/depositAndWithdrawal_selectWithdrawal_post_req_model.dart';

class DepositAndWithdrawalApis {
  static void depositAndWithdrawalSelectDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is DepositAndWithdrawalSelectDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/records/selectDeposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        DepositAndWithdrawalSelectDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DepositAndWithdrawalSelectDepositPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void depositAndWithdrawalSelectWithdrawalPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is DepositAndWithdrawalSelectWithdrawalPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/records/selectWithdrawal',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        DepositAndWithdrawalSelectWithdrawalPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DepositAndWithdrawalSelectWithdrawalPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }
}
