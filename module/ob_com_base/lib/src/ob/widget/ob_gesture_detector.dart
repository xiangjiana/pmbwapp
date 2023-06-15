import 'package:flutter/material.dart';
import 'package:ob_com_base/src/ob/utils/cool_down_manager.dart';

class OBGestureDetector extends GestureDetector {
  OBGestureDetector({
    Key? key,
    required String tapKey,
    int duration = 600,
    GestureTapCallback? onTap,
    HitTestBehavior behavior = HitTestBehavior.translucent,
    Widget? child,
  }) : super(
          key: key,
          behavior: behavior,
          onTap: () {
            if (CoolDownManager.handler(key: tapKey, duration: duration) == false) {
              return;
            }
            onTap?.call();
          },
          child: child,
        );
}
