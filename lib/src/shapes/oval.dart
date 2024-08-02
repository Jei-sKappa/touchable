import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/src/shapes/shape.dart';

class Oval extends Shape {
  final Rect rect;

  double a, b;

//  x^2/a^2 + y^2/b^2 = 1
  Oval(
    this.rect, {
    super.paint,
    super.hitTestBehavior,
    super.gestureCallbacks,
  })  : a = rect.right - rect.center.dx,
        b = rect.center.dy - rect.top;

  @override
  bool isInside(Offset p) {
    if (a == 0 || b == 0) return false;

    var extraWidth = paint.style == PaintingStyle.stroke
        ? paint.strokeWidth / 2
        : ShapeConstant.floatPrecision;

    bool insideOuterOval = _isInsideOval(p, extraWidth);
    if (paint.style == PaintingStyle.stroke) {
      bool outsideInnerOval = !_isInsideOval(p, -extraWidth);
      return insideOuterOval && outsideInnerOval;
    } else {
      return insideOuterOval;
    }
  }

  bool _isInsideOval(Offset p, double extraWidth) {
    return pow(p.dx - rect.center.dx, 2) / pow(a + extraWidth, 2) +
            pow(p.dy - rect.center.dy, 2) / pow(b + extraWidth, 2) <=
        1;
  }

  bool isOnTheOval(Offset p) {
    var extraWidth = paint.style == PaintingStyle.stroke
        ? paint.strokeWidth / 2
        : ShapeConstant.floatPrecision;
    bool insideOuterOval = _isInsideOval(p, extraWidth);
    bool outsideInnerOval = !_isInsideOval(p, -extraWidth);
    return insideOuterOval && outsideInnerOval;
  }
}
