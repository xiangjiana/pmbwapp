part of ob_crop_avatar;

/// 放置在角落的默认点小部件以控制裁剪区域。
/// 这个小部件会自动适应合适的尺寸。
class DotBorderControl extends ShapeBorder {
  DotBorderControl({this.offset = const Offset(0.1, 0.1), this.size = 20});

  final Offset offset;
  final double size;

  @override
  EdgeInsetsGeometry get dimensions {
    return new EdgeInsets.all(size);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(5)));
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)));

    var w = rect.width;
    var h = rect.height;
    var offsetXY = Offset(offset.dx * w, offset.dy * h);
    var d = size;
    _getHold(path, 1, d, offsetXY);
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  _getHold(Path path, int count, double d, Offset offset) {
    var left = offset.dx;
    var top = offset.dy;
    var right = left + d;
    var bottom = top + d;
    path.addOval(Rect.fromLTRB(left, top, right, bottom));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return DotBorderControl();
  }
}
