import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UserToggleState extends InheritedWidget {
  const UserToggleState({
    Key? key,
    required this.direction,
    required Widget child,
  }) : super(key: key, child: child);

  final Axis direction;

  @override
  bool updateShouldNotify(covariant UserToggleState oldWidget) {
    return direction != oldWidget.direction;
  }

  static UserToggleState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserToggleState>();
  }
}

class ActionTypeListener extends StatefulWidget {
  const ActionTypeListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _ActionTypeListenerState createState() => _ActionTypeListenerState();
}

class _ActionTypeListenerState extends State<ActionTypeListener> {
  ValueNotifier<ActionPaneType>? _actionPaneTypeValueNotifier;

  @override
  void initState() {
    super.initState();
    _actionPaneTypeValueNotifier = Slidable.of(context)?.actionPaneType;
    _actionPaneTypeValueNotifier?.addListener(_onActionPaneTypeChanged);
  }

  @override
  void dispose() {
    _actionPaneTypeValueNotifier?.removeListener(_onActionPaneTypeChanged);
    super.dispose();
  }

  void _onActionPaneTypeChanged() {
    debugPrint('Value is ${_actionPaneTypeValueNotifier?.value}');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
