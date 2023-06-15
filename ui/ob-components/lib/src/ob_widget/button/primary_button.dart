import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ob_component/src/theme/colors.dart';

/// ui 设计主要按钮
class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    required this.child,
    this.disabled = false,
    this.block = false,
    this.onPressed,
    this.size = ButtonSize.middle,
    this.gradient,
    this.image,
    this.borderRadius,
    this.decoration,
    this.loadingStatus = false,
    this.strokeWidth = 2.0,
    this.progressSize,
  }) : super(key: key);

  ///
  final bool disabled;

  ///
  final bool block;

  ///
  final Widget child;

  ///
  final ButtonSize size;

  ///
  final VoidCallback? onPressed;

  ///
  final Gradient? gradient;

  ///
  final DecorationImage? image;

  ///
  final BorderRadiusGeometry? borderRadius;

  ///
  final Decoration? decoration;

  ///
  final bool loadingStatus;

  ///
  final double strokeWidth;

  ///
  final double? progressSize;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  double get height {
    switch (widget.size) {
      case ButtonSize.large:
        return 40;
      case ButtonSize.middle:
        return 32;
      case ButtonSize.small:
        return 28;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget current = widget.child;
    current = DefaultTextStyle(
      style: TextStyle(
        color: white,
        height: 1.1,
        fontSize: widget.size == ButtonSize.large
            ? 16
            : widget.size == ButtonSize.middle
            ? 14
            : 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (widget.loadingStatus)
            SizedBox(
              width: widget.progressSize ?? 18.w,
              height: widget.progressSize ?? 18.w,
              child: CircularProgressIndicator(
                backgroundColor: const Color(0xFFFFFFFF).withOpacity(.20),
                strokeWidth: widget.strokeWidth,
                valueColor: const AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          if (widget.loadingStatus) SizedBox(width: 8.w),
          widget.child,
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
    current = widget.block
        ? current
        : Padding(
      padding: EdgeInsets.symmetric(horizontal: height / 2),
      child: current,
    );
    current = SizedBox(
        width: widget.block ? double.infinity : null,
        height: height,
        child: current);

    Decoration decoration = widget.decoration ??
        BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(2.0),
          gradient: widget.gradient,
          image: widget.image,
        );

    current = DecoratedBox(
      decoration: decoration,
      child: current,
    );
    if (_isPressed) {
      current = DecoratedBox(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
        position: DecorationPosition.foreground,
        child: current,
      );
    }
    current = widget.disabled
        ? AnimatedOpacity(
        opacity: 0.6,
        duration: const Duration(milliseconds: 250),
        child: current)
        : current;
    return GestureDetector(
      onTap: widget.disabled ? null : widget.onPressed,
      child: current,
      onTapDown: (_) {
        if (!widget.disabled)
          setState(() {
            _isPressed = true;
          });
      },
      onTapUp: (_) {
        if (!widget.disabled)
          setState(() {
            _isPressed = false;
          });
      },
      onTapCancel: () {
        if (!widget.disabled)
          setState(() {
            _isPressed = false;
          });
      },
    );
  }
}

///
enum ButtonSize {
  ///
  large,

  ///
  middle,

  ///
  small
}
