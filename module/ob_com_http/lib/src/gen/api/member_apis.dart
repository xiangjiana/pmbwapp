import 'package:ob_com_http/src/adaptor/member/member_setNewPassWord_post_resp_adaptor.dart';
import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/member/member_isVerified_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_isVerified_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_resetPassWord_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_resetPassWord_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_sendMobileMessages_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_sendMobileMessages_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_passwordUpdate_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_passwordUpdate_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_clientAddress_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_clientAddress_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_checkUser_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_checkUser_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_recoverPassword_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_recoverPassword_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_verificationCodeLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/member/member_verificationCodeLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/member/member_memberInfoAll_post_resp_adaptor.dart';

class MemberApis {
  static void memberIsVerifiedPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is MemberIsVerifiedPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/isVerified',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberIsVerifiedPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberIsVerifiedPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberResetPassWordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is MemberResetPassWordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/resetPassWord',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberResetPassWordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberResetPassWordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberSendMobileMessagesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is MemberSendMobileMessagesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/sendMobileMessages',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberSendMobileMessagesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberSendMobileMessagesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberPasswordUpdatePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is MemberPasswordUpdatePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/password/update',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberPasswordUpdatePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberPasswordUpdatePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberSetNewPassword({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is MemberPasswordUpdatePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/setNew',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberSetNewPasswordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberSetNewPasswordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberClientAddressPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is MemberClientAddressPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/clientAddress',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberClientAddressPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberClientAddressPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberCheckUserPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is MemberCheckUserPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/checkUser',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberCheckUserPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberCheckUserPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberRecoverPasswordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is MemberRecoverPasswordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/recoverPassword',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberRecoverPasswordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberRecoverPasswordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberVerificationCodeLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is MemberVerificationCodeLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/verificationCodeLogin',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MemberVerificationCodeLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberVerificationCodeLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void memberMemberInfoAllPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/user/infoAll',
      options: options,
      info: info,
      success: (Response r) {
        MemberMemberInfoAllPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MemberMemberInfoAllPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
