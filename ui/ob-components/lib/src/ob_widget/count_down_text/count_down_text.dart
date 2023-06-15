import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';

///分秒倒计时文本
class CountDownText extends StatefulWidget {
  ///
  const CountDownText(
      {required this.endDateTime,
      this.timeTextStyle,
      this.textStyle,
      this.onFinish});

  ///结束时间
  final DateTime endDateTime;

  ///倒计时结束回调
  final Function()? onFinish;

  ///时间字体样式
  final TextStyle? timeTextStyle;

  ///分秒字体样式
  final TextStyle? textStyle;

  @override
  _CountDownTextState createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  ///倒计时
  late Timer timer;

  ///分
  String minute = "0";

  ///秒
  String second = "0";

  ///默认时间字体样式
  TextStyle defaultTimeTextStyle =
      const TextStyle(fontSize: 40, color: corn, height: 1);

  ///默认分秒字体样式
  TextStyle defaultTextStyle =
      TextStyle(fontSize: 16, color: corn.withOpacity(0.6), height: 1);
  late DateTime currentDateTime;
  bool finished = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
        const Duration(
          milliseconds: 500,
        ), (Timer timer) {
      ///刷新当前时间
      currentDateTime = DateTime.now();

      ///获取当前时间与结束事件的时间秒差
      int seconds = currentDateTime.difference(widget.endDateTime).inSeconds;

      ///已经超过结束时间了
      if (seconds > 0) {
        if (widget.onFinish != null && !finished) {
          finished = true;
          widget.onFinish!.call();
        }
        timer.cancel();
        return;
      }

      ///转成正数
      seconds = -seconds;
      bool needSetState = false;
      if (minute != "${seconds ~/ 60}" || second != "${seconds % 60}") {
        needSetState = true;
        minute = "${seconds ~/ 60}";
        second = "${seconds % 60}";
      }

      if (needSetState && mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant CountDownText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.endDateTime.isAtSameMomentAs(widget.endDateTime) &&
        widget.endDateTime.isAfter(DateTime.now())) {
      finished = false;
      if (!timer.isActive) {
        startTimer();
      }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          minute,
          style: widget.timeTextStyle ?? defaultTimeTextStyle,
        ),
        Container(
          margin: EdgeInsets.all(4),
          child: Text(
            "分",
            style: widget.textStyle ?? defaultTextStyle,
          ),
        ),
        Text(
          second,
          style: widget.timeTextStyle ?? defaultTimeTextStyle,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4, bottom: 4),
          child: Text(
            "秒",
            style: widget.textStyle ?? defaultTextStyle,
          ),
        ),
      ],
    );
  }
}
