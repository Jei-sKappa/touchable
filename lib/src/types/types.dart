import 'package:flutter/material.dart';
import 'package:touchable/src/shapes/clip.dart';

typedef CustomTouchPaintBuilder = CustomPaint Function(BuildContext context);

class Gesture {
  final dynamic gestureDetail;

  final GestureType gestureType;

  Gesture(this.gestureType, this.gestureDetail);
}

class ClipShapeItem {
  final ClipShape clipShape;
  final int position;

  ClipShapeItem(this.clipShape, this.position);
}

enum GestureType {
  onTapDown,
  onTapUp,
  // onTap,
  // onTapCancel,
  // onSecondaryTap,
  onSecondaryTapDown,
  onSecondaryTapUp,
  // onSecondaryTapCancel,
  onTertiaryTapDown,
  onTertiaryTapUp,
  // onTertiaryTapCancel,
  onDoubleTapDown,
  // onDoubleTap,
  // onDoubleTapCancel,
  onLongPressDown,
  // onLongPressCancel,
  // onLongPress,
  onLongPressStart,
  onLongPressMoveUpdate,
  // onLongPressUp,
  onLongPressEnd,
  onSecondaryLongPressDown,
  // onSecondaryLongPressCancel,
  // onSecondaryLongPress,
  onSecondaryLongPressStart,
  onSecondaryLongPressMoveUpdate,
  // onSecondaryLongPressUp,
  onSecondaryLongPressEnd,
  onTertiaryLongPressDown,
  // onTertiaryLongPressCancel,
  // onTertiaryLongPress,
  onTertiaryLongPressStart,
  onTertiaryLongPressMoveUpdate,
  // onTertiaryLongPressUp,
  onTertiaryLongPressEnd,
  onVerticalDragDown,
  onVerticalDragStart,
  onVerticalDragUpdate,
  onVerticalDragEnd,
  // onVerticalDragCancel,
  onHorizontalDragDown,
  onHorizontalDragStart,
  onHorizontalDragUpdate,
  onHorizontalDragEnd,
  // onHorizontalDragCancel,
  onForcePressStart,
  onForcePressPeak,
  onForcePressUpdate,
  onForcePressEnd,
  onPanDown,
  onPanStart,
  onPanUpdate,
  onPanEnd,
  // onPanCancel,
  onScaleStart,
  onScaleUpdate,
  // onScaleEnd, // It does not have a position
}
