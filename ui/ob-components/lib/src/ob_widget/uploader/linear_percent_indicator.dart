import 'package:flutter/material.dart';

/// 圆角进度条
class LinearPercentIndicator extends StatelessWidget {
  ///
  const LinearPercentIndicator(
      {required this.value,
      this.height = 3.0,
      this.colors,
      this.backgroundColor = Colors.transparent,
      this.strokeCapRound = false});

  ///画笔的宽度，其实是进度条的高度
  final double height;

  ///是否需要圆角
  final bool strokeCapRound;

  ///进度值
  final double value;

  ///进度条背景色
  final Color backgroundColor;

  ///渐变的颜色列表
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    List<Color>? _colors = colors;
    if (_colors == null) {
      const Color color = Color(0xFFFF5722);
      _colors = <Color>[color, color];
    }
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _LinearPercentIndicatorPainter(
        strokeWidth: height,
        strokeCapRound: strokeCapRound,
        backgroundColor: backgroundColor,
        value: value,
        colors: _colors,
      ),
    );
  }
}

class _LinearPercentIndicatorPainter extends CustomPainter {
  ///
  _LinearPercentIndicatorPainter({
    required this.colors,
    this.strokeWidth = 3.0,
    this.value = 0.0,
    this.backgroundColor = Colors.transparent,
    this.strokeCapRound = false,
    this.stops,
  });

  ///
  final double strokeWidth;

  ///
  final bool strokeCapRound;

  ///
  final double value;

  ///
  final Color backgroundColor;

  ///
  final List<Color> colors;

  ///
  final List<double>? stops;

  ///
  final Paint p = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    p.strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt;
    p.style = PaintingStyle.fill;
    p.isAntiAlias = true;
    p.strokeWidth = strokeWidth;

    ///留一定的偏移量
    final double offset = strokeWidth / 2;

    ///画笔起点坐标
    final Offset start = Offset(offset, offset);

    ///画笔终点坐标
    final Offset end = Offset(size.width, offset);

    if (backgroundColor != Colors.transparent) {
      p.color = backgroundColor;
      canvas.drawLine(start, end, p);
    }

    if (value > 0) {
      ///计算进度的长度
      final Offset valueEnd = Offset(value * size.width + offset, offset);
      final Rect rect = Rect.fromPoints(start, valueEnd);
      p.shader =
          LinearGradient(colors: colors, stops: stops).createShader(rect);
      canvas.drawLine(start, valueEnd, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
