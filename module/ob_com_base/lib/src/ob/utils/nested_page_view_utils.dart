import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NestedPageViewUtils {
  final PageController pageController;
  ScrollDragController? _drag;

  NestedPageViewUtils(this.pageController);

  DragStartDetails? dragStartDetails;

  bool handleNotification(ScrollNotification notification) {
    ///避免上下滚动和下拉刷新列表冲突
    var axisDirection = notification.metrics.axisDirection;
    if(AxisDirection.up == axisDirection || AxisDirection.down == axisDirection){
      return false;
    }

    if (notification.depth == 0) {
      return false;
    }

    if (notification is ScrollStartNotification) {
      dragStartDetails = notification.dragDetails;
    }

    if (notification is OverscrollNotification) {
      if (_drag == null) {
        ScrollPositionWithSingleContext a =
            pageController.position as ScrollPositionWithSingleContext;
        _drag = a.drag(dragStartDetails!, () {
          _drag = null;
        }) as ScrollDragController;
      }

      if (notification.dragDetails != null) {
        _drag?.update(notification.dragDetails!);
      }
    }

    if (notification is ScrollUpdateNotification) {
      return false;
    }

    if (notification is ScrollEndNotification) {
      dragStartDetails = null;
      if (notification.dragDetails != null) {
        _drag?.end(notification.dragDetails!);
      }
    }

    if (notification is UserScrollNotification) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          break;
        case ScrollDirection.idle:
          _drag?.cancel();
          break;
        case ScrollDirection.reverse:
          break;
      }
    }
    return false;
  }
}
