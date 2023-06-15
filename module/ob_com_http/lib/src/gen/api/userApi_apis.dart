import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_addOverflowMember_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_emailBinding_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_phoneBinding_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_selectMemberAccount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_selectMemberWithdrawAbleInfo_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_selectVipInfo_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_selectVipLevel_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_sendEmailCode_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_sendPhoneCode_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_supportPhoneCode_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_updateBirth_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_updateGender_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_updateRealName_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/userApi/userApi_uploadSubmit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_addOverflowMember_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_emailBinding_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_phoneBinding_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_selectMemberAccount_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_selectVipInfo_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_selectVipLevel_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_sendEmailCode_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_sendPhoneCode_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_updateBirth_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_updateGender_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_updateRealName_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/userApi/userApi_uploadSubmit_post_req_model.dart';
import 'package:repository/utils/net.dart';

class UserApiApis {
  static void userApiSendPhoneCodePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiSendPhoneCodePostReqModel) {
      parameters = parameters.toJson();
    }
    Net().post(
      '/common/sendCodeWithPhone',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiSendPhoneCodePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiSendPhoneCodePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiSupportPhoneCodePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/supportPhoneCode',
      options: options,
      info: info,
      success: (Response r) {
        UserApiSupportPhoneCodePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiSupportPhoneCodePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiUploadSubmitPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiUploadSubmitPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/user/uploadSubmit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiUploadSubmitPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiUploadSubmitPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiUpdateRealNamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiUpdateRealNamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/user/updateRealName',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiUpdateRealNamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiUpdateRealNamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiAddOverflowMemberPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is UserApiAddOverflowMemberPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/userApi/addOverflowMember',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiAddOverflowMemberPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiAddOverflowMemberPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiSelectMemberWithdrawAbleInfoPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/wallet/selectMemberWithdrawAbleInfo',
      options: options,
      info: info,
      success: (Response r) {
        UserApiSelectMemberWithdrawAbleInfoPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiSelectMemberWithdrawAbleInfoPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void userApiSendEmailCodePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiSendEmailCodePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/user/sendEmailCode',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiSendEmailCodePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiSendEmailCodePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiUpdateBirthPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiUpdateBirthPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/user/updateBirth',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiUpdateBirthPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiUpdateBirthPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiUpdateGenderPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiUpdateGenderPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/user/updateGender',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiUpdateGenderPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiUpdateGenderPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiSelectVipInfoPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiSelectVipInfoPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/vip/selectVipInfo',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiSelectVipInfoPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiSelectVipInfoPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiSelectMemberAccountPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is UserApiSelectMemberAccountPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/records/selectMemberAccount',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiSelectMemberAccountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiSelectMemberAccountPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiSelectVipLevelPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiSelectVipLevelPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/vip/selectVipLevel',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiSelectVipLevelPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiSelectVipLevelPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiPhoneBindingPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiPhoneBindingPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/user/phoneBinding',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiPhoneBindingPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiPhoneBindingPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void userApiEmailBindingPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is UserApiEmailBindingPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/user/emailBinding',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        UserApiEmailBindingPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        UserApiEmailBindingPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
