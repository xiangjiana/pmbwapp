import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_component/src/ob_widget/button/primary_button.dart';
import 'package:ob_component/src/theme/colors.dart';

///
class SecondaryButton extends StatelessWidget {
  ///
  const SecondaryButton({
    required this.child,
    Key? key,
    this.disabled = false,
    this.block = false,
    this.onPressed,
    this.size = ButtonSize.middle,
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

  @override
  Widget build(BuildContext context) {
    Widget current = child;
    current = DefaultTextStyle(
      style: TextStyle(
        color: white,
        fontSize: size == ButtonSize.large
            ? 16
            : size == ButtonSize.middle
                ? 14
                : 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[child],
        mainAxisSize: MainAxisSize.min,
      ),
    );
    current = block
        ? current
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 2),
            child: current,
          );
    current = SizedBox(
        width: block ? double.infinity : null, height: height, child: current);
    current = DecoratedBox(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: fillColor,
      ),
      child: current,
    );
    current = disabled ? Opacity(opacity: 0.6, child: current) : current;
    return GestureDetector(onTap: disabled ? null : onPressed, child: current);
  }

  ///
  double get height {
    switch (size) {
      case ButtonSize.large:
        return 40;
      case ButtonSize.middle:
        return 32;
      case ButtonSize.small:
        return 28;
    }
  }

  ///
  Color get fillColor {
    switch (size) {
      case ButtonSize.large:
        return Colors.white.withOpacity(0.2);
      case ButtonSize.middle:
      case ButtonSize.small:
        return white6;
    }
  }
}
