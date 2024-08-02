import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

class Rectangle extends Shape {
  final Rect rect;

  Rectangle(
    this.rect, {
    super.paint,
    super.hitTestBehavior,
    super.gestureCallbacks,
  });

  @override
  bool isInside(Offset p) {
    if (paint.style == PaintingStyle.fill) {
      return rect.contains(p);
    } else {
      double extraWidth = paint.strokeWidth / 2;

      bool insideOuterRect = Rect.fromLTRB(
              rect.left - extraWidth,
              rect.top - extraWidth,
              rect.right + extraWidth,
              rect.bottom + extraWidth)
          .contains(p);

      bool outsideInnerRect = !Rect.fromLTRB(
              rect.left + extraWidth,
              rect.top + extraWidth,
              rect.right - extraWidth,
              rect.bottom - extraWidth)
          .contains(p);
      return insideOuterRect && outsideInnerRect;
    }
  }
}
