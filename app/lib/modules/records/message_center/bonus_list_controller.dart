import 'dart:async';

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:models/models.dart' hide PageResponse;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_package/modules/home_modules/home_float/float_controller.dart';
import 'package:ob_package/modules/records/message_center/member_message_controller.dart';
import 'package:ob_package/modules/records/message_center/repository/dic.dart';
import 'package:ob_package/modules/records/message_center/repository/message_center_msg_repository.dart';
import 'package:ob_package/modules/records/message_center/repository/ui_bonus.dart';
import 'package:ob_component/ob_component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sprintf/sprintf.dart';

// bool shouldShowDialog = true;

class BonusListController extends GetxController
    with ObPageController<UiBonus> {
  final MessageCenterMsgRepository repository;
  final String tag;
  late Mode modeCurrent = Mode.DISPLAY;
  StreamSubscription<Mode>? stream;
  RxBool selected = false.obs;

  MemberMessageController? get parentController =>
      Get.isRegistered<MemberMessageController>()
          ? Get.find<MemberMessageController>()
          : null;

  bool get isSelectedAll {
    final selected = data?.record.where((e) => e.status == 0) ?? [];
    return selected.where((element) => element.selected).length ==
        selected.length;
  }

  BonusListController(this.repository, this.tag, BuildContext ctx) {
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
          break;
        case Mode.EDITABLE:
          data = data?.copyWith(
              record: data?.record
                  .map((e) => e.copyWith(mode: Mode.EDITABLE))
                  .toList());
          toggle(Mode.EDITABLE);
          break;
      }
    });
  }

  @override
  Future<PageResponse<UiBonus>> getPageList(int page) async {
    BwMessageBonusDetailPageResponse resp = await repository.getBonus(page);
    return PageResponse<UiBonus>(
        resp.pageNum.toInt(),
        resp.pageSize.toInt(),
        resp.record
            .map(
              (e) => UiBonus(
                e.billAmount.toDouble(),
                e.bonusAmount.toDouble(),
                BONUS_TITLES_DIC[e.bonusType] ?? '',
                copyWriting(e.bonusType, e),
                //"${BONUS_CONTENTS_DIC[e.bonusType]}${e.bonusAmount.fixed(2)}元，领取成功后您的提款所需流水将会增加${e.billAmount.fixed(2)}元，您是否要立即领取？",
                parentController?.mode ?? Mode.DISPLAY,
                e.bonusStatus == 1,
                e.bonusStatus,
                e.createdAt,
                Assets.images.course.newsBonus.path,
                false,
                e.businessId,
                e.bonusType,
                e.id,
                e.createdAt,
                e.remark,
              ),
            )
            .toList(),
        resp.totalPage.toInt(),
        resp.totalRecord.toInt());
  }

  String copyWriting(int bonusType, var e) {
    if (BONUS_CONTENTS_DIC[bonusType].isNotNullOrEmpty) {
      if (bonusType == 8) {
        return BONUS_CONTENTS_DIC[e.bonusType]!
            .replaceAll('**', e.remark)
            .replaceAll(
                'xx',
                (AppCurrencyUtils.getAppCurrencySymbolIsVND() ? "₫" : "") +
                    (AppCurrencyUtils.getAppCurrencySymbolIsVND()
                        ? "symbol".tr + AppCurrencyUtils.dealBalance("${e.bonusAmount}")
                        : "symbol".tr +  '${numberFormat(e.bonusAmount.toDouble())}'));
      } else if ([9, 12].contains(bonusType)) {
        return BONUS_CONTENTS_DIC[e.bonusType]!
            .replaceAll(
                'xx',
                (AppCurrencyUtils.getAppCurrencySymbolIsVND() ? "₫" : "") +
                    (AppCurrencyUtils.getAppCurrencySymbolIsVND()
                        ? "symbol".tr +  AppCurrencyUtils.dealBalance("${e.bonusAmount}")
                        : "symbol".tr +  '${numberFormat(e.bonusAmount.toDouble())}'))
            .replaceAll('uu', '${e.inviteUserName}');
      } else {
        return BONUS_CONTENTS_DIC[e.bonusType]!.replaceAll(
            'xx',
            (AppCurrencyUtils.getAppCurrencySymbolIsVND() ? "₫" : "") +
                (AppCurrencyUtils.getAppCurrencySymbolIsVND()
                    ? "symbol".tr +  AppCurrencyUtils.dealBalance("${e.bonusAmount}")
                    : "symbol".tr +  '${numberFormat(e.bonusAmount.toDouble())}'));
      }
    }
    return '';
  }

  void _selectAll() {
    if (isSelectedAll) {
      data = data?.copyWith(
          record: data?.record.map((e) {
        if (e.status != 0) return e;
        return e.copyWith(selected: false);
      }).toList());
    } else {
      data = data?.copyWith(
          record: data?.record.map((e) {
        if (e.status != 0) return e;
        return e.copyWith(selected: true);
      }).toList());
    }
  }

  bool showOrHideButton(int type) {
    return ![12, 13, 14].contains(type);
  }

  ///
  Future<void> showConfirmDialog(Function? callback, double bonusTotal,
      double billAmount, String type, bool txtFlag) async {
    String total = AppCurrencyUtils.getAppCurrencySymbol() +
        AppCurrencyUtils.dealBalance(bonusTotal.toString());
    String bill = AppCurrencyUtils.getAppCurrencySymbol() +
        AppCurrencyUtils.dealBalance(billAmount.toString());
    final txtWarning = txtFlag
        ? sprintf('message_center_total_amount_about_to_receive'.tr,
            [type, total, bill])
        : sprintf('message_center_you_are_about_to_claim_yuan'.tr,
            [type, total, bill]);

    final confirm = await OBDialogUtil.show<bool>(
      ObDialog.alertSlot(
        title: 'alert'.tr,
        content: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12.w, bottom: 24.w),
              child: Text(
                txtWarning,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  selected.value = !selected.value;
                },
                child: Container(
                  height: 40.w,
                  alignment: Alignment.centerLeft,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => AbsorbPointer(
                              child: ObRadio(
                            value: selected.value,
                          ))),
                      SizedBox(width: 8.w),
                      Text(
                        'message_center_no_more_prompts_for_this_login'.tr,
                        style: TextStyle(
                          color: Color(0xFFFFFFFF).withOpacity(0.6),
                          fontFamily: "PingFang SC",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 12.w),
          ],
        ),
        confirmText: 'message_center_get_it_right_now'.tr,
        cancelText: 'cancel'.tr,
        onConfirmListener: () {
          if (selected.value) {
            Constants.currentLoginMessageDontPrompt = false;
          } else {
            Constants.currentLoginMessageDontPrompt = true;
          }
          Get.findOrNull<FloatController>()
              ?.getMessageCenterHasUnReceivedBonus();
          Get.back(result: true);
        },
        onCancelListener: () {
          Constants.currentLoginMessageDontPrompt = true;
          Get.back();
        },
      ),
    );
    if (confirm == true) {
      runCatch(() async {
        //刷新用户余额
        BalanceManager.syncAll();
        if (callback != null) {
          callback();
        }
      });
    }
  }

  void onItemClick(int index) {
    if (parentController?.mode == Mode.EDITABLE) {
      final indexedItem = data?.record[index];
      final selected =
          data?.record.where((e) => e.businessId == indexedItem!.businessId) ??
              [];
      data = data?.copyWith(
          record: data?.record
              .map((e) => e.copyWith(
                  selected: selected.contains(e) && e.status == 0
                      ? !e.selected
                      : e.selected))
              .toList());
    }
  }

  void markColletedSingle(UiBonus message) {
    if (message.isCollected) {
      return;
    }

    if (!showOrHideButton(message.type)) {
      return;
    }

    //本次登录不再提示
    if (!Constants.currentLoginMessageDontPrompt) {
      receiveDiscount([message]);
      return;
    }

    double total = message.bonusAmount.toDouble();
    double billAmount = message.billAmount.toDouble();

    showConfirmDialog(() {
      receiveDiscount([message]);
    },
        total,
        billAmount,
        message.type == 8
            ? BONUS_TYPE_DIC[message.type]!.replaceAll('**', message.remark)
            : BONUS_TYPE_DIC[message.type] ?? 'message_center_bonus'.tr,
        false);
  }

  UiBonus Function(UiBonus) f = (b) => b;

  Future<void> receiveDiscount(List<UiBonus> messages) async {
    try {
      // var params = messages.map((e) {
      //   return {"businessId": e.businessId, "createTime": e.createdAt};
      // });
      if (messages.length == 0) {
        return;
      }
      List<String> idList = [];
      for (int i = 0; i < messages.length; i++) {
        idList.add(messages[i].id);
      }
      showLoading();

      await repository.discountReceiveDiscountPost(idList).then((value) {
        final selected = messages
            .map((m) =>
                data?.record.where((e) => e.businessId == m.businessId).first)
            .toList();
        data = data?.copyWith(
          record: data?.record
              .map((e) => e.copyWith(
                  isCollected: selected.contains(e) ? true : e.isCollected,
                  status: selected.contains(e) ? 1 : e.status))
              .toList(),
        );
        showToast("message_center_received_successfully".tr);
        onRefresh();
        parentController!.onRenewCount();
        //刷新用户余额
        BalanceManager.syncAll();
        dismissAll();
      }).catchError((c, e) {
        //已经领取了
        final selected = messages
            .map((msg) => data?.record
                .where((e) => e.businessId == msg.businessId)
                .first
                .copyWith(isCollected: true))
            .toList();
        data = data?.copyWith(
            record: data?.record
                .map((e) => e.copyWith(
                    isCollected: selected.contains(e) ? true : e.isCollected,
                    status: selected.contains(e) ? 1 : e.status))
                .toList());
        parentController!.onRenewCount();
        dismissAll();
        onRefresh();
        showToast(e ?? 'message_center_failed_to_claim'.tr);
      });
    } catch (e) {
      dismissAll();
    }
  }

  //一键领取
  void _markCollectedAll() {
    double total = 0.0;
    double billAmount = 0.0;
    int selectedNum = 0;
    data?.record.forEach((element) {
      if (element.selected) {
        selectedNum++;
        total += element.bonusAmount.toDouble();
        billAmount += element.billAmount.toDouble();
      }
    });
    if (!Constants.currentLoginMessageDontPrompt) {
      final selected =
          data?.record.where((e) => e.selected && !e.isCollected) ?? [];
      var uiBonus = <UiBonus>[];
      selected.forEach((element) {
        uiBonus..add(element);
      });
      if (uiBonus.length > 0) {
        receiveDiscount(uiBonus);
      }
      data = data?.copyWith(
          record: data?.record
              .map((e) => e.copyWith(
                  isCollected: selected.contains(e) ? true : e.isCollected,
                  status: selected.contains(e) ? 1 : e.status))
              .toList());
      parentController?.toggleMode();
      return;
    }

    showConfirmDialog(() {
      final selected =
          data?.record.where((e) => e.selected && !e.isCollected) ?? [];
      var uiBonus = <UiBonus>[];
      selected.forEach((element) {
        uiBonus..add(element);
      });
      if (uiBonus.length > 0) {
        receiveDiscount(uiBonus);
      }
      data = data?.copyWith(
          record: data?.record
              .map((e) => e.copyWith(
                  isCollected: selected.contains(e) ? true : e.isCollected,
                  status: selected.contains(e) ? 1 : e.status))
              .toList());
      parentController?.toggleMode();
    }, total, billAmount, 'message_center_bonus'.tr, true);
  }

  void toggle(Mode mode) {
    modeCurrent = mode;
    update();
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
                  child: Obx(() => Row(
                        children: [
                          AbsorbPointer(
                            child: ObRadio(
                              value: isSelectedAll,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'message_center_select_all'.tr,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      )),
                ),
                Spacer(),
                GestureDetector(
                  onTap: _markCollectedAll,
                  child: Text(
                    'message_center_one_click_to_receive'.tr,
                    style: TextStyle(color: Color(0xFFE1A100), fontSize: 14),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  numberFormat(double numF) {
    var num2 = numF.toStringAsFixed(3);
    return num2.substring(0, num2.lastIndexOf('.') + 3);
  }

  final listSmartRefreshCtrl = RefreshController(initialRefresh: false);
  RxBool systemLoadingFail = false.obs;
  RxBool systemLoadingShow = true.obs;

  @override
  void onRefresh() async {
    // super.onRefresh();
    try {
      final refreshData = await getPageList(1);
      data = refreshData;
      listSmartRefreshCtrl.refreshCompleted(resetFooterState: noMoreData);
      onRefreshSuccess(data);
      systemLoadingFail.value = false;
      systemLoadingShow.value = false;
    } catch (e) {
      listSmartRefreshCtrl.refreshFailed();
      onRefreshFailed(e);
      systemLoadingFail.value = true;
      systemLoadingShow.value = false;
    } finally {
      //如果getPageList 不返回 数据,错误数据被getPagelist拦截
      systemLoadingFail.value = false;
      systemLoadingShow.value = false;
    }
    parentController?.onRenewCount();
    update();
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
  }

  @override
  void onClose() {
    stream?.cancel();
    super.onClose();
  }
}
