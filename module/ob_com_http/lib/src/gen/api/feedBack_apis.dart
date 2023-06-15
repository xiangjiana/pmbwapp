import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/feedBack/feedBack_addFeedBack_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/feedBack/feedBack_feedBackList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/feedBack/feedBack_langugeList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/feedBack/feedBack_addFeedBack_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/feedBack/feedBack_feedBackList_post_req_model.dart';
import 'package:repository/utils/net.dart';

class FeedBackApis {
  static void feedBackFeedBackListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is FeedBackFeedBackListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/setting/feedBackList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        FeedBackFeedBackListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        FeedBackFeedBackListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void feedBackAddFeedBackPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is FeedBackAddFeedBackPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/setting/addFeedBack',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        FeedBackAddFeedBackPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        FeedBackAddFeedBackPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void languageListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/setting/languageList',
      options: options,
      info: info,
      success: (Response r) {
        FeedBackLanguageListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        FeedBackLanguageListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
