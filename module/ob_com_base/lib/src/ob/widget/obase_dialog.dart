import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:get/get.dart';

const EdgeInsets _defaultInsetPadding = EdgeInsets.all(16);
///从ob_components复制过来的，原来的按钮颜色不能改
const RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  side: BorderSide(
    width: 1,
    color: white10,
    style: BorderStyle.solid,
  ),
);
 
///
class ObaseDialog extends StatelessWidget {
  ///
  const ObaseDialog({
    Key? key,
    this.insetPadding,
    this.shape,
    this.background,
    this.titleWidget,
    this.contentWidget,
    this.actionsWidget,
  }) : super(key: key);

  ///
  ObaseDialog.alert({
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    this.background,
    VoidCallback? onCancelListener,
    VoidCallback? onConfirmListener,
  })  : shape = _defaultDialogShape,
        insetPadding = _defaultInsetPadding,
        titleWidget = Text(title),
        contentWidget = Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          child: Text(content),
        ),
        actionsWidget = Row(
          children: <Widget>[
            if (onCancelListener != null)
              Expanded(
                child: OBasePrimaryButton(
                  child: ObText(
                    cancelText ?? 'cancel'.tr,
                    textAlign: TextAlign.center,
                  ),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.btnbg3.path, package: BaseX.pkg),
                    fit: BoxFit.fill,
                  ),
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onCancelListener,
                ),
              ),
            if (onCancelListener != null && onConfirmListener != null)
              const SizedBox(width: 24),
            if (onConfirmListener != null)
              Expanded(
                child: OBasePrimaryButton(
                  child: ObText(
                    confirmText ?? 'confirm'.tr,
                    textAlign: TextAlign.center,
                  ),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                    fit: BoxFit.fill,
                  ),
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onConfirmListener,
                ),
              )
          ],
        );

  ///
  ObaseDialog.alertSlot({
    required String title,
    required Widget content,
    String? confirmText,
    String? cancelText,
    this.background,
    VoidCallback? onCancelListener,
    VoidCallback? onConfirmListener,
  })  : shape = _defaultDialogShape,
        insetPadding = _defaultInsetPadding,
        titleWidget = Text(title),
        contentWidget = content,
        actionsWidget = Row(
          children: <Widget>[
            if (onCancelListener != null)
              Expanded(
                child: SecondaryButton(
                  child: Text(cancelText ?? 'cancel'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(height: 1)),
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onCancelListener,
                ),
              ),
            if (onCancelListener != null && onConfirmListener != null)
              const SizedBox(width: 24),
            if (onConfirmListener != null)
              Expanded(
                child: PrimaryButton(
                  child: Text(confirmText ?? 'confirm'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(height: 1)),
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onConfirmListener,
                ),
              )
          ],
        );

  ///
  final EdgeInsets? insetPadding;

  ///
  final Color? background;

  ///
  final ShapeBorder? shape;

  ///
  final Widget? titleWidget;

  ///
  final Widget? contentWidget;

  ///
  final Widget? actionsWidget;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = Theme.of(context).dialogTheme;
    return Dialog(
      shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: background ?? ObTheming.obDialogBgColor,
      child: Container(
        padding: insetPadding ?? _defaultInsetPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (titleWidget != null)
              DefaultTextStyle(
                style: dialogTheme.titleTextStyle ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                child: titleWidget!,
              ),
            if (contentWidget != null)
              DefaultTextStyle(
                style: dialogTheme.contentTextStyle ??
                    const TextStyle(
                      color: white60,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                child: contentWidget!,
              ),
            if (actionsWidget != null) actionsWidget!,
          ],
        ),
      ),
    );
  }
}
