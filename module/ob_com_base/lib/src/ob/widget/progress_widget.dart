import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ob_com_base/gen/colors.gen.dart';

class ProgressWidget extends StatefulWidget {
  bool? complete; //完成
  bool wrong;  //错误终止
  bool stopOver; //等待停留
  final VoidCallback? onCallback;

  ProgressWidget(
      {Key? key,
      this.complete = false,
      this.wrong = false,
      this.stopOver = false,
      this.onCallback})
      : super(key: key);

  @override
  _ProgressTestState createState() => _ProgressTestState();
}

class _ProgressTestState extends State<ProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Timer timer;
  late double progress = 0.4;

  @override
  void initState() {
    super.initState();
    // 动画执行时间
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller.forward(from: progress);
    controller.addListener(() {
      progress = controller.value;
      if (widget.wrong) {
        controller.stop();
      }
      if (!widget.complete! &&
          progress >= 0.95 &&
          progress < 1 &&
          widget.stopOver) {
        controller.stop();
      } else if (widget.complete! /*&& progress >= 1*/) {
        widget.onCallback!.call();
        timer.cancel();
      }
      setState(() {});
    });
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (widget.wrong) {
        controller.stop();
        return;
      }
      if (!widget.complete! && !controller.isAnimating && progress < 0.95) {
        controller.forward(from: progress);
      } else if (widget.complete! && progress >= 0.95) {
        controller.forward(from: progress);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: ColorName.colorTextWhite30,
      valueColor: ColorTween(
              begin: ColorName.colorMainGradient1, end: ColorName.colorMain)
          .animate(controller),
      value: controller.value,
    );
  }
}
