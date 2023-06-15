import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:ob_com_base/src/ob/widget/ob_theme.dart';

class OBDialogUtil {
  static bool isShowing = false;

  static Future<T?> show<T>(
    Widget widget, {
    BuildContext? context,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = false,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
  }) {
    if (context != null) {
      return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(GetDialogRoute<T>(
        pageBuilder: (buildContext, animation, secondaryAnimation) {
          final pageChild = widget;
          Widget dialog = Builder(builder: (context) {
            return ObTheme(child: pageChild);
          });
          if (useSafeArea) {
            dialog = SafeArea(child: dialog);
          }
          return dialog;
        },
        barrierDismissible: barrierDismissible,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: barrierColor ?? Colors.black54,
        transitionDuration: transitionDuration ?? const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: transitionCurve ?? Curves.easeOutQuad,
            ),
            child: child,
          );
        },
        settings: routeSettings,
      ));
    } else {
      return Get.dialog(
        widget,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        useSafeArea: useSafeArea,
        arguments: arguments,
        transitionDuration: transitionDuration,
        transitionCurve: transitionCurve,
        name: name,
        routeSettings: routeSettings,
      );
    }
  }
}
