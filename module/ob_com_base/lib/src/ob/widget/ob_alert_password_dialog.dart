import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/src/ob/widget/gradient_button.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

final EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w);

final RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.w)));

const Color _defaultBackgroundColor = Color(0xff1D2933);

RxBool selected = false.obs;

class ObAlertPasswordDialog extends StatelessWidget {
  final EdgeInsets? insetPadding;
  final Color? background;
  final ShapeBorder? shape;
  final Widget? titleWidget;
  final Widget? checkInputWidget;
  final Widget? actionsWidget;
  final bool showTitle;

  const ObAlertPasswordDialog(
      {Key? key,
      this.insetPadding,
      this.shape,
      this.background = _defaultBackgroundColor,
      this.titleWidget,
      this.actionsWidget,
      this.checkInputWidget,
      this.showTitle = true})
      : super(key: key);

  ObAlertPasswordDialog.alert(
      {Key? key,
      required String title,
      Widget? inputWidget,
      bool? showTitle,
      String? confirmTitle,
      String? cancelTitle,
      double? confirmWidth,
      double? cancelWidth,
      double? cancelHeight,
      double? confirmHeight,
      Alignment? alignment,
      VoidCallback? onCancelListener,
      VoidCallback? onConfirmListener,
      VoidCallback? choseListener,
      Function? onShowNextTimeListener,
      EdgeInsets? insetPadding})
      : shape = _defaultDialogShape,
        showTitle = showTitle ?? true,
        insetPadding = insetPadding ?? _defaultInsetPadding,
        background = _defaultBackgroundColor,
        titleWidget = Container(
          alignment: alignment ?? Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        checkInputWidget =
            Container(margin: EdgeInsets.only(top: 16.w), child: inputWidget),
        actionsWidget = Container(
            margin: EdgeInsets.only(top: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (onCancelListener != null)
                  Container(
                      margin: onConfirmListener != null
                          ? EdgeInsets.only(right: 17.w)
                          : EdgeInsets.all(0),
                      child: GradientButton(
                        width: cancelWidth ?? 295.w,
                        height: cancelHeight ?? 40.w,
                        onPress: () {
                          onCancelListener();
                          Get.back();
                        },
                        beginColor: Colors.white.withOpacity(0.2),
                        endColor: Colors.white.withOpacity(0.2),
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        text: cancelTitle ?? 'cancel'.tr,
                      )),
                if (onConfirmListener != null)
                  GradientButton(
                    width: confirmWidth ?? 295.w,
                    height: confirmHeight ?? 40.w,
                    onPress: () {
                      if (onShowNextTimeListener != null) {
                        onShowNextTimeListener(selected.value);
                      }
                      onConfirmListener();
                      //Get.back();
                    },
                    text: confirmTitle ?? 'confirm'.tr,
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ));

  @override
  Widget build(BuildContext context) {
    selected.value = false;
    return Dialog(
      shape: shape ?? _defaultDialogShape,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      backgroundColor: background,
      child: Container(
        padding: insetPadding ?? _defaultInsetPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (titleWidget != null && showTitle) titleWidget!,
            if (checkInputWidget != null) checkInputWidget!,
            if (actionsWidget != null) actionsWidget!,
          ],
        ),
      ),
    );
  }
}
