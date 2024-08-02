import 'dart:math';

import 'package:flutter/gestures.dart';

class ShapeUtil {
  static double distance(Offset p1, Offset p2) {
    return sqrt(pow(p2.dy - p1.dy, 2) + pow(p2.dx - p1.dx, 2));
  }
}

class TouchCanvasUtil {
  static Offset getPointFromGestureDetail(dynamic gestureDetail) {
    switch (gestureDetail.runtimeType) {
      case TapDownDetails:
        return (gestureDetail as TapDownDetails).localPosition;
      case TapUpDetails:
        return (gestureDetail as TapUpDetails).localPosition;
      case LongPressDownDetails:
        return (gestureDetail as LongPressDownDetails).localPosition;
      case LongPressStartDetails:
        return (gestureDetail as LongPressStartDetails).localPosition;
      case LongPressMoveUpdateDetails:
        return (gestureDetail as LongPressMoveUpdateDetails).localPosition;
      case LongPressEndDetails:
        return (gestureDetail as LongPressEndDetails).localPosition;
      case DragDownDetails:
        return (gestureDetail as DragDownDetails).localPosition;
      case DragStartDetails:
        return (gestureDetail as DragStartDetails).localPosition;
      case DragUpdateDetails:
        return (gestureDetail as DragUpdateDetails).localPosition;
      case DragEndDetails:
        return (gestureDetail as DragEndDetails).localPosition;
      case ScaleStartDetails:
        return (gestureDetail as ScaleStartDetails).localFocalPoint;
      case ScaleUpdateDetails:
        return (gestureDetail as ScaleUpdateDetails).localFocalPoint;
      // case ScaleEndDetails: // It does not have a position
      case ForcePressDetails:
        return (gestureDetail as ForcePressDetails).localPosition;
      default:
        throw Exception(
            'gestureDetail.runTimeType = ${gestureDetail.runtimeType} is not recognized ! ');
    }
  }
}
