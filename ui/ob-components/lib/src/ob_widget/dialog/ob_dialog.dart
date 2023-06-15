import 'package:flutter/material.dart';
import 'package:ob_component/src/ob_widget/button/primary_button.dart';
import 'package:ob_component/src/ob_widget/button/secondary_button.dart';
import 'package:ob_component/src/theme/colors.dart';
import 'package:ob_com_png/ob_com_png.dart';
import '../button/ob_primary_button.dart';
import 'ob_text.dart';

const EdgeInsets _defaultInsetPadding = EdgeInsets.all(16);

const RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  side: BorderSide(
    width: 1,
    color: white10,
    style: BorderStyle.solid,
  ),
);

///
enum ObDialogAlertType {
  /// confirm green
  green,

  /// confirm purple
  purple,
}

///
class ObDialog extends StatelessWidget {
  ///
  const ObDialog({
    Key? key,
    this.insetPadding,
    this.shape,
    this.background,
    this.titleWidget,
    this.contentWidget,
    this.actionsWidget,
  }) : super(key: key);

  ///
  ObDialog.alert({
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    ObDialogAlertType? conformColor = ObDialogAlertType.green,
    this.background,
    VoidCallback? onCancelListener,
    VoidCallback? onConfirmListener,
  })  : shape = _defaultDialogShape,
        insetPadding = _defaultInsetPadding,
        titleWidget = Text(title),
        contentWidget = Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          child: Row(
            children: <Widget>[
              Flexible(child: Text(content)),
            ],
          ),
        ),
        actionsWidget = Row(
          children: <Widget>[
            if (onCancelListener != null)
              Expanded(
                child: OBasePrimaryButton(
                  block: true,
                  size: ButtonSize.large,
                  image: DecorationImage(
                    image:
                        AssetImage(Assets.images.btnbg3.path, package: Png.pkg),
                    fit: BoxFit.fill,
                  ),
                  child: Text(
                    cancelText ?? '取消',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  onPressed: onCancelListener,
                ),
              ),
            if (onCancelListener != null && onConfirmListener != null)
              const SizedBox(width: 24),
            if (onConfirmListener != null)
              Expanded(
                child: PrimaryButton(
                  child: ObText(
                    confirmText ?? '确定',
                    textAlign: TextAlign.center,
                  ),
                  image: DecorationImage(
                    image: conformColor == ObDialogAlertType.green
                        ? AssetImage(Assets.images.btnbg.path, package: Png.pkg)
                        : AssetImage(Assets.images.btnbg2.path,
                            package: Png.pkg),
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
  ObDialog.alertSlot({
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
                child: OBasePrimaryButton(
                  block: true,
                  size: ButtonSize.large,
                  image: DecorationImage(
                    image:
                        AssetImage(Assets.images.btnbg3.path, package: Png.pkg),
                    fit: BoxFit.fill,
                  ),
                  child: Text(
                    cancelText ?? '取消',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  onPressed: onCancelListener,
                ),

                // SecondaryButton(
                //   child: Text(cancelText ?? '取消',
                //       textAlign: TextAlign.center,
                //       style: const TextStyle(height: 1)),
                //   size: ButtonSize.large,
                //   block: true,
                //   onPressed: onCancelListener,
                // ),
              ),
            if (onCancelListener != null && onConfirmListener != null)
              const SizedBox(width: 24),
            if (onConfirmListener != null)
              Expanded(
                child: OBasePrimaryButton(
                  image: DecorationImage(
                    image:
                        AssetImage(Assets.images.btnbg2.path, package: Png.pkg),
                    fit: BoxFit.fill,
                  ),
                  child: Text(confirmText ?? '确定',
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
      backgroundColor: background ?? dialogTheme.backgroundColor,
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
