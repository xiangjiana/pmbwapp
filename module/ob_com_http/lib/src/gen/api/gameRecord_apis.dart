import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/gameRecord/gameRecord_queryAll_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/gameRecord/gameRecord_queryGame_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/gameRecord/gameRecord_queryAll_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/gameRecord/gameRecord_queryGame_post_req_model.dart';
import 'package:repository/utils/net.dart';

class GameRecordApis {
  static void gameRecordQueryGamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameRecordQueryGamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/records/query/game',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameRecordQueryGamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameRecordQueryGamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameRecordQueryAllPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameRecordQueryAllPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/records/query/all',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameRecordQueryAllPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameRecordQueryAllPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
