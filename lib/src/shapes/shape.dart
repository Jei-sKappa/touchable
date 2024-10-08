import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/constant.dart';
import 'package:touchable/touchable.dart';

abstract class Shape {
  final Paint paint;
  final Map<GestureType, Function> gestureCallbackMap;
  final HitTestBehavior hitTestBehavior;

  Set<GestureType> get registeredGestures => gestureCallbackMap.keys.toSet();

  Shape({
    required Paint? paint,
    required GestureCallbacks? gestureCallbacks,
    required HitTestBehavior? hitTestBehavior,
  })  : paint = paint ??
            (Paint()
              ..strokeWidth = ShapeConstant.floatPrecision
              ..style = PaintingStyle.fill),
        gestureCallbackMap = gestureCallbacks?.getGestureCallbackMap() ?? {},
        hitTestBehavior = hitTestBehavior ?? HitTestBehavior.opaque;

  bool isInside(Offset p);

  Function getCallbackFromGesture(Gesture gesture) {
    if (gestureCallbackMap.containsKey(gesture.gestureType)) {
      if (gesture.gestureDetail == null) {
        return () => gestureCallbackMap[gesture.gestureType]?.call();
      }
      return () =>
          gestureCallbackMap[gesture.gestureType]?.call(gesture.gestureDetail);
    } else {
      return () {};
    }
  }
}
