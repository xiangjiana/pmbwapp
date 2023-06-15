import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';

///从ob_componnets复制过来的，修改支持根据不同客户端展示不同颜色
///
const double _kDefaultRadioHeight = 16.0;

///
final Color _kRadioColor = Colors.white.withOpacity(0.6);


///
class ObaseRadio extends StatelessWidget {
  ///
  const ObaseRadio({
    this.value = false,
    this.onChange,
    Key? key,
  }) : super(key: key);

  ///
  final bool value;

  ///
  final ValueChanged<bool>? onChange;


  @override
  Widget build(BuildContext context) {
    late bool radioSelected = value;
    const double radioSize = _kDefaultRadioHeight;

    late final Color radioColor = _kRadioColor;

    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              radioSelected = !radioSelected;
              onChange?.call(radioSelected);
            },
            child: Container(
              padding: const EdgeInsets.all(2),
              width: radioSize,
              height: radioSize,
              child: CustomPaint(
                painter: _RadioDotPainter(
                    radioColor: radioColor,
                    radioColorOn: ColorName.colorMain,
                    radioState: radioSelected),
              ),
            ),
          )
        ]);
  }
}

///
class _RadioDotPainter extends CustomPainter {
  ///
  _RadioDotPainter({
    required this.radioColor,
    required this.radioColorOn,
    required this.radioState,
  });

  ///
  final Color radioColor;

  ///
  final Color radioColorOn;

  ///
  final bool radioState;

  ///
  void drawDotNor(Canvas canvas, Size size) {
    final double sw = size.width;
    final double sh = size.height;
    final double radius = sw / 2.0;
    final Offset center = Offset(sw / 2.0, sh / 2.0);

    //
    final Rect rect = Rect.fromCenter(
      center: center,
      width: radius * 2,
      height: radius * 2,
    );

    // 设置绘制属性
    final Paint paint = Paint()
      ..strokeWidth = 1.5
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = radioColor;

    canvas.drawArc(rect, 0.0, 360, false, paint);
  }

  ///
  void drawDotOn(Canvas canvas, Size size) {
    final double sw = size.width;
    final double sh = size.height;
    final double radius = sw / 2.0;
    final Offset center = Offset(sw / 2.0, sh / 2.0);

    //
    final Rect rect = Rect.fromCenter(
      center: center,
      width: radius * 2,
      height: radius * 2,
    );
    final Rect rectDot = Rect.fromCenter(
      center: center,
      width: radius,
      height: radius,
    );

    // 设置绘制属性
    final Paint paint = Paint()
      ..strokeWidth = 1.5
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = radioColorOn;
    canvas.drawArc(rect, 0.0, 360, false, paint);

    // 设置绘制属性
    final Paint paintDot = Paint()
      ..strokeWidth = 0.0
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = radioColorOn;
    canvas.drawArc(rectDot, 0.0, 360, false, paintDot);
  }

  @override
  void paint(Canvas canvas, Size size) {
    radioState ? drawDotOn(canvas, size) : drawDotNor(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
