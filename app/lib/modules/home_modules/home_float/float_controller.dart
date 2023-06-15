import 'dart:async';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_package/modules/home_modules/home_float/float_bonus.dart';

OverlayEntry? overlayEntry = OverlayEntry(builder: (_) => FloatBonus());

void showPop() {
  if (overlayEntry?.mounted == true) return;
  Overlay.of(Get.overlayContext!)?.insert(overlayEntry!);
}

void hidePop() {
  if (overlayEntry?.mounted == true) overlayEntry?.remove();
}

class FloatController extends GetxController {
  bool hasNewBonus = false;
  int bonusTimestamp = 0;
  late final StreamSubscription bonusListener;
  final authService = Get.find<AuthService>();
  final repository = Get.find<HomeRepository>();

  @override
  void onInit() {
    super.onInit();
    bonusListener = eventBus.on<FloatBonusEvent>().listen((event) {
      if (Store.isIpLimited) {
        hidePop();
        return;
      }

      if (event.show) {
        showOrHide();
      } else {
        hidePop();
      }
    });
  }

  ///首页红利浮窗
  Future<void> getMessageCenterHasUnReceivedBonus() async {
    try {
      final UnReceivedBonusAndTime res =
          await repository.getMessageCenterHasUnReceivedBonus();
      if (res.hasReceivedAmount > 0 && (bonusTimestamp) < res.timestamp) {
        bonusTimestamp = res.timestamp;
        hasNewBonus = true;
        eventBus.fire(FloatBonusEvent(show: true));
      }
      if (res.hasReceivedAmount == 0) {
        hasNewBonus = false;
        eventBus.fire(FloatBonusEvent(show: false));
      }
    } catch (_) {}
  }

  void onHandleClose() {
    hidePop();
    hasNewBonus = false;
  }

  void goMessagePage() {
    Store.messageTabIndex.value = 3;
    hidePop();
    Get.toNamed(AppRoutes.MESSAGE, arguments: {"index": 3});
  }

  void showOrHide() {
    if (Store.isUpgradeDialogShow) {
      hidePop();
    } else if (Get.currentRoute == AppRoutes.MESSAGE) {
      if (Store.messageTabIndex.value != 3) {
        if (hasNewBonus) {
          showPop();
        } else {
          hidePop();
        }
      } else {
        hidePop();
      }
    } else if ([
      AppRoutes.LOGIN,
      AppRoutes.SPLASH,
      AppRoutes.ONBOARDING,
      AppRoutes.WEB,
      AppRoutes.GAME,
      AppRoutes.WEB_IFRAME,
    ].contains(Get.currentRoute)) {
      hidePop();
    } else if (Get.currentRoute.contains("agent")) {
      hidePop();
    } else {
      if (hasNewBonus) {
        showPop();
      } else {
        hidePop();
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    bonusListener.cancel();
  }
}
