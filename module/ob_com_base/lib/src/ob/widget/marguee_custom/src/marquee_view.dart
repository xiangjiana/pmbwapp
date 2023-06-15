import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../../../../../ob_com_base.dart';

typedef OnIndexChanged = void Function(int index);

class MarqueeView extends StatefulWidget {
  final Widget child;
  final OnIndexChanged? onIndexChanged;

  MarqueeView({
    Key? key,
    required this.child,
    this.onIndexChanged,
  }) : super(key: key);

  @override
  _MarqueeViewState createState() => _MarqueeViewState();
}

class _MarqueeViewState extends State<MarqueeView> {
  late ScrollController _controller;
  late Timer _timer;
  double _offset = 0.0;
  final Duration duration = const Duration(milliseconds: 200);
  late StreamSubscription messageStartEvent;

  @override
  void initState() {
    super.initState();
    messageStartEvent =   eventBus.on<MessageStartEvent>().listen((event) {
      _offset = 0.0;
      _controller.animateTo(
        _offset,
        duration: Duration(milliseconds: 10),
        curve: Curves.linear,
      );
      _timer.cancel();
      _timer = Timer.periodic(duration, (timer) {
        double newOffset = _controller.offset + 5;
        if (newOffset != _offset) {
          _offset = newOffset;
          _controller.animateTo(
            _offset,
            duration: duration,
            curve: Curves.linear,
          );
        }
      });
    });

    _controller = ScrollController(initialScrollOffset: _offset);
    _timer = Timer.periodic(duration, (timer) {
      double newOffset = _controller.offset + 5;
      if (newOffset != _offset) {
        _offset = newOffset;
        _controller.animateTo(
          _offset,
          duration: duration,
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    messageStartEvent.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _controller,
      itemBuilder: (context, index) {
        if (widget.onIndexChanged != null) {
          widget.onIndexChanged!(index);
        }
        return widget.child;
      },
    );
  }
}
