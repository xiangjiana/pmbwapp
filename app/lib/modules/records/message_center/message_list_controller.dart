import 'dart:async';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:models/models.dart' hide PageResponse;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/message_center/components/message_detail.dart';
import 'package:ob_package/modules/records/message_center/repository/message_center_msg_repository.dart';
import 'package:ob_package/modules/records/message_center/repository/ui_message.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_component/ob_component.dart';

import 'member_message_controller.dart';

typedef Request = Future<List<UiMessage>> Function();

class MessageListController extends GetxController with ObPageController<UiMessage> {
  final MessageCenterMsgRepository repository;
  final String msgType, msgIcon, tag;
  late Mode modeCurrent = Mode.DISPLAY;
  StreamSubscription<Mode>? stream;
  List<String> deleteId=[];
  MemberMessageController? get parentController =>
      Get.isRegistered<MemberMessageController>()
          ? Get.find<MemberMessageController>()
          : null;

  bool get isSelectedAll =>
      data?.record.where((element) => element.selected).length ==
      data?.record.length;

  MessageListController(
      this.repository, this.msgType, this.msgIcon, this.tag, BuildContext ctx) {
    stream = parentController?.rxMode.listen((mode) {
      final index = parentController?.tabController.index ?? -1;
      if (tag != '$index') return;
      switch (mode) {
        case Mode.DISPLAY:
          data = data?.copyWith(
              record: data?.record
                  .map((e) => e.copyWith(mode: Mode.DISPLAY))
                  .toList());
          toggle(Mode.DISPLAY);
          // Get.back();
          break;
        case Mode.EDITABLE:
          data = data?.copyWith(
              record: data?.record
                  .map((e) => e.copyWith(mode: Mode.EDITABLE))
                  .toList());
          toggle(Mode.EDITABLE);
          // _showBottomSheet(ctx);
          break;
      }
    });
  }

  @override
  Future<PageResponse<UiMessage>> getPageList(int page) {
    if (tag == '2') {
      //公告
      return addUiBulletin(page);
    } else {
      //通知 活动 同一个接口
      //查询类型:1=通知 2=活动消息
      return addUiMsg(page);
    }
  }

  Future<PageResponse<UiMessage>> addUiMsg(int page) async {
    BwMessageNoticeDetailPageResponse resp = await repository.getNoticeMessage(msgType, page);
    var uiMessage = resp.record.map((e) {

      UiMessage uiMessage=UiMessage(
        e.id,
        msgIcon,
        e.title,
        e.content,
        modeCurrent,
        false,
        e.isRead == 1,
        e.createdAt,
        tag == '2',
      );

     return uiMessage;
    }).toList();

    for(int i=0;i<uiMessage.length;i++) {
        bool isDelete=findByDeleteId(uiMessage[i]);
        uiMessage.remove(i);
    }
    return PageResponse<UiMessage>(resp.pageNum, resp.pageSize, uiMessage, resp.totalPage, resp.totalRecord);
  }
  bool findByDeleteId( UiMessage uiMessage){
    for(int i=0;i<deleteId.length;i++) {
      return uiMessage.id==deleteId[i];
  }
    return false;

  }
  Future<PageResponse<UiMessage>> addUiBulletin(int page) async {
    BwMessageAnnouncementPageResponse resp = await repository.getAnnouncementMessage(page);
    var uiMessage = resp.record.map((e) {
      return UiMessage(
        e.id,
        msgIcon,
        e.title,
        e.content,
        modeCurrent,
        false,
        e.isRead == 1,
        e.upTime,
        tag == '2',
      );
    }).toList();
    return PageResponse<UiMessage>(resp.pageNum, resp.pageSize, uiMessage, resp.totalPage, resp.totalRecord);
  }

  void _selectAll() {
    if (isSelectedAll) {
      data = data?.copyWith(
          record:
              data?.record.map((e) => e.copyWith(selected: false)).toList());
    } else {
      data = data?.copyWith(
          record: data?.record.map((e) => e.copyWith(selected: true)).toList());
    }
  }

  void onItemClick(int index) {
    UiMessage? indexedItem = data?.record[index];
    if (parentController?.mode == Mode.EDITABLE) {
      indexedItem = indexedItem!.copyWith(selected: !indexedItem.selected);
    } else {
      indexedItem = indexedItem!.copyWith(isRead: true);
      updateMessageStatus([indexedItem.id], [indexedItem], 1);
      Get.to(MessageDetail(
          message: indexedItem, deleteClick: deleteSingle, flag: tag != '2'))?.then((value){
        deleteId.add("${indexedItem?.id}");
      });
    }

    data?.record[index] = indexedItem;
    parentController?.onRenewCount();
    update();
  }

  void _markRead() {
    final selected = data?.record.where((e) => e.selected).toList() ?? [];
    List<String> messageId = selected.map((e) {
      return e.id;
    }).toList();
    if (messageId.length <= 0) {
      parentController?.onRenewCount();
      parentController?.toggleMode();
      return;
    }
    if (messageId.length > 0) {
      showLoading();
      updateMessageStatus(messageId, selected, 1);
    }
  }

