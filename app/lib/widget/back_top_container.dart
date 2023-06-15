import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class BackTopContainer extends StatefulWidget {
  late final Widget Function(ScrollController) buildChild;
  final Widget? stayTopWidget; //吸顶的widget
  final double? stayTopOffset; //滑动多少距离显示
  final bool? needBackTop; //是否需要返回顶部
  BackTopContainer(
      {required this.buildChild,
      this.stayTopOffset = 50,
      required this.stayTopWidget,
      this.needBackTop = true});

  @override
  _BackTopContainerState createState() => _BackTopContainerState();
}

class _BackTopContainerState extends State<BackTopContainer> {
  bool showBackTop = false;
  bool showStayTop = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 1.sh &&
          widget.needBackTop!) {
        if (showBackTop == false) {
          showBackTop = true;
          eventBus.fire(BackTopEvent(true));
          setState(() {});
        }
      } else {
        if (showBackTop == true) {
          showBackTop = false;
          eventBus.fire(BackTopEvent(false));
          setState(() {});
        }
      }
      if (widget.stayTopWidget != null) {
        if (scrollController.offset > widget.stayTopOffset!) {
          if (showStayTop == false) {
            showStayTop = true;
            setState(() {});
          }
        } else {
          if (showStayTop == true) {
            showStayTop = false;
            setState(() {});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.buildChild(scrollController),
        if (showStayTop) widget.stayTopWidget!,
        Visibility(
          visible: showBackTop && false, //不需要了
          child: Positioned(
            right: 0,
            bottom: 1.sh / 4,
            child: TextButton(
              onPressed: () {
                scrollController.animateTo(0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
              child: Center(
                child: Icon(
                  Icons.arrow_circle_up,
                  size: 30.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
