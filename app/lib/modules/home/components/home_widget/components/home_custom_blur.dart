import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBlur extends StatelessWidget {
  //高斯模糊下面的Widget  一般放图片
  final Widget? bgChild;

  //高斯模糊上面的Widget
  final Widget child;
  final double width;
  final double height;

  //圆角
  final BorderRadius borderRadius;

  //高斯模糊的颜色值
  final Color? color;

  CustomBlur(
      {required this.bgChild,
      required this.child,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.color})
      : assert(bgChild != null);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          bgChild ?? Container(),
          BackdropFilter(
            ///高斯模糊 参数改成18 目前只有首页最新游戏那里用到
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18), //可以看源码
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color ?? Colors.white.withOpacity(0.06),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
