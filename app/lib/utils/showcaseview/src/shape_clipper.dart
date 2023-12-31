/*
 * Copyright (c) 2021 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RRectClipper extends CustomClipper<ui.Path> {
  final bool isCircle;
  final BorderRadius? radius;
  final EdgeInsets overlayPadding;
  final Rect area;

  RRectClipper({
    this.isCircle = false,
    this.radius,
    this.overlayPadding = EdgeInsets.zero,
    this.area = Rect.zero,
  });

  @override
  ui.Path getClip(ui.Size size) {
    final customRadius =
        isCircle ? Radius.circular(area.height) : const Radius.circular(3.0);

    final rect = Rect.fromLTRB(
      area.left - overlayPadding.left,
      area.top - overlayPadding.top,
      area.right + overlayPadding.right,
      area.bottom + overlayPadding.bottom,
    );
    Path path = Path();
    path.fillType = ui.PathFillType.evenOdd;
    path.addRect(Offset.zero & size);
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.left, rect.bottom);
    path.lineTo(rect.right, rect.bottom);
    path.lineTo(rect.right, rect.top + rect.height / 6);
    path.lineTo(rect.left, rect.top);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper is RRectClipper &&
      (isCircle != oldClipper.isCircle ||
          radius != oldClipper.radius ||
          overlayPadding != oldClipper.overlayPadding ||
          area != oldClipper.area);
}
