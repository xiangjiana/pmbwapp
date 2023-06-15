import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart';

class FindButton extends StatefulWidget {
  final bool isNext;
  final GestureTapCallback nextPage;
  final EdgeInsetsGeometry? margin;

  const FindButton({
    Key? key,
    this.margin,
    this.isNext = false,
    required this.nextPage,
  }) : super(key: key);

  @override
  _FindButtonState createState() => _FindButtonState();
}

class _FindButtonState extends State<FindButton> {
  Color beginColor(bool buttonIsOk) {
    var color = Get.theme.buttonTheme.colorScheme!.primary;
    if (buttonIsOk) {
      return color;
    }
    return color.withOpacity(0.6);
  }

  Color endColor(bool buttonIsOk) {
    var color = Get.theme.buttonTheme.colorScheme!.primaryVariant;
    if (buttonIsOk) {
      return color;
    }
    return color.withOpacity(0.6);
  }

  Color textColor(bool buttonIsOk) {
    if (buttonIsOk) {
      return Get.theme.colorScheme.primary;
    }
    return Colors.white.withOpacity(.6);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isNext ? 1 : .5,
      child: Container(
        height: 40.w,
        margin: widget.margin ?? EdgeInsets.zero,
        child:  OBasePrimaryButton(
          image: DecorationImage(
            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
            fit: BoxFit.fill,
          ),
          block: true,
          onPressed: widget.nextPage,
          child: Text(
            "find_next_button".tr,
          ),
        ),
      ),
    );
  }
}
