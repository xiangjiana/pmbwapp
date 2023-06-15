import 'package:ob_com_http/src/adaptor/config/config_getProxyCode_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/config/config_getProxyCode_post_req_model.dart';
import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/config/config_appVersionCheck_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/config/config_appVersionCheck_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/config/config_banner_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/config/config_banner_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/config/config_startPage_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/config/config_startPage_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/config/config_announcement_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/config/config_announcement_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/config/config_publicResources_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/config/config_publicResources_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/config/config_depositConfig_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/config/config_clientConfigAll_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/config/config_clientConfigAll_post_req_model.dart';

import '../../adaptor/config/config_customerAddr_post_resp_adaptor.dart';

class ConfigApis {
  static void configAppVersionCheckPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ConfigAppVersionCheckPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/appVersionCheck',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ConfigAppVersionCheckPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigAppVersionCheckPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void configBannerPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ConfigBannerPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/banner',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ConfigBannerPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigBannerPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void configStartPagePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ConfigStartPagePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/startPage',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ConfigStartPagePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigStartPagePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void configAnnouncementPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ConfigAnnouncementPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/announcement',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ConfigAnnouncementPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigAnnouncementPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void configPublicResourcesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ConfigPublicResourcesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/publicResources',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ConfigPublicResourcesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigPublicResourcesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }


  static void configCustomerAddrPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/config/customerAddr',
      options: options,
      info: info,
      success: (Response r) {
        ConfigCustomerAddrPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigCustomerAddrPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void configDepositConfigPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/config/depositConfig',
      options: options,
      info: info,
      success: (Response r) {
        ConfigDepositConfigPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigDepositConfigPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void configClientConfigAllPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ConfigClientConfigAllPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/clientConfigAll',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ConfigClientConfigAllPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigClientConfigAllPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }


  static void configGetProxyCodePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ConfigGetProxyCodePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/getProxyCode',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ConfigGetProxyCodePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ConfigGetProxyCodePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
