import 'package:flutter/material.dart' hide PageController;

class Tip extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;

  const Tip(
      {Key? key,
      this.width,
      this.height,
      this.borderRadius = 0,
      this.backgroundColor,
      this.padding,
      this.margin,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      child: child,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
    );
  }
}
