import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/widgets.dart';

class FadeNewSlideAnimate extends StatelessWidget {
  const FadeNewSlideAnimate({
    Key? key,
    required this.animateKey,
    required this.child,
    this.disabled = false,
    this.delay = Duration.zero,
    this.curve = Curves.easeInOutBack,
    this.duration = const Duration(milliseconds: 450),
    this.opacity = const [0.0, 1.0],
    this.offset = const [Offset(0, 0.15), Offset.zero],
  }) : super(key: key);

  final Key animateKey;
  final bool disabled;
  final Widget child;
  final Duration delay;
  final Curve curve;
  final Duration duration;
  final List<Offset> offset;
  final List<double> opacity;

  @override
  Widget build(BuildContext context) {
    if (disabled) return child;
    return AnimateIfVisible(
      key: animateKey,
      duration: duration,
      delay: delay,
      builder: (
        BuildContext context,
        Animation<double> animation,
      ) {
        return FadeTransition(
          opacity: Tween<double>(begin: opacity[0], end: opacity[1])
              .animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: offset[0],
              end: offset[1],
            ).chain(CurveTween(curve: curve)).animate(animation),
            child: child,
          ),
        );
      },
    );
  }
}
