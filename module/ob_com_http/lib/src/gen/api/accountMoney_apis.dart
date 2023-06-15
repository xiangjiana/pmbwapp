import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/accountMoney/accountMoney_gameOne_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/accountMoney/accountMoney_gameOne_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/accountMoney/accountMoney_merchantGame_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/accountMoney/accountMoney_noTransfer_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/accountMoney/accountMoney_noTransfer_post_req_model.dart';

class AccountMoneyApis {
  static void accountMoneyGameOnePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is AccountMoneyGameOnePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/accountMoney/balance/gameOne',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        AccountMoneyGameOnePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccountMoneyGameOnePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void accountMoneyMerchantGamePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/main/venueByMerchant',
      options: options,
      info: info,
      success: (Response r) {
        AccountMoneyMerchantGamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccountMoneyMerchantGamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void accountMoneyNoTransferPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is AccountMoneyNoTransferPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/capital/noTransfer',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        AccountMoneyNoTransferPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        AccountMoneyNoTransferPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
