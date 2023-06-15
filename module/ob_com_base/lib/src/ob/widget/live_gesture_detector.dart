import 'package:flutter/material.dart';

enum BorderRadiusType {
  All,
  AboveLeftandRight,
  BelowLeftandRight,
  Left,
  Right,
}

class LivedGestureDetector extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final HitTestBehavior? behavior;
  final BorderRadiusType? radiusType;
  final double radius;
  late BorderRadiusGeometry? borderRadius;


  LivedGestureDetector({
    Key? key,
    this.onTap,
    this.child,
    this.behavior,
    this.radiusType,
    this.radius = 0.0,
    this.borderRadius,
  }) : super(key: key);

  @override
  _LivedGestureDetectorState createState() => _LivedGestureDetectorState();
}

class _LivedGestureDetectorState extends State<LivedGestureDetector> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: _radiusGeometry(),
          color:
              _isPressed ? Colors.white.withOpacity(0.06) : Colors.transparent,
        ),
        position: DecorationPosition.foreground,
        child: widget.child,
      ),
    );
  }

  BorderRadiusGeometry? _radiusGeometry(){
    if(widget.borderRadius != null){
      return widget.borderRadius;
    }

    switch(widget.radiusType){
      case BorderRadiusType.All:
        return widget.borderRadius;
      case BorderRadiusType.AboveLeftandRight:
        widget.borderRadius = BorderRadius.only(
          topLeft: Radius.circular(widget.radius),
          topRight: Radius.circular(widget.radius),
        );
        return widget.borderRadius;
      case BorderRadiusType.BelowLeftandRight:
        widget.borderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(widget.radius),
          bottomRight: Radius.circular(widget.radius),
        );
        return widget.borderRadius;
      case BorderRadiusType.Left:
        widget.borderRadius = BorderRadius.only(
          topLeft: Radius.circular(widget.radius),
          bottomLeft: Radius.circular(widget.radius),
        );
        return widget.borderRadius;
      case BorderRadiusType.Right:
        widget.borderRadius = BorderRadius.only(
          topRight: Radius.circular(widget.radius),
          bottomRight: Radius.circular(widget.radius),
        );
        return widget.borderRadius;
      default:
        return widget.borderRadius;
    }
  }
}
