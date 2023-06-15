import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ob_com_base/src/ob/utils/event_utils.dart';

mixin BackTopMixin<T extends StatefulWidget> on State<T> {
  final ScrollController _scrollController = ScrollController();
  late final StreamSubscription _backTopListener;

  ScrollController get scrollController => _scrollController;

  String? curRunTimeType;

  @override
  void initState() {
    _backTopListener = eventBus.on<GlobalBackTopEvent>().listen((event) {
      if (curRunTimeType != null && curRunTimeType != event.eventRunTimeType) {
        // 设置当前curRunTimeType 且与 eventRunTimeType 不一致时，不需要回到顶部
        return;
      }
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _backTopListener.cancel();
    _scrollController.dispose();
    super.dispose();
  }
}
