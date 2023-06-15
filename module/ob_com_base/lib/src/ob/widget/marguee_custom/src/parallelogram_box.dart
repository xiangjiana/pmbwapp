
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParallelogramBox extends StatelessWidget {

  final Color borderColor;
  final Color backgroundColor;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;

  ParallelogramBox({
    Key? key,
    required this.text,
    this.borderColor = const Color(0xFFE1A100),
    this.backgroundColor = Colors.transparent,
    this.fontColor = const Color(0xFFE1A100),
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = calculateTextWidth(context, value: text, fontSize: fontSize, fontWeight: fontWeight) + 10;
    return Container(
      color: backgroundColor,
      child: SizedBox(
        width: width,
        height: 20,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(width, 20),
              painter: _ParallelogramPainter(lineColor: borderColor),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(text, style: TextStyle(fontSize: fontSize, color: fontColor)),
            )
          ],
        ),
      ),
    );
  }

  double calculateTextWidth(BuildContext context, {required String value, double fontSize = 12, FontWeight fontWeight = FontWeight.normal}) {
    TextPainter painter = TextPainter(
      locale: Localizations.localeOf(context),
      maxLines: 1,
      textDirection: TextDirection.ltr,
      text: TextSpan(text: value, style: TextStyle(fontWeight: fontWeight, fontSize: fontSize))
    );
    painter.layout(minWidth: 30);
    return painter.width;
  }

}

class _ParallelogramPainter extends CustomPainter {

  final Color lineColor;

  _ParallelogramPainter({this.lineColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {

    Paint _paint = Paint()
      ..color = lineColor..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    /// 构建一个圆角矩形
    RRect rRect = RRect.fromLTRBR(5, 0, size.width, size.height, Radius.circular(3.0));

    canvas.skew(-0.2, 0);
    canvas.drawRRect(rRect, _paint);


  }



  double startDegree(double sweepDegree) {
    return _toRadius((sweepDegree - 180) / 2);
  }

  double _toRadius(num degree) => degree * pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }


}


