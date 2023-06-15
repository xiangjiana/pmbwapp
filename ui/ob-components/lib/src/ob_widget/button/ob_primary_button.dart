import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_component/src/theme/colors.dart';
import 'package:ob_component/src/theme/ob_theme.dart';
import 'package:ob_component/ob_component.dart' as ob_component;

/// 从ob_components复制出来的（原来的PrimaryButton），增加了对不同客户端clientId的判断展示不同背景渐变色和渐变方向
// ignore: must_be_immutable
class OBasePrimaryButton extends StatefulWidget {
  static BoxDecoration blueBg = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
    gradient: LinearGradient(
        colors: [Color(0xff5718CC), Color(0xff9459FF)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [
          0.5,
          0.5,
        ]),
  );

  ///
  const OBasePrimaryButton({
    required this.child,
    Key? key,
    this.disabled = false,
    this.block = false,
    this.onPressed,
    this.size = ob_component.ButtonSize.middle,
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
  final ob_component.ButtonSize size;

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

  final double strokeWidth;

  final double? progressSize;

  @override
  _OBasePrimaryButtonState createState() => _OBasePrimaryButtonState();
}

class _OBasePrimaryButtonState extends State<OBasePrimaryButton> {
  bool _isPressed = false;

  double get height {
    switch (widget.size) {
      case ob_component.ButtonSize.large:
        return 40;
      case ob_component.ButtonSize.middle:
        return 32;
      case ob_component.ButtonSize.small:
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
        fontSize: widget.size == ob_component.ButtonSize.large
            ? 16
            : widget.size == ob_component.ButtonSize.middle
            ? 14
            : 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
