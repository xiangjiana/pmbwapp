import 'dart:async';

import 'package:ob_com_http/src/gen/api/invite_apis.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteConfig_post_resp_model.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteNotification_post_resp_model.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteRecords_post_resp_model.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_rebateRecords_post_resp_model.dart';

class InviteRecordRepository {
  Future<InviteInviteNotificationPostRespModel> getInviteNotification(int type) {
    final completer = Completer<InviteInviteNotificationPostRespModel>();
    InviteApis.inviteInviteNotificationPost(
      parameters: {
        'type': type,
      },
      success: (InviteInviteNotificationPostRespModel resp) {
        completer.complete(resp);
      },
      fail: (int code, String message) {
        completer.completeError(message);
      },
    );
    return completer.future;
  }

  Future<InviteInviteConfigPostRespModel> getInviteInviteConfigPost() {
    final completer = Completer<InviteInviteConfigPostRespModel>();
    InviteApis.inviteInviteConfigPost(
      success: (InviteInviteConfigPostRespModel resp) {
        completer.complete(resp);
      },
      fail: (int code, String message) {
        completer.completeError(message);
      },
    );
    return completer.future;
  }

  // 邀请记录状态 1.未达标 2.已失效 3.审核中 4.已拒绝(已取消) 5.待领取 6.已领取 7.已过期;
  Future<InviteInviteRecordsPostRespModel> getInviteRecords(
      String status, int pageNum,
      {int pageSize = 20}) {
    final completer = Completer<InviteInviteRecordsPostRespModel>();
    InviteApis.inviteInviteRecordsPost(
      parameters: {
        'queryCondition': {'status': '$status'}, //查询类型:1=通知 2=活动消息
        "pageNum": pageNum,
        "pageSize": pageSize
      },
      success: (InviteInviteRecordsPostRespModel resp) {
        completer.complete(resp);
      },
      fail: (int code, String message) {
        completer.completeError(message);
      },
    );
    return completer.future;
  }

  // 返利记录状态 1.未达标 2.进行中 3.已过期
  Future<InviteRebateRecordsPostRespModel> getInviteRebateRecords(
      String status, int pageNum,
      {int pageSize = 20}) {
    final completer = Completer<InviteRebateRecordsPostRespModel>();
    InviteApis.inviteRebateRecordsPost(
      parameters: {
        'queryCondition': {'status': '$status'}, //查询类型:1=通知 2=活动消息
        "pageNum": pageNum,
        "pageSize": pageSize
      },
      success: (InviteRebateRecordsPostRespModel resp) {
        completer.complete(resp);
      },
      fail: (int code, String message) {
        completer.completeError(message);
      },
    );
    return completer.future;
  }
}
