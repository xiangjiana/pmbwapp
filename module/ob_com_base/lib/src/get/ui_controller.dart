import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:get/get.dart';

///通过with方式，提供对现存Controller的兼容
abstract class BaseController {
  StreamSubscription<BusEvent>? _busSub;
  StreamSubscription<int>? _sysClockSub;

  final Rx<UIState> _uiState = UIInitial(true).obs;

  Rx<UIState> get uiState => _uiState;

  void baseOnInit() {
    _busSub = Bus.instance.subscribe(onBusEvent);
  }

  Future<void> baseOnClose() async {
    await _busSub?.cancel();
    await unsubscribeSysClock();
  }

  ///子类重写该方法处理EventBus事件
  void onBusEvent(BusEvent event) {}

  Future<void> subscribeSysClock(Function(int seconds) onSysClock) async {
    await unsubscribeSysClock();
  }

  Future<void> unsubscribeSysClock() async {
    await _sysClockSub?.cancel();
  }

  void initial(bool isLoading) {
    _uiState.value = UIInitial(isLoading);
  }

  void idle() {
    _uiState.value = UIIdle();
  }

  void loading() {
    _uiState.value = UILoading();
  }

  void toast(String msg) {
    _uiState.value = UIToast(msg);
  }

  void action({
    required UIActionEvent event,
    dynamic data,
    dynamic data2,
    dynamic data3,
  }) {
    _uiState.value = UIAction(event: event, data: data, data2: data2, data3: data3);
  }
}

///GetController基类
abstract class AppGetController extends GetxController with BaseController {
  @override
  @mustCallSuper
  void onInit() {
    baseOnInit();
    super.onInit();
  }

  @override
  @mustCallSuper
  Future<void> onClose() async {
    await baseOnClose();
    super.onClose();
  }
}
