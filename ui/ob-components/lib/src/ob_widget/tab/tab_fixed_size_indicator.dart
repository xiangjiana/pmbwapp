import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Used with [TabBar.indicator] to draw a fixed size below the
/// selected tab.
///
/// The [TabBar.indicatorSize] property will be ignored

class TabFixedSizedIndicator extends Decoration {
  ///
  const TabFixedSizedIndicator(this.size, this.color,
      {this.radius = const Radius.circular(3)});

  ///
  final Size size;

  ///
  final Radius radius;

  ///
  final Color color;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SizePainter(size, color, radius);
  }
}

class _SizePainter extends BoxPainter {
  _SizePainter(this.size, this.color, this.radius);

  final Size size;
  final Color color;
  final Radius radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final Rect indicatorRect = Rect.fromCenter(
        center: rect.bottomCenter, width: size.width, height: size.height);
    canvas.drawRRect(
        RRect.fromRectAndRadius(indicatorRect, radius),
        Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.square);
  }
}
