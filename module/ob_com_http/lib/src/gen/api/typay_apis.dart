import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/typay/typay_getExchanget_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/typay/typay_depositview_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/typay/typay_depositview_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/typay/typay_getVirtualRate_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/typay/typay_withdraws_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/typay/typay_withdraws_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/typay/typay_banks_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/typay/typay_banks_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/typay/typay_list_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/typay/typay_list_post_req_model.dart';

class TypayApis {
  static void typayGetExchangetPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/typay/deposit/getExchange',
      options: options,
      info: info,
      success: (Response r) {
        TypayGetExchangetPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        TypayGetExchangetPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void typayDepositviewPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is TypayDepositviewPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/typay/deposit/view',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        TypayDepositviewPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        TypayDepositviewPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  ///汇率类型 1-会员存款 2-会员取款 3-代理存款 4-代理取款
  static void typayGetVirtualRatePost({
    required int virtualRateType,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/wallet/getVirtualRate',
      options: options,
      info: info,
      params: {'virtualRateType': virtualRateType},
      success: (Response r) {
        TypayGetVirtualRatePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        TypayGetVirtualRatePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void typayWithdrawsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is TypayWithdrawsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/typay/withdraw/list',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        TypayWithdrawsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        TypayWithdrawsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void typayBanksPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is TypayBanksPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/typay/deposit/banks',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        TypayBanksPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        TypayBanksPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void typayListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is TypayListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/typay/deposit/list',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        TypayListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        TypayListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
