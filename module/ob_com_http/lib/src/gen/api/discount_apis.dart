import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/discount/discount_discountActivity_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/discount/discount_discountActivity_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/discount/discount_tag_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/discount/discount_activityType_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/discount/discount_receiveDiscount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/discount/discount_receiveDiscount_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/discount/discount_sponsor_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/discount/discount_sponsor_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/discount/discount_vip_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/discount/discount_vip_post_req_model.dart';

class DiscountApis {

  static void discountActivityTypePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/activity/activityType',
      options: options,
      info: info,
      success: (Response r) {
        DiscountActivityTypePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DiscountActivityTypePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void discountReceiveDiscountPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is DiscountReceiveDiscountPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/message/receiveDiscount',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        DiscountReceiveDiscountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DiscountReceiveDiscountPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void discountSponsorPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is DiscountSponsorPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/activity/sponsor',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        DiscountSponsorPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DiscountSponsorPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void discountVipPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is DiscountVipPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/activity/vip',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        DiscountVipPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DiscountVipPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
