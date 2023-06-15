import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PinNewTop extends StatefulWidget {
  final Widget child;
  final double visibilityHeight;
  final VoidCallback? onTap;
  final Widget? pinTopWidget;

  const PinNewTop({
    Key? key,
    required this.child,
    this.visibilityHeight = 400,
    this.onTap,
    this.pinTopWidget,
  })  : assert(child is Scrollable ||
            child is ScrollView ||
            child is SingleChildScrollView),
        super(key: key);

  @override
  _PinNewTopState createState() => _PinNewTopState();
}

class _PinNewTopState extends State<PinNewTop> {
  late ScrollController scrollController;
  var visible = false;

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
    if (widget.child is SingleChildScrollView) {
      assert((widget.child as SingleChildScrollView).controller != null);
      scrollController = (widget.child as SingleChildScrollView).controller!;
    }
    scrollController.addListener(_handleScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        PositionedDirectional(
          top: 0,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: visible ? 1 : 0,
            child: widget.pinTopWidget ?? SizedBox.shrink(),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      visible = scrollController.offset > widget.visibilityHeight;
    });
  }
}
