import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 矩形高斯模糊效果
class BlurRectWidget extends StatefulWidget {
  final Widget child;

  /// 模糊值
  final double? sigmaX;
  final double? sigmaY;

  /// 透明度
  final double opacity;


  /// 圆角
  final BorderRadius? borderRadius;

  const BlurRectWidget({
    Key? key,
    required this.child,
     this.sigmaX,
     this.sigmaY,
     required this.opacity,
     this.borderRadius,
  }) : super(key: key);

  @override
  _BlurRectWidgetState createState() => _BlurRectWidgetState();
}

class _BlurRectWidgetState extends State<BlurRectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: widget.borderRadius == null ? BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)) : widget.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: this.widget.sigmaX ?? 10,
            sigmaY: this.widget.sigmaY ??  10,
          ),
          child: Container(
            color: Color(0xff060606).withOpacity(0.3),
            child: this.widget.opacity != null
                ? Opacity(
              opacity: widget.opacity,
              child: this.widget.child,
            )
                : this.widget.child,
          ),
        ),
      ),
    );
  }
}