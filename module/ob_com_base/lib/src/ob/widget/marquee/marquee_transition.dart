part of ob_animation_marquee;

class MarqueeTransition extends AnimatedWidget {
  final bool transformHitTests;
  final Widget? child;

  //退场（出）方向
  final AxisDirection direction;
  late Tween<Offset> _tween;
  final Animation<double> pos;

  MarqueeTransition({
    Key? key,
    required this.pos,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(pos != null),
        super(key: key, listenable: pos) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => pos;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
        translation: offset,
        transformHitTests: transformHitTests,
        child: child);
  }
}