  Future<void> deleteSingle(UiMessage message) async {
    final confirm = await OBDialogUtil.show<bool>(
      ObDialog.alert(
        title: 'delete'.tr,
        content: 'message_center_confim_delete_this_message'.tr,
        confirmText: 'confirm'.tr,
        cancelText: 'cancel'.tr,
        onConfirmListener: () {
          data?.record.removeWhere((e) => e.id == message.id);
          deleteMessage([int.parse(message.id)]);
          deleteId.add(message.id);
          Get.back(result: true);
        },
        onCancelListener: () {
          updateMessageStatus([message.id], [], 1);
          final selected = data?.record.where((e) => e.id == message.id) ?? [];
          data = data?.copyWith(
              record: data?.record
                  .map((e) => e.copyWith(
                      isRead: selected.contains(e) ? true : e.isRead))
                  .toList());
          Get.back();
        },
      ),
    );
    if (confirm == true) {
      runCatch(() async {
        showSuccess('deleted'.tr);
        data?.record.remove(message);
        parentController?.onRenewCount();
        update();
        Get.back();
      });
    }
  }

  void _delete() {
    final selected = data!.record.where((e) => e.selected).toList();
    List<int> messageId = selected.map((e) {
      return int.parse(e.id);
    }).toList();
    if (messageId.length <= 0) {
      parentController?.toggleMode();
      return;
    }
    deleteMessage(messageId);

    parentController?.toggleMode();
  }

  void toggle(Mode mode) {
    modeCurrent = mode;
    update();
  }

  void updateMessageStatus(
      List<String> messageId, List<UiMessage> selected, int messageStatus) {
    //更新消息状态
    repository.updateMessageStatus(messageId, int.parse(msgType)).then((res) {
      onRefresh();
      parentController?.onRenewCount();
    }).catchError((code, msg) {
      dismissLoading();
      parentController?.onRenewCount();
      parentController?.toggleModeR();
    });
  }

  void deleteMessage(List<int> messageId) {
    //更新消息状态
    repository.deleteMessagePost(messageId).then((res) {
      parentController?.onRenewCount();
      onRefresh();
    }).catchError((code, msg) {
      parentController?.onRenewCount();
    });
  }

  Widget showBottomSheet() {
    return Container(
      height: 49.w + MediaQuery.of(Get.context!).padding.bottom,
      color: Color(0xFF1D2933),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Divider(
            height: 1.w,
            thickness: 1.w,
            color: Get.theme.primaryColor.withOpacity(0.1),
          ),
          Container(
            width: 1.sw,
            height: 48.w,
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: _selectAll,
                  child: Row(
                    children: [
                      Obx(() {
                        return AbsorbPointer(
                          child: ObRadio(
                            value: isSelectedAll,
                          ),
                        );
                      }),
                      SizedBox(width: 12.w),
                      Text('message_all_checked'.tr,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: _markRead,
                  child: Text('message_mark_read'.tr,
                      style: TextStyle(color: Color(0xffE1A100), fontSize: 14)),
                ),
                Visibility(
                  visible: tag == '1' || tag == '0',
                  child: SizedBox(width: 40.w),
                ),
                Visibility(
                  visible: tag == '1' || tag == '0',
                  child: GestureDetector(
                    onTap: _delete,
                    child: Text('message_delete'.tr,
                        style:
                            TextStyle( color: ColorName.colorMain1, fontSize: 14)),
                  ),
                ),
                SizedBox(width: 24.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final listSmartRefreshCtrl = RefreshController(initialRefresh: false);
  RxBool systemLoadingFail = false.obs;
  RxBool systemLoadingShow = true.obs;

  @override
  void onRefresh() async {
    try {
      final refreshData = await getPageList(1);
      data = refreshData;
      listSmartRefreshCtrl.refreshCompleted(resetFooterState: noMoreData);
      onRefreshSuccess(data);
      systemLoadingFail.value = false;
      systemLoadingShow.value = false;
      dismissLoading();
      parentController?.toggleModeR();
    } catch (e) {
      listSmartRefreshCtrl.refreshFailed();
      onRefreshFailed(e);
      systemLoadingFail.value = true;
      systemLoadingShow.value = false;
      dismissLoading();
      parentController?.toggleModeR();
    }
    if (data?.record.length == 0) {
      listSmartRefreshCtrl.resetNoData();
    }
    parentController?.onRenewCount();
  }

  @override
  void onClose() {
    stream?.cancel();
    super.onClose();
    onRefresh();
  }

  @override
  onLoading() async {
    if (data != null) {
      try {
        final loadData = await getPageList(data!.pageNum + 1);
        final appendList = (data?.record ?? []) + (loadData.record);
        final same = data?.record.length == appendList.length;
        data = loadData.copyWith(record: appendList);
        if (same) {
          listSmartRefreshCtrl.loadNoData();
        } else {
          noMoreData
              ? listSmartRefreshCtrl.loadNoData()
              : listSmartRefreshCtrl.loadComplete();
        }
        onLoadedSuccess(data);
      } catch (e) {
        listSmartRefreshCtrl.loadFailed();
        listSmartRefreshCtrl.loadNoData();
        onLoadedFailed(e);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    onRefresh();
    eventBus.fire(FloatBonusEvent(show: true));
  }
}
