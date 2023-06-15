import 'package:flutter/material.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_com_base/ob_com_base.dart' show Store, ObTheming;

/// ui 设计主要按钮
class ObLoadingButton extends StatefulWidget {
  const ObLoadingButton({
    required this.child,
    Key? key,
    this.disabled = false,
    this.block = false,
    this.progressSize,
    this.loadingStatus = false,
    this.strokeWidth = 2.0,
    this.onPressed,
    this.size = ButtonSize.middle,
  }) : super(key: key);

  final bool disabled;
  final bool block;
  final Widget child;
  final ButtonSize size;
  final VoidCallback? onPressed;
  final double strokeWidth;
  final double? progressSize;
  final bool loadingStatus;

  @override
  _ObLoadingButtonState createState() => _ObLoadingButtonState();
}

class _ObLoadingButtonState extends State<ObLoadingButton> {
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
                backgroundColor: ColorName.colorTextWhite100.withOpacity(.20),
                strokeWidth: widget.strokeWidth,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
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

    current = DecoratedBox(
      decoration: BoxDecoration(
        gradient: ObTheming.buttonGradientNew,
        borderRadius: BorderRadius.circular(2),
      ),
      // decoration: ShapeDecoration(
      //   shape: const StadiumBorder(),
      //   gradient: Store.clientId==Store.clientIdDJ?ObTheming.buttonGradientNew:LinearGradient(
      //     colors: ObTheme.of(context).colorScheme.primaryGradientColor ,
      //     begin: Alignment.centerLeft,
      //     end: Alignment.centerRight,
      //   ),
      // ),
      child: current,
    );
    if (_isPressed) {
      current = DecoratedBox(
        decoration: ShapeDecoration(
            shape: const StadiumBorder(), color: Colors.black.withOpacity(0.1)),
        position: DecorationPosition.foreground,
        child: current,
      );
    }
    current = widget.disabled || widget.loadingStatus
        ? AnimatedOpacity(
            opacity: 0.6,
            duration: const Duration(milliseconds: 250),
            child: current)
        : current;
    return GestureDetector(
      onTap: widget.disabled || widget.loadingStatus ? null : widget.onPressed,
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
