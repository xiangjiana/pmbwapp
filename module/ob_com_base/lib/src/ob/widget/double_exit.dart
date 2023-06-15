import 'package:flutter/widgets.dart';

class DoubleTapExit extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback? onIntercept;

  const DoubleTapExit(
      {Key? key,
      required this.child,
      this.duration = const Duration(seconds: 3),
      this.onIntercept})
      : super(key: key);

  @override
  _DoubleTapExitState createState() => _DoubleTapExitState();
}

class _DoubleTapExitState extends State<DoubleTapExit> {
  DateTime? _lastClickTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: () async {
        if (_lastClickTime == null ||
            (DateTime.now().difference(_lastClickTime!) > widget.duration)) {
          _lastClickTime = DateTime.now();
          widget.onIntercept?.call();
          return false;
        }
        return true;
      },
    );
  }
}
