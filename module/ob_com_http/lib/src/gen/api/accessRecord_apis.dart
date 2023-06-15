import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/accessRecord/accessRecord_withdrawal_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/accessRecord/accessRecord_withdrawal_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/accessRecord/accessRecord_deposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/accessRecord/accessRecord_deposit_post_req_model.dart';

class AccessRecordApis {
  static void accessRecordWithdrawalPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is AccessRecordWithdrawalPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/accessRecord/withdrawal',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        AccessRecordWithdrawalPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccessRecordWithdrawalPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void accessRecordDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is AccessRecordDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/accessRecord/deposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        AccessRecordDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccessRecordDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
