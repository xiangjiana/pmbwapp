import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/ob_image.dart';

class ObBackButton extends TextButton {
  ObBackButton({
    Key? key,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    Widget? child,
  }) : super(
          key: key,
          onPressed: onPressed ?? Get.back,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: child ??
              pkObImage(
                Assets.images.icon.comBack.path,
                width: 24,
                height: 24,
              ),
        );
}
