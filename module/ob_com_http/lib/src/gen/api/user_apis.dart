import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/user/user_balance_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_cancelDeposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_depositDetail_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_deposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_flowDetails_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_login_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_member_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_register_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_thirdPartyLoginSdk_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_tryMemberLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/user/user_withdraw_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/user/user_cancelDeposit_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/user/user_depositDetail_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/user/user_deposit_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/user/user_login_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/user/user_register_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/user/user_withdraw_post_req_model.dart';
import 'package:repository/utils/net.dart';

class UserApis {
  static void userDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/userDeposit/user/deposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userTryMemberLoginPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/tryMemberLogin',
      options: options,
      info: info,
      success: (Response r) {
        UserTryMemberLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserTryMemberLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  ///美播试玩，url不一样
  static void userTryMemberLoginPost2({
    Map<String, dynamic>? info,
    Map<String, dynamic>? params,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/sign/tryMemberLogin',
      options: options,
      info: info,
      params: params,
      success: (Response r) {
        UserTryMemberLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserTryMemberLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userMemberPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/user/info',
      options: options,
      info: info,
      success: (Response r) {
        UserMemberPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserMemberPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userCancelDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserCancelDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/userDeposit/user/cancelDeposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserCancelDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserCancelDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userRegisterPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserRegisterPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/register',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserRegisterPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserRegisterPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userDepositDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserDepositDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/userDeposit/user/depositDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserDepositDetailPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserDepositDetailPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userWithdrawPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserWithdrawPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/wallet/user/withdraw',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserWithdrawPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserWithdrawPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userBalancePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      // '/userWithdraw/user/cash/balance',
      '/capital/balanceWithBilling',
      options: options,
      info: info,
      success: (Response r) {
        UserBalancePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserBalancePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userFlowDetailsPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/wallet/user/flowDetails',
      options: options,
      info: info,
      success: (Response r) {
        UserFlowDetailsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserFlowDetailsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userThirdPartyLoginSdkPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/sign/thirdPartyLoginSdk',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserThirdPartyLoginSdkPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserThirdPartyLoginSdkPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
