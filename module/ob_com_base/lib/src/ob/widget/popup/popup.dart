part of ob_popup;

const int _windowPopupDuration = 300;
const double _kWindowCloseIntervalEnd = 2.0 / 3.0;
const Duration _kWindowDuration = Duration(milliseconds: _windowPopupDuration);

typedef AnimatedWidgetBuilder = Widget Function(BuildContext context,
    Animation<double> animation, Animation<double> secondaryAnimation);

class PopupButton<T> extends StatefulWidget {
  const PopupButton({
    Key? key,
    required this.buttonBuilder,
    required this.windowBuilder,
    this.offset = Offset.zero,
    this.duration = _kWindowDuration,
    this.bgBarrier = false,
    this.onWindowShow,
    this.onWindowDismiss,
  })  : assert(buttonBuilder != null && windowBuilder != null),
        super(key: key);

  /// 显示按钮button
  final WidgetBuilder buttonBuilder;

  /// window 出现的位置。
  final Offset offset;

  /// 按钮按钮后到显示window 出现的时间
  final Duration duration;

  /// 需要显示的window
  final AnimatedWidgetBuilder windowBuilder;

  final VoidCallback? onWindowShow;

  final VoidCallback? onWindowDismiss;

  final bool bgBarrier;

  @override
  _PopupButtonState createState() {
    return _PopupButtonState();
  }

  static _PopupButtonState of(BuildContext context) {
    final _PopupScope? scope =
        context.dependOnInheritedWidgetOfExactType<_PopupScope>();
    return scope!.state;
  }
}

void showWindow<T>({
  required BuildContext context,
  required RelativeRect position,
  required RelativeRect bgPosition,
  Duration duration = _kWindowDuration,
  bool? bgBarrier,
  String? semanticLabel,
  required AnimatedWidgetBuilder windowBuilder,
  VoidCallback? onWindowShow,
  VoidCallback? onWindowDismiss,
}) {
  Navigator.push(
    context,
    _PopupRoute<T>(
      position: position,
      duration: duration,
      bgPosition: bgPosition,
      bgBarrier: bgBarrier!,
      semanticLabel: semanticLabel,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      windowBuilder: windowBuilder,
      onWindowShow: onWindowShow,
      onWindowDismiss: onWindowDismiss,
    ),
  );
}

void dismiss() {
  /*alphaController?.reverse();
    widget.child?.dismiss();*/
}

class _PopupButtonState<T> extends State<PopupButton> {
  void showPopupWindow() {
    final RelativeRect position = _handlerFromRect(context, widget.offset);
    final RelativeRect bgPosition = RelativeRect.fromLTRB(
      position.left,
      0.0,
      position.right,
      position.bottom,
    );

    showWindow<T>(
      context: context,
      position: position,
      bgPosition: bgPosition,
      bgBarrier:widget.bgBarrier,
      duration: widget.duration,
      windowBuilder: widget.windowBuilder,
      onWindowShow: widget.onWindowShow,
      onWindowDismiss: widget.onWindowDismiss,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _PopupScope(
      state: this,
      child: InkWell(
        onTap: showPopupWindow,
        child: widget.buttonBuilder.call(context),
      ),
    );
  }
}

class _PopupRoute<T> extends PopupRoute<T> {
  _PopupRoute({
    required this.windowBuilder,
    required this.position,
    required this.bgPosition,
    this.barrierLabel,
    this.semanticLabel,
    this.duration,
    this.onWindowShow,
    this.onWindowDismiss,
    this.bgBarrier = false,
  });

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, _kWindowCloseIntervalEnd),
    );
  }

  final RelativeRect position;
  final RelativeRect bgPosition;
  final String? semanticLabel;
  @override
  final String? barrierLabel;
  final Duration? duration;
  final AnimatedWidgetBuilder windowBuilder;
  final VoidCallback? onWindowShow;
  final VoidCallback? onWindowDismiss;
  final bool bgBarrier;

  @override
  Duration get transitionDuration => duration ?? _kWindowDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool didPop(T? result) {
    onWindowDismiss?.call();
    return super.didPop(result);
  }

  @override
  TickerFuture didPush() {
    onWindowShow?.call();
    return super.didPush();
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _handlerLayout(context, animation, secondaryAnimation);
  }

  Widget _handlerLayout(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    if (bgBarrier) {
      return CustomSingleChildLayout(
        delegate: _PopupLayout(position),
        child: GestureDetector(
          onTap: () {
            if (onWindowDismiss != null) {
              onWindowDismiss?.call();
            } else {
              Navigator.of(context)..pop();
            }
          },
          child: Container(
            color: Colors.black.withOpacity(.6),
            child: CustomSingleChildLayout(
              delegate: _PopupLayout(bgPosition),
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return windowBuilder(context, animation, secondaryAnimation);
                },
              ),
            ),
          ),
        ),
      );
    }

    return CustomSingleChildLayout(
      delegate: _PopupLayout(position),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return windowBuilder(context, animation, secondaryAnimation);
        },
      ),
    );
  }
}

RelativeRect _handlerFromRect(context, Offset offset) {
  final RenderBox button = context.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Overlay.of(context)?.context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(
        offset,
        ancestor: overlay,
      ),
      button.localToGlobal(
        button.size.bottomRight(Offset.zero),
        ancestor: overlay,
      ),
    ),
    Offset.zero & overlay.size,
  );
  return position;
}

class _PopupLayout extends SingleChildLayoutDelegate {
  _PopupLayout(this.position);

  final RelativeRect position;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double y = position.top;
    double x = 0;
    if (position.left > position.right) {
      x = size.width - position.right - childSize.width;
    } else if (position.left < position.right) {
      x = position.left;
    }
    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupLayout oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _PopupScope extends InheritedWidget {
  const _PopupScope({Key? key, required this.state, required Widget child})
      : super(key: key, child: child);

  final _PopupButtonState state;

  @override
  bool updateShouldNotify(_PopupScope oldWidget) {
    return state != oldWidget.state;
  }
}
