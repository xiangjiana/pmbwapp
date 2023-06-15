import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color _kCancelPressedColor = Colors.white.withOpacity(0.04);
const double _kActionItemHeight = 56.0;
const double _kActionRadius = 16.0;

///
const TextStyle _style = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
);

///
class ObActionSheet extends StatelessWidget {
  ///
  const ObActionSheet({
    this.title,
    this.actions,
    this.showCancelButton = true,
    this.onCancelButtonListener,
  });

  ///
  final Widget? title;

  ///
  final List<Widget>? actions;

  ///
  final bool showCancelButton;

  ///
  final VoidCallback? onCancelButtonListener;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff1D2933),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(_kActionRadius),
        topRight: Radius.circular(_kActionRadius),
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // title??Container(color: Colors.red,height: 0,),
            _bottomRenderTitle(title),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity,
                  maxHeight: MediaQuery.of(context).size.height * 0.7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: SingleChildScrollView(
                  child: _bottomRenderActionBody(actions),
                ),
              ),
            ),
            _bottomRenderCancelButton(showCancelButton),
          ],
        ),
      ),
    );
  }

  ///
  Widget _bottomRenderTitle(Widget? title) {
    if (title != null) {
      return Column(
        children: <Widget>[
          title,
          Container(color: Colors.white.withOpacity(0.04), height: 1)
        ],
      );
    }
    return Container();
  }

  ///
  Widget _bottomRenderCancelButton(bool show) {
    if (show) {
      return Column(
        children: <Widget>[
          Container(
            color: const Color(0xFF0E1519),
            height: 8.0,
          ),
          BottomActionSheetAction(
            child: const Text("取消",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    decoration: TextDecoration.none)),
            onPressed: onCancelButtonListener ?? () {},
          )
        ],
      );
    }
    return Container();
  }

  ///
  Widget _bottomRenderActionBody(List<Widget>? actionList) {
    return Column(
      children: _bottomRenderActionItems(actionList),
    );
  }

  ///
  List<Widget> _bottomRenderActionItems(List<Widget>? actionList) {
    final List<Widget> list = <Widget>[];
    if (actionList != null) {
      for (final Widget actionItem in actionList) {
        list.add(actionItem);
        list.add(Container(color: Colors.white.withOpacity(0.04), height: 1));
      }
    }
    return list;
  }
}

///
class BottomActionSheetAction extends StatefulWidget {
  ///
  const BottomActionSheetAction({
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  ///
  final Widget child;

  ///
  final VoidCallback onPressed;

  @override
  _BottomActionSheetActionState createState() =>
      _BottomActionSheetActionState();
}

///
class _BottomActionSheetActionState extends State<BottomActionSheetAction> {
  bool isBeingPressed = false;

  void _onTapDown(TapDownDetails event) {
    setState(() {
      isBeingPressed = true;
    });
  }

  void _onTapUp(TapUpDetails event) {
    widget.onPressed.call();
    setState(() {
      isBeingPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      isBeingPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isBeingPressed ? _kCancelPressedColor : Colors.transparent;
    return GestureDetector(
      excludeFromSemantics: true,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Container(
        height: _kActionItemHeight,
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(backgroundColor, context),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: _style,
            child: widget.child,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

///1.默认风格显示标题"提示"，也可以自定义title。
///2.可覆盖整个title组件，或者仅覆盖child
class BottomActionSheetTitle extends StatelessWidget {
  ///
  const BottomActionSheetTitle(
      {this.child, this.title = "提示", this.titleHeight});

  ///
  final Widget? child;

  ///
  final String? title;

  ///
  final double? titleHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: titleHeight ?? 76,
      child: DefaultTextStyle(
        style: _style,
        child: child ??
            Center(
                child: Text(title!,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ))),
      ),
    );
  }
}
