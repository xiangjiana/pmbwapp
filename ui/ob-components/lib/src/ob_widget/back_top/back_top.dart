import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class BackTop extends StatefulWidget {
  ///
  const BackTop({
    required this.child,
    Key? key,
    this.visibilityHeight = 400,
    this.onTap,
    this.duration = const Duration(milliseconds: 450),
    this.tapBackTopWidget,
  })  : assert(child is Scrollable || child is ScrollView),
        super(key: key);

  ///
  final Widget child;

  ///
  final double visibilityHeight;

  ///
  final VoidCallback? onTap;

  ///
  final Duration duration;

  ///
  final Widget? tapBackTopWidget;

  @override
  _BackTopState createState() => _BackTopState();
}

class _BackTopState extends State<BackTop> {
  late ScrollController scrollController;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    if (widget.child is Scrollable) {
      assert((widget.child as Scrollable).controller != null);
      scrollController = (widget.child as Scrollable).controller!;
    }
    if (widget.child is ScrollView) {
      assert((widget.child as ScrollView).controller != null);
      scrollController = (widget.child as ScrollView).controller!;
    }
    scrollController.addListener(_handleScroll);
  }

  @override
  void didUpdateWidget(covariant BackTop oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Visibility(
          visible: visible,
          child: PositionedDirectional(
            end: 16,
            bottom: 16,
            child: GestureDetector(
              onTap: _scrollTop,
              child: SafeArea(
                  child: widget.tapBackTopWidget ??
                      const Icon(Icons.arrow_upward)),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _scrollTop() {
    scrollController.animateTo(0,
        duration: widget.duration, curve: Curves.linear);
    widget.onTap?.call();
  }

  void _handleScroll() {
    setState(() {
      visible = scrollController.offset > widget.visibilityHeight;
    });
  }
}
