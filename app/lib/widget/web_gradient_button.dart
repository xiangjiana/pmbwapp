import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class WebGradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  late final double width;
  late final double height;
  final Color beginColor;
  final Color endColor;
  final String text;
  final TextStyle textStyle;
  final bool isEnabled;
  final EdgeInsetsGeometry? margin;
  WebGradientButton({
    Key? key,
    required this.onPressed,
    required this.width,
    required this.height,
    Color? beginColor,
    Color? endColor,
    required this.text,
    TextStyle? textStyle,
    this.isEnabled = true,
    this.margin,
  })  : assert(width != null && height != null),
        assert(text != null),
        this.beginColor =
            beginColor ?? Get.theme.buttonTheme.colorScheme!.primary,
        this.endColor =
            endColor ?? Get.theme.buttonTheme.colorScheme!.primaryVariant,
        this.textStyle = TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((height / 2).w),
          gradient: LinearGradient(
            colors: isEnabled
                ? [beginColor, endColor]
                : [beginColor.withOpacity(0.6), endColor.withOpacity(0.6)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
    // SizedBox(width: 31.w),
  }
}
