import 'package:flutter/material.dart';

class AnimatedGestureDetector extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final HitTestBehavior? behavior;

  const AnimatedGestureDetector({
    Key? key,
    this.onTap,
    required this.child,
    this.behavior,
  }) : super(key: key);

  @override
  _AnimatedGestureDetectorState createState() =>
      _AnimatedGestureDetectorState();
}

class _AnimatedGestureDetectorState extends State<AnimatedGestureDetector>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _animationController.forward();
        await Future.delayed(Duration(milliseconds: 100));
        if (widget.onTap != null) widget.onTap!();
        //await Future.delayed(Duration(milliseconds: 100));
        //_animationController.reverse();
        Future.delayed(Duration(milliseconds: 100), () {
          _animationController.reverse();
        });
      },
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      onLongPress: () {
        if (widget.onTap != null) widget.onTap!();
        _animationController.reverse();
      },
      child: ScaleTransition(
        scale: Tween(begin: 1.0, end: 0.9)
            .chain(CurveTween(curve: Curves.easeInOut))
            .animate(_animationController),
        child: widget.child,
      ),
    );
  }
}
