import 'package:repository/adaptor/domain_name_config_post_resp_adaptor.dart';
import 'package:repository/adaptor/heartbeat_post_resp_adaptor.dart';
import 'package:repository/gen/mod/domain_name_config_post_req_model.dart';

import '../../utils/net.dart';
import 'package:dio/dio.dart';

class DomainNameApis {
  static void domainNameConfigPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is DomainNameConfigPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/config/domainNameConfigQueryList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        DomainNameConfigPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DomainNameConfigPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void heartbeat({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/user/heartbeat',
      options: options,
      info: info,
      success: (Response r) {
        HeartbeatPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        HeartbeatPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
