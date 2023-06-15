import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/activityInvite/invite_checkInviteActivityEntry_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/activityInvite/invite_inviteConfig_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/activityInvite/invite_inviteNotification_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/activityInvite/invite_inviteRecords_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/activityInvite/invite_rebateRecords_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteNotification_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteRecords_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_rebateRecords_post_req_model.dart';
import 'package:repository/utils/net.dart';

class InviteApis {
  static void inviteCheckInviteActivityEntryPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/activityInvite/checkInviteActivityEntry',
      options: options,
      info: info,
      success: (Response r) {
        InviteCheckInviteActivityEntryPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        InviteCheckInviteActivityEntryPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void inviteInviteConfigPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/activityInvite/inviteConfig',
      options: options,
      info: info,
      success: (Response r) {
        InviteInviteConfigPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        InviteInviteConfigPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void inviteInviteRecordsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is InviteInviteRecordsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/activityInvite/inviteRecords',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        InviteInviteRecordsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        InviteInviteRecordsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void inviteInviteNotificationPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is InviteInviteNotificationPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/activityInvite/notification',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        InviteInviteNotificationPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        InviteInviteNotificationPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void inviteRebateRecordsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is InviteRebateRecordsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/activityInvite/rebateRecords',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        InviteRebateRecordsPostRespAdaptor.onSuccess(
          r.data,
          success,
          r.statusCode,
          r.headers.value('exp') == null
              ? 0
              : int.parse(r.headers.value('exp')!),
        );
      },
      fail: (int code, String msg) {
        InviteRebateRecordsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
