import 'package:ob_com_http/src/adaptor/common/kv_config_value_list_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/common/kv_config_value_list_post_req_model.dart';
import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';

import '../../adaptor/common/common_getSystemConfigurationValue_post_resp_adaptor.dart';
import '../mod/common/common_getSystemConfigurationValue_post_req_model.dart';


class CommonApis {
  static void getKvConfigValueListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is KvConfigValueListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/common/getKvConfigValueList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        KvConfigValueListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        KvConfigValueListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void commonGetSystemConfigurationValuePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is CommonGetSystemConfigurationValuePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/common/getSystemConfigurationValue',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        CommonGetSystemConfigurationValuePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        CommonGetSystemConfigurationValuePostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }
}