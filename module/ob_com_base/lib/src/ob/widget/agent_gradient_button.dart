import 'package:flutter/material.dart';
import 'package:ob_com_base/src/ob/widget/ob_text.dart';

class AgentGradientButton extends StatelessWidget {
  late final double width;
  late final double height;
  final Color? beginColor;
  final Color? endColor;
  final String text;
  final TextStyle textStyle;
  final Function()? onPress;
  final bool isEnabled;
  final EdgeInsetsGeometry? margin;

  AgentGradientButton({
    Key? key,
    required this.width,
    required this.height,
    this.beginColor,
    this.endColor,
    required this.text,
    TextStyle? textStyle,
    this.onPress,
    this.isEnabled = true,
    this.margin,
  })  : assert(width != null && height != null),
        assert(text != null),
        this.textStyle =textStyle?? TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final beginColor = this.beginColor ?? Theme.of(context).buttonTheme.colorScheme?.primary ?? Colors.white30;
    final endColor = this.endColor ?? Theme.of(context).buttonTheme.colorScheme?.primaryVariant ?? Colors.white30;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onPress != null && isEnabled) {
          onPress!();
        }
      },
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        margin: margin,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            colors: isEnabled
                ? [beginColor, endColor]
                : [beginColor.withOpacity(0.6), endColor.withOpacity(0.6)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ObText(
          text,
          height: textStyle.height ?? 1.1,
          style: isEnabled
              ? textStyle
              : textStyle.copyWith(
                  color: textStyle.color?.withOpacity(0.6) ?? Colors.white60),
        ),
      ),
    );
  }
}
