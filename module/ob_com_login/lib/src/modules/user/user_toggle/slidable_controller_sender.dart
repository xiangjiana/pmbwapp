import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableControllerSender extends StatefulWidget {
  const SlidableControllerSender({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  _SlidableControllerSenderState createState() =>
      _SlidableControllerSenderState();
}

class _SlidableControllerSenderState extends State<SlidableControllerSender> {
  SlidableController? controller;
  _SlidablePlayerState? playerState;

  @override
  void initState() {
    super.initState();
    controller = Slidable.of(context);
    playerState = SlidablePlayer.of(context);
    playerState!.controllers.add(controller);
  }

  @override
  void dispose() {
    playerState!.controllers.remove(controller);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}

class SlidablePlayer extends StatefulWidget {
  const SlidablePlayer({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  final Animation<double>? animation;
  final Widget child;

  @override
  _SlidablePlayerState createState() => _SlidablePlayerState();

  static _SlidablePlayerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_SlidablePlayerState>();
  }
}

class _SlidablePlayerState extends State<SlidablePlayer> {
  final Set<SlidableController?> controllers = <SlidableController?>{};

  @override
  void initState() {
    super.initState();
    widget.animation!.addListener(handleAnimationChanged);
  }

  @override
  void dispose() {
    widget.animation!.removeListener(handleAnimationChanged);
    super.dispose();
  }

  void handleAnimationChanged() {
    final value = widget.animation!.value;
    controllers.forEach((controller) {
      controller!.ratio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}