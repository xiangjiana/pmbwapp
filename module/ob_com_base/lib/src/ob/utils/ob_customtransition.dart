import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class ObCustomTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ObSlideRightTransition().buildTransitions(context, curve, alignment, animation, secondaryAnimation, child);
  }
}

class ObSlideRightTransition extends SlideRightTransition {
  ///linear
  @override
  Widget buildTransitions(BuildContext context, Curve? curve, Alignment? alignment, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: animation
          .drive(Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.decelerate))),
      child: SlideTransition(
          position: secondaryAnimation.drive(Tween<Offset>(begin: Offset.zero, end: const Offset(-0.33, 0.0))
              .chain(CurveTween(curve: Curves.decelerate))),
          child: child),
    );
  }
}
