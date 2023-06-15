import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/gameModule/gameModule_recommend_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/gameModule/gameModule_getGameConfigAll_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/gameModule/gameModule_getGameModule_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/gameModule/gameModule_collect_post_resp_adaptor.dart';

class GameModuleApis {
  static void gameModuleRecommendPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/gameModule/recommend',
      options: options,
      info: info,
      success: (Response r) {
        GameModuleRecommendPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameModuleRecommendPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameModuleGetGameConfigAllPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/gameModule/getGameConfigAll',
      options: options,
      info: info,
      success: (Response r) {
        GameModuleGetGameConfigAllPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameModuleGetGameConfigAllPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameModuleGetGameModulePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/gameModule/getGameModule',
      options: options,
      info: info,
      success: (Response r) {
        GameModuleGetGameModulePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameModuleGetGameModulePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameModuleCollectPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/gameModule/collect',
      options: options,
      info: info,
      success: (Response r) {
        GameModuleCollectPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameModuleCollectPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
