import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_component/src/ob_widget/animation/loading_animation.dart';

///
typedef CancelFunc = void Function();

/// toast 管理器
class ToastManager {
  ToastManager._privateConstructor();

  /// 初始化
  static TransitionBuilder init() {
    return BotToastInit();
  }

  /// 初始化
  static TransitionBuilder initWithParameters({TransitionBuilder? builder}) {
    final TransitionBuilder toastBuilder = BotToastInit();
    if (builder == null) return toastBuilder;
    return (BuildContext context, Widget? child) {
      return toastBuilder(context, builder(context, child));
    };
  }

  ///
  static void dismissAll() {
    BotToast.cleanAll();
  }

  ///
  static void dismiss() {
    BotToast.closeAllLoading();
  }

  /// loading 对话框
  static CancelFunc showLoading({String? status}) {
    return BotToast.showCustomLoading(
        backgroundColor: Colors.transparent,
        toastBuilder: (_) {
          return Container(
            width: 96,
            height: 96,
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const LoadingAnimation(),
                if (status != null)
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          height: 1.1,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ],
                  )
              ],
            ),
          );
        });
  }

  /// loading 对话框
  static CancelFunc showGataLoading(
    Widget child, {
    bool clickClose = false,
    bool allowClick = false,
    bool ignoreContentClick = true,
  }) {
    return BotToast.showCustomLoading(
        clickClose: clickClose,
        allowClick: allowClick,
        ignoreContentClick: ignoreContentClick,
        backgroundColor: Colors.transparent,
        toastBuilder: (_) {
          return child;
        });
  }

  ///
  static CancelFunc showText(String message) {
    BotToast.removeAll(BotToast.textKey);
    return BotToast.showCustomText(
        onlyOne: true,
        duration: const Duration(seconds: 2),
        align: Alignment.center,
        wrapAnimation: null,
        wrapToastAnimation: null,
        toastBuilder: (_) {
          return Container(
            margin: const EdgeInsets.all(30),
            decoration: ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Colors.white.withOpacity(0.2), width: 1)),
              color: Colors.black.withOpacity(0.4),
            ),
            constraints: const BoxConstraints(
              minWidth: 96,
            ),
            padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
            child: Text(
              message,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.1),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          );
        });
  }

  ///
  static CancelFunc showSuccess({String? message}) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        animationDuration: const Duration(milliseconds: 300),
        groupKey: BotToast.loadKey,
        onlyOne: true,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
        toastBuilder: (_) {
          return Container(
            width: 96,
            height: 96,
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 40,
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Text(
                      message ?? "成功",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          height: 1.1),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  ///
  static CancelFunc showError({String? message}) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        animationDuration: const Duration(milliseconds: 300),
        groupKey: BotToast.loadKey,
        onlyOne: true,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
        toastBuilder: (_) {
          return Container(
            width: 96,
            height: 96,
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 40,
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Text(
                      message ?? "失败",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          height: 1.1),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

/// 二次封装
class ToastObserver extends BotToastNavigatorObserver {}
