import 'dart:convert';

import 'package:flutter/widgets.dart';

class CaptchaUtil {
  bool _hasMeasured = false;
  late double _width;
  late double _height;

  /// Widget渲染监听.
  /// context: Widget context.
  /// isOnce: true,Continuous monitoring  false,Listen only once.
  /// onCallBack: Widget Rect CallBack.
  void asyncPrepare(
      BuildContext context, bool isOnce, ValueChanged<Rect> onCallBack) {
    if (_hasMeasured) return;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      RenderObject? box = context.findRenderObject();
      if (box != null && box.semanticBounds != null) {
        if (isOnce) _hasMeasured = true;
        double width = box.semanticBounds.width;
        double height = box.semanticBounds.height;
        if (_width != width || _height != height) {
          _width = width;
          _height = height;
          if (onCallBack != null) onCallBack(box.semanticBounds);
        }
      }
    });
  }

  /// Widget渲染监听.
  void asyncPrepares(bool isOnce, ValueChanged onCallBack) {
    if (_hasMeasured) return;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      if (isOnce) _hasMeasured = true;
      if (onCallBack != null) {
        onCallBack(null);
      }
    });
  }

  ///获取widget Rect
  static Rect getWidgetBounds(BuildContext context) {
    RenderObject? box = context.findRenderObject();
    return (box != null && box.semanticBounds != null)
        ? box.semanticBounds
        : Rect.zero;
  }

  ///获取widget在屏幕上的坐标,widget必须渲染完成
  static Offset getWidgetLocalToGlobal(BuildContext context) {
    RenderObject? box = context.findRenderObject();
    return box == null
        ? Offset.zero
        : CaptchaUtil.getWidgetLocalToGlobal(
            context); //box.localToGlobal(Offset.zero);
  }
}

class ObjectUtils {
  /// isEmpty.
  static bool isEmpty(Object value) {
    if (value == null) return true;
    if (value is String && value.isEmpty) {
      return true;
    }
    return false;
  }

  //list length == 0  || list == null
  static bool isListEmpty(Object value) {
    if (value == null) return true;
    if (value is List && value.length == 0) {
      return true;
    }
    return false;
  }

  static String jsonFormat(Map<dynamic, dynamic> map) {
    Map _map = Map<String, Object>.from(map);
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(_map);
  }
}
