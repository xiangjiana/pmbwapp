part of ob_animation_marquee;

class ObAnimationMarquee extends StatefulWidget {
  final List<Widget> children;
  final Duration? duration;
  final AxisDirection? direction;
  Function onItemTap;

  ObAnimationMarquee({
    Key? key,
    required this.children,
    required this.onItemTap,
    this.duration,
    this.direction,
  });

  @override
  State<StatefulWidget> createState() => _MarqueeState();
}

class _MarqueeState extends State<ObAnimationMarquee>
    with SingleTickerProviderStateMixin {
  late Timer _timer = Timer.periodic(
      Duration(milliseconds: 1500), (time) => setState(() => _indexFun()));
  var _index = 0;
  List<Widget> _children = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return _itemWid(widget.direction ?? AxisDirection.left);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((callback) {
      setState(() => _indexFun());
      _timer = Timer.periodic(widget.duration ?? Duration(milliseconds: 1500),
          (time) => setState(() => _indexFun()));
    });
  }

  _indexFun() {
    if (widget.children.length == 0) {
      return;
    }
    ++_index;
    if (_index > widget.children.length) {
      _index = 0;
    }
    if (widget.children.length > 0 && _index != 0)
      _index = _index % widget.children.length;
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  Widget _itemWid(direction) {
    if (_children != null) {
      _children.clear();
    }
    for (int i = 0; i < widget.children.length; i++) {
      _children.add(
        Container(
          key: ValueKey<int>(i),
          child: GestureDetector(
            child: widget.children[i],
            onTap: () => widget.onItemTap != null ? widget.onItemTap(i) : null,
          ),
        ),
      );
    }
    return AnimatedSwitcher(
      duration: widget.duration ?? Duration(milliseconds: 1500),
      child: _children[_index],
      transitionBuilder: (Widget child, Animation<double> animation) {
        return MarqueeTransition(
          child: child,
          direction: widget.direction ?? AxisDirection.left,
          pos: animation,
        );
      },
    );
  }
}
