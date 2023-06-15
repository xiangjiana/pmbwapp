import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/userBank/userBank_query_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/userBank/userBank_query_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/userBank/userBank_isVerified_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/userBank/userBank_isVerified_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/userBank/userBank_addBank_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/userBank/userBank_addBank_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/userBank/userBank_addVirtual_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/userBank/userBank_addVirtual_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/userBank/userBank_verifiTwoElement_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/userBank/userBank_verifiTwoElement_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/userBank/userBank_sendMessages_post_resp_adaptor.dart';

import '../../adaptor/userBank/userBank_bankManage_post_resp_adaptor.dart';

class UserBankApis {
  static void userBankQueryPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserBankQueryPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/bank/query',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserBankQueryPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserBankQueryPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userBankIsVerifiedPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserBankIsVerifiedPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/bank/isVerified',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserBankIsVerifiedPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserBankIsVerifiedPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userBankAddBankPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserBankAddBankPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/bank/addBank',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserBankAddBankPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserBankAddBankPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userBankAddVirtualPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserBankAddVirtualPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/bank/addVirtual',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserBankAddVirtualPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserBankAddVirtualPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userBankVerifiTwoElementPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is UserBankVerifiTwoElementPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/bank/verifiTwoElement',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserBankVerifiTwoElementPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserBankVerifiTwoElementPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void getManagerBankList({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/wallet/getManagerBankList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserBankManagePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
       UserBankManagePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userBankSendMessagesPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/common/sendCodeWithoutPhone',
      options: options,
      info: info,
      success: (Response r) {
        UserBankSendMessagesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserBankSendMessagesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
