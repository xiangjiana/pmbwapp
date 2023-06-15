import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';

///渐变色背景的Container
class GradientBackgroundContainer extends StatelessWidget {
  ///
  const GradientBackgroundContainer({
    Key? key,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    Color? beginColor,
    Color? endColor,
    this.child,
    this.margin,
    this.padding,
    double? radius,
    this.width,
    this.height,
  })  : beginColor = beginColor ?? coral,
        endColor = endColor ?? orange,
        radius = radius ?? 8,
        super(key: key);

  ///渐变开始位置
  final Alignment begin;

  ///渐变结束位置
  final Alignment end;

  ///渐变开始颜色
  final Color beginColor;

  ///渐变结束颜色
  final Color endColor;

  ///子控件
  final Widget? child;

  ///外边距
  final EdgeInsets? margin;

  ///内边距
  final EdgeInsets? padding;

  ///圆角度
  final double radius;

  ///宽度
  final double? width;

  ///高度
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
        gradient: LinearGradient(
          colors: <Color>[beginColor, endColor],
          begin: begin,
          end: end,
        ),
      ),
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}
