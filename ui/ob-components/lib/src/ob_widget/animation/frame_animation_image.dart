import 'package:flutter/widgets.dart';

///
class FrameAnimationImage extends StatefulWidget {
  ///
  const FrameAnimationImage({
    required this.animationList,
    Key? key,
    this.duration,
    this.oneShot = true,
  }) : super(key: key);

  ///
  final List<String> animationList;

  ///
  final Duration? duration;

  ///
  final bool oneShot;

  @override
  _FrameAnimationImageState createState() => _FrameAnimationImageState();
}

class _FrameAnimationImageState extends State<FrameAnimationImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 3080),
      vsync: this,
    );
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed && !widget.oneShot) {
        _controller.forward(from: 0);
      }
    });
    _animation = Tween<double>(
      begin: 0,
      end: widget.animationList.length - 1,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          if (mounted) _currentIndex = _animation.value.toInt();
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.animationList[_currentIndex],
      fit: BoxFit.fitWidth,
      gaplessPlayback: true,
      width: 50,
      package: 'ob_component',
    );
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }
}
