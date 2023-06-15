import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/zr/zr_topImagesGetTopImages_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/zr/zr_depositWithdrawUserAllBalance_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/zr/zr_depositWithdrawSelect_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/zr/zr_topImagesSetCurrentTopImages_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/zr/zr_topImagesSetCurrentTopImages_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/zr/zr_topImagesDeleteImages_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/zr/zr_topImagesDeleteImages_post_req_model.dart';

class ZrApis {
  static void zrTopImagesGetTopImagesPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/meibo/getTopImages',
      options: options,
      info: info,
      success: (Response r) {
        ZrTopImagesGetTopImagesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ZrTopImagesGetTopImagesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void zrDepositWithdrawUserAllBalancePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/meibo/user/allBalance',
      options: options,
      info: info,
      success: (Response r) {
        ZrDepositWithdrawUserAllBalancePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ZrDepositWithdrawUserAllBalancePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void zrDepositWithdrawSelectPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/meibo/select',
      options: options,
      info: info,
      success: (Response r) {
        ZrDepositWithdrawSelectPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ZrDepositWithdrawSelectPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void zrTopImagesSetCurrentTopImagesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ZrTopImagesSetCurrentTopImagesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/meibo/setCurrentTopImages',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ZrTopImagesSetCurrentTopImagesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ZrTopImagesSetCurrentTopImagesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void zrTopImagesDeleteImagesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ZrTopImagesDeleteImagesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/meibo/deleteImages',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ZrTopImagesDeleteImagesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ZrTopImagesDeleteImagesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
