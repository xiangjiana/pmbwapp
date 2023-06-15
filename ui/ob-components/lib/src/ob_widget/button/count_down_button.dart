import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';

///
class CountDownButton extends StatefulWidget {
  ///
  const CountDownButton(
      {required this.onTap,
      required this.initialText,
      Key? key,
      this.style,
      this.countDownEndText,
      this.controller})
      : super(key: key);

  ///
  final GestureTapCallback onTap;

  ///
  final TextStyle? style;

  ///
  final CountDownController? controller;

  ///
  final String initialText;

  ///
  final String? countDownEndText;

  @override
  _CountDownButtonState createState() => _CountDownButtonState();
}

class _CountDownButtonState extends State<CountDownButton> {
  late CountDownController _controller;
  late Duration _duration;

  bool onceCountDown = false;

  bool get isTicking => _controller.isTicking;

  @override
  void initState() {
    _controller = widget.controller ?? CountDownController();
    _controller
        .addCountDownEndCallback(() => setState(() => onceCountDown = true));
    _controller.addDurationChangeCallback(
        (Duration d) => setState(() => _duration = d));
    _duration = _controller.duration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isTicking) {
          return;
        } else {
          widget.onTap.call();
        }
      },
      child: Text(
        isTicking
            ? '${_duration.inSeconds}S'
            : onceCountDown
                ? widget.countDownEndText ?? widget.initialText
                : widget.initialText,
        style: widget.style ??
            ObTheme.of(context)
                .typographyTheme
                .body2
                ?.apply(color: ObTheme.of(context).colorScheme.secondaryColor),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

///
class CountDownController {
  ///
  CountDownController({
    this.duration = const Duration(seconds: 60),
    this.interval = const Duration(seconds: 1),
    this.onCountDownListener,
    this.onCountDownEndListener,
  }) {
    _duration = duration;
  }

  ///
  Duration duration;

  ///
  final Duration interval;

  ///
  ValueChanged<Duration>? onCountDownListener;

  ///
  VoidCallback? onCountDownEndListener;

  late Duration _duration;
  Timer? _timer;

  ///
  bool get isTicking => _duration < duration;

  ///
  void addDurationChangeCallback(ValueChanged<Duration> callback) {
    onCountDownListener = callback;
  }

  ///
  void addCountDownEndCallback(VoidCallback callback) {
    onCountDownEndListener = callback;
  }

  ///
  void updateDuration(Duration duration) {
    if (isTicking) _timer?.cancel();
    _duration = duration;
    this.duration = duration;
  }

  ///
  void startTimer() {
    if (isTicking) return;
    _timer = Timer.periodic(interval, (Timer timer) {
      if (_duration.inSeconds == 0) {
        timer.cancel();
        _duration = duration;
        onCountDownEndListener?.call();
      } else {
        _duration = Duration(seconds: _duration.inSeconds - 1);
        onCountDownListener?.call(_duration);
      }
    });
  }

  ///
  void dispose() {
    _timer?.cancel();
  }
}
