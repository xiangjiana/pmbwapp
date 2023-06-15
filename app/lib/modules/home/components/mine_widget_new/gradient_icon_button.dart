import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class GradientNewIconButton extends StatefulWidget {
  final double width;
  final double height;
  final List<Color> gradient;
  final Widget icon;
  final String text;
  final VoidCallback? onPress;
  final TextStyle? textStyle;

  const GradientNewIconButton({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.text,
    required this.gradient,
    this.textStyle,
    this.onPress,
  }) : super(key: key);

  @override
  _GradientNewIconButtonState createState() => _GradientNewIconButtonState();
}

class _GradientNewIconButtonState extends State<GradientNewIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      height: widget.height,
      constraints: BoxConstraints(
        maxWidth: widget.width,
      ),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: widget.gradient,
        ),
      ),
      child: IconText(
        widget.text,
        padding: EdgeInsets.only(right: LocaleUtils.isLocale ? 2.w : 4.w,),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: this.widget.textStyle ??
            TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: LocaleUtils.isLocale ? 12 : 14,
              color: Colors.white,
              height: 1.1,
            ),
        icon: widget.icon,
      ),
    );
    if (_isPressed) {
      current = DecoratedBox(
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Colors.black.withOpacity(0.1),
        ),
        position: DecorationPosition.foreground,
        child: current,
      );
    }
    return GestureDetector(
      onTap: widget.onPress,
      onPanDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onPanEnd: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onPanCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: current,
    );
  }
}
