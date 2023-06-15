import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectAllUnReadAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_deleteMessage_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/messageCenter/messageCenter_deleteMessage_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectAnnouncementList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/messageCenter/messageCenter_selectAnnouncementList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_hasUnReceivedBonus_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectBonusList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/messageCenter/messageCenter_selectBonusList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectRespectiveUnReadAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectBonusUnReadAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectNoticeList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/messageCenter/messageCenter_selectNoticeList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectAnnounceList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectAnnouncementUnReadAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_updateMessageStatus_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/messageCenter/messageCenter_updateMessageStatus_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/messageCenter/messageCenter_selectNoticeUnReadAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/messageCenter/messageCenter_selectNoticeUnReadAmount_post_req_model.dart';
import '../../adaptor/main/game_queryMerchantList_post_resp_adaptor.dart';

import '../../adaptor/messageCenter/message_selectRespectiveUnReadAmount_post_resp_adaptor.dart';

class MessageCenterApis {
  static void messageCenterSelectAllUnReadAmountPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/message/selectAllUnReadAmount',
      options: options,
      info: info,
      success: (Response r) {
        MessageCenterSelectAllUnReadAmountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterSelectAllUnReadAmountPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void messageCenterDeleteMessagePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is MessageCenterDeleteMessagePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/message/deleteMessage',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MessageCenterDeleteMessagePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterDeleteMessagePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void messageCenterSelectAnnouncementListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is MessageCenterSelectAnnouncementListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/message/selectAnnouncementList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MessageCenterSelectAnnouncementListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterSelectAnnouncementListPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void messageCenterHasUnReceivedBonusPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/message/hasUnReceivedBonus',
      options: options,
      info: info,
      success: (Response r) {
        MessageCenterHasUnReceivedBonusPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterHasUnReceivedBonusPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void messageCenterSelectBonusListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is MessageCenterSelectBonusListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/message/selectBonusList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MessageCenterSelectBonusListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterSelectBonusListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void messageCenterSelectRespectiveUnReadAmountPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/message/selectRespectiveUnReadAmount',
      options: options,
      info: info,
      success: (Response r) {
        MessageCenterSelectRespectiveUnReadAmountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterSelectRespectiveUnReadAmountPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void messageCenterSelectNoticeListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is MessageCenterSelectNoticeListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/message/selectNoticeList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MessageCenterSelectNoticeListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterSelectNoticeListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void mainMerchantGameListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/main/venueList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryMerchantListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryMerchantListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void mainMessageCenterSelectAnnounceListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/main/selectAnnounceList',
      options: options,
      info: info,
      success: (Response r) {
        MessageCenterSelectAnnounceListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterSelectAnnounceListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void messageCenterSelectAnnounceListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/message/selectAnnouncementList',
      options: options,
      info: info,
      success: (Response r) {
        MessageCenterSelectAnnounceListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterSelectAnnounceListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void messageSelectRespectiveUnReadAmount({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/message/selectRespectiveUnReadAmount',
      options: options,
      info: info,
      success: (Response r) {
        MessageSelectRespectiveUnReadAmountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageSelectRespectiveUnReadAmountPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void messageCenterUpdateMessageStatusPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is MessageCenterUpdateMessageStatusPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/message/updateMessageStatus',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        MessageCenterUpdateMessageStatusPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        MessageCenterUpdateMessageStatusPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
