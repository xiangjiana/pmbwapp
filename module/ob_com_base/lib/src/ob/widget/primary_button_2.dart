import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_component/src/theme/colors.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' as ob_component;

/// 从ob_components复制出来的（原来的PrimaryButton），增加了对不同客户端clientId的判断展示不同背景渐变色和渐变方向
class OBasePrimaryButton2 extends StatefulWidget {
  ///
  const OBasePrimaryButton2({
    required this.child,
    Key? key,
    this.disabled = false,
    this.block = false,
    this.onPressed,
    this.size = ob_component.ButtonSize.middle,
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

  @override
  _OBasePrimaryButtonState createState() => _OBasePrimaryButtonState();
}

class _OBasePrimaryButtonState extends State<OBasePrimaryButton2> {
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
        children: <Widget>[widget.child],
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
        borderRadius: BorderRadius.circular(2.0),
        // gradient: ObTheming.buttonGradient,
        /*gradient: LinearGradient(
            colors: [Color(0xff219C43), Color(0xff68CE15)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [
              0.5,
              0.5,
            ]),*/
        image: DecorationImage(
          image: AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
          fit: BoxFit.fill,
        )
      ),
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
