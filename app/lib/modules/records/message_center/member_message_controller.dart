import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/home/components/controller/home_widget_auto_refresh_manager.dart';
import 'package:ob_package/modules/home_modules/home_user/user_controller.dart';
import 'package:ob_package/modules/records/message_center/components/message_list.dart';
import 'package:ob_package/modules/records/message_center/repository/message_center_msg_repository.dart';
import 'package:ob_package/modules/records/message_center/repository/ui_message.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'components/bonus_list.dart';

class MemberMessageController extends GetxController
    with SingleGetTickerProviderMixin {
  final MessageCenterMsgRepository repository;

  MemberMessageController(this.repository);

  late final TabController tabController;
  late final StreamSubscription messageTabIndexStream;
  final messages = <UiMessage>[].obs;
  final rxMode = Mode.DISPLAY.obs;
  RxBool showOpen = true.obs;
  final List<MsgTab> tabWidget = <MsgTab>[
    MsgTab(title: 'message_tab1'.tr, numNo: '0'.toString()),
    MsgTab(title: 'message_tab2'.tr, numNo: '0'.toString()),
    MsgTab(title: 'message_tab3'.tr, numNo: '0'.toString()),
    MsgTab(title: 'message_tab4'.tr, numNo: '0'.toString()),
  ].obs;
  final tabBarViews = List<Widget>.filled(4, SizedBox.shrink()).obs;
  bool hasBonus = false;

  Mode get mode => rxMode.value;

  @override
  void onInit() {
    super.onInit();
    rxMode.value = Mode.DISPLAY;
    if (Get.arguments != null) {
      onTapTabBar(Get.arguments["index"]);
    }
    tabBarViews.value = [
      MessageList(repository, '1', Assets.images.course.newsMessage.path, '0'),
      MessageList(repository, '2', Assets.images.course.newsActivity.path, '1'),
      MessageList(repository, '3', Assets.images.course.newsAnotice.path, '2'),
      BonusList(repository, '3'),
    ];
    tabController = TabController(
      length: tabWidget.length,
      vsync: this,
      initialIndex: Store.messageTabIndex.value,
    );
    messageTabIndexStream = Store.messageTabIndex.listen((int index) {
      tabController.animateTo(index);
    });
  }

  late StreamSubscription refreshListener; // home tab eventBus
  @override
  void onReady() {
    super.onReady();
    onRenewCount();
    refreshListener = eventBus.on<HomeModuleEvent>().listen((event) {
      if (event.name == memberUnReadMessageTimerRefresh) {
        onRenewCount();
      }
    });
    HomeWidgetAutoRefreshManager.instance.startMessageUnReadTimer();
  }

  void callBack() {
    rxMode.value = Mode.DISPLAY;
    HomeWidgetAutoRefreshManager.instance.cancelMessageUnReadTimer();
    eventBus.fire(FloatBonusEvent(show: hasBonus));
  }

  void closeOpen() {
    showOpen.value = false;
  }

  void onTapTabBar(int i) {
    Store.messageTabIndex.value = i;
    eventBus.fire(FloatBonusEvent(show: i < 3 && hasBonus));
  }

  void toggleMode() {
    rxMode.value = mode == Mode.DISPLAY ? Mode.EDITABLE : Mode.DISPLAY;
    update();
  }

  void toggleModeR() {
    rxMode.value = Mode.DISPLAY;
    update();
  }

  void onRenewCount() {
    //查询类型:1 通知 2 活动 3 公告 4 红利
    repository.messageSelectRespectiveUnReadAmount().then((value) {
      tabWidget[0] = MsgTab(
          title: 'message_tab1'.tr,
          numNo: _splice(value.noticeUnReadAmount),
          show: value.noticeUnReadAmount > 0);
      tabWidget[1] = MsgTab(
          title: 'message_tab2'.tr,
          numNo: _splice(value.activityUnReadAmount),
          show: value.activityUnReadAmount > 0);
      tabWidget[2] = MsgTab(
          title: 'message_tab3'.tr,
          numNo: _splice(value.announceUnReadAmount),
          show: value.announceUnReadAmount > 0);
      tabWidget[3] = MsgTab(
          title: 'message_tab4'.tr,
          numNo: _splice(value.bonusUnReadAmount),
          show: value.bonusUnReadAmount > 0);
      hasBonus = value.bonusUnReadAmount > 0;
      update();
    });
  }

  String _splice(int count) => count.toString();

  @override
  void onClose() {
    HomeWidgetAutoRefreshManager.instance.cancelMessageUnReadTimer();
    tabController.dispose();
    eventBus.fire(FloatBonusEvent(show: hasBonus));
    messageTabIndexStream.cancel();
    updateHomeBadge();
    super.onClose();
  }

  void updateHomeBadge() async {
    final userController = Get.findOrNull<UserController>();
    await userController?.getMemberUnReadAmountFuture;
  }
}

class MsgTab {
  String? title;
  String? numNo;
  bool? show;

  MsgTab({this.title, this.numNo, this.show = false});
}

enum Mode { DISPLAY, EDITABLE }
