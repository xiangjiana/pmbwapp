part of ob_gesture_password;

class LinePainter extends CustomPainter {
  final List<Point>? points;
  final Color? lineColor;
  final double? lineWidth;

  LinePainter({
    this.points,
    this.lineColor,
    this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points != null && points!.length > 1) {
      Paint paint = Paint();
      paint.strokeWidth = lineWidth!;
      paint.color = lineColor!;
      paint.isAntiAlias = true;
      paint.style = PaintingStyle.fill;
      paint.strokeCap = StrokeCap.round;

      for (int i = 0; i < points!.length - 1; i++) {
        canvas.drawLine(
          Offset(points![i].x as double, points![i].y as double),
          Offset(points![i + 1].x as double, points![i + 1].y as double),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => true;
}
