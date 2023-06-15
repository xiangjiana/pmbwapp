import 'dart:async';

import 'package:get/get.dart';
import 'package:message/message.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';

class MessageCenterMsgRepository {
  final messageApi = Get.find<MessageApi>();

  Future<BwMessageNoticeDetailPageResponse> getNoticeMessage(
      String messageType, int pageNum,
      {int pageSize = 20}) async {
    try {
      return messageApi.selectNoticeList(
        NoticeListParam(
          type: messageType, //查询类型:1=通知 2=活动消息
          pageNum: pageNum,
          pageSize: pageSize,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<RespectiveUnReadAmount> messageSelectRespectiveUnReadAmount() async {
    try {
      return messageApi.selectRespectiveUnReadAmount();
    } catch (e) {
      return Future.error(e);
    }
  }

  //messageCenterSelectAnnouncementListPost
  Future<BwMessageAnnouncementPageResponse> getAnnouncementMessage(int pageNum,
      {int pageSize = 20}) async {
    try {
      return messageApi.selectAnnouncementList(
        PageParam(
          pageNum: pageNum,
          pageSize: pageSize,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  //获取红利
  Future<BwMessageBonusDetailPageResponse> getBonus(int pageNum,
      {int pageSize = 20}) async {
    try {
      return messageApi.selectBonusList(
        PageParam(
          pageNum: pageNum,
          pageSize: pageSize,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> updateMessageStatus(List<String> messageId, int msgType) async {
    try {
      return messageApi.updateMessageStatus(
        MessageReadParam(
          messageIds: messageId,
          messageType: msgType,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> deleteMessagePost(List<int> messageIds) async {
    try {
      // List<int> messageIds= [];
      // messageIds.add(messageId);
      return messageApi.deleteMessage(
        MessageDeleteParam(messageIds: messageIds),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  //获取红利
  Future<bool> discountReceiveDiscountPost(List<String> messageId) async {
    try {
      return messageApi.receiveDiscount(
        ReceiveDisCountParam(receiveDisCountListReqDTOList: messageId),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}
