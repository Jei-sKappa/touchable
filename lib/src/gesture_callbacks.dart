import 'package:flutter/gestures.dart';
import 'package:touchable/src/types/types.dart';

class GestureCallbacks {
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  // final GestureTapCallback? onTap,
  // final GestureTapCancelCallback? onTapCancel,
  // final GestureTapCallback? onSecondaryTap,
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  // final GestureTapCancelCallback? onSecondaryTapCancel,
  final GestureTapDownCallback? onTertiaryTapDown;
  final GestureTapUpCallback? onTertiaryTapUp;
  // final GestureTapCancelCallback? onTertiaryTapCancel,
  final GestureTapDownCallback? onDoubleTapDown;
  // final GestureTapCallback? onDoubleTap,
  // final GestureTapCancelCallback? onDoubleTapCancel,
  final GestureLongPressDownCallback? onLongPressDown;
  // final GestureLongPressCancelCallback? onLongPressCancel,
  // final GestureLongPressCallback? onLongPress,
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;
  // final GestureLongPressUpCallback? onLongPressUp,
  final GestureLongPressEndCallback? onLongPressEnd;
  final GestureLongPressDownCallback? onSecondaryLongPressDown;
  // final GestureLongPressCancelCallback? onSecondaryLongPressCancel,
  // final GestureLongPressCallback? onSecondaryLongPress,
  final GestureLongPressStartCallback? onSecondaryLongPressStart;
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;
  // final GestureLongPressUpCallback? onSecondaryLongPressUp,
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;
  final GestureLongPressDownCallback? onTertiaryLongPressDown;
  // final GestureLongPressCancelCallback? onTertiaryLongPressCancel,
  // final GestureLongPressCallback? onTertiaryLongPress,
  final GestureLongPressStartCallback? onTertiaryLongPressStart;
  final GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate;
  // final GestureLongPressUpCallback? onTertiaryLongPressUp,
  final GestureLongPressEndCallback? onTertiaryLongPressEnd;
  final GestureDragDownCallback? onVerticalDragDown;
  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  // final GestureDragCancelCallback? onVerticalDragCancel,
  final GestureDragDownCallback? onHorizontalDragDown;
  final GestureDragStartCallback? onHorizontalDragStart;
  final GestureDragUpdateCallback? onHorizontalDragUpdate;
  final GestureDragEndCallback? onHorizontalDragEnd;
  // final GestureDragCancelCallback? onHorizontalDragCancel,
  final GestureDragDownCallback? onPanDown;
  final GestureDragStartCallback? onPanStart;
  final GestureDragUpdateCallback? onPanUpdate;
  final GestureDragEndCallback? onPanEnd;
  // final GestureDragCancelCallback? onPanCancel,
  final GestureScaleStartCallback? onScaleStart;
  final GestureScaleUpdateCallback? onScaleUpdate;
  // final GestureScaleEndCallback? onScaleEnd, // It does not have a position
  final GestureForcePressStartCallback? onForcePressStart;
  final GestureForcePressPeakCallback? onForcePressPeak;
  final GestureForcePressUpdateCallback? onForcePressUpdate;
  final GestureForcePressEndCallback? onForcePressEnd;

  const GestureCallbacks({
    this.onTapDown,
    this.onTapUp,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onDoubleTapDown,
    this.onLongPressDown,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressEnd,
    this.onSecondaryLongPressDown,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressEnd,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
  });

  Map<GestureType, Function> getGestureCallbackMap() {
    var map = <GestureType, Function>{};

    if (onTapDown != null) {
      map.putIfAbsent(GestureType.onTapDown, () => onTapDown!);
    }
    if (onTapUp != null) {
      map.putIfAbsent(GestureType.onTapUp, () => onTapUp!);
    }
    // if (onTap != null) {
    //   map.putIfAbsent(GestureType.onTap, () => onTap!);
    // }
    // if (onTapCancel != null) {
    //   map.putIfAbsent(GestureType.onTapCancel, () => onTapCancel!);
    // }
    // if (onSecondaryTap != null) {
    //   map.putIfAbsent(GestureType.onSecondaryTap, () => onSecondaryTap!);
    // }
    if (onSecondaryTapDown != null) {
      map.putIfAbsent(
          GestureType.onSecondaryTapDown, () => onSecondaryTapDown!);
    }
    if (onSecondaryTapUp != null) {
      map.putIfAbsent(GestureType.onSecondaryTapUp, () => onSecondaryTapUp!);
    }
    // if (onSecondaryTapCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onSecondaryTapCancel, () => onSecondaryTapCancel!);
    // }
    if (onTertiaryTapDown != null) {
      map.putIfAbsent(GestureType.onTertiaryTapDown, () => onTertiaryTapDown!);
    }
    if (onTertiaryTapUp != null) {
      map.putIfAbsent(GestureType.onTertiaryTapUp, () => onTertiaryTapUp!);
    }
    // if (onTertiaryTapCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onTertiaryTapCancel, () => onTertiaryTapCancel!);
    // }
    if (onDoubleTapDown != null) {
      map.putIfAbsent(GestureType.onDoubleTapDown, () => onDoubleTapDown!);
    }
    // if (onDoubleTap != null) {
    //   map.putIfAbsent(GestureType.onDoubleTap, () => onDoubleTap!);
    // }
    // if (onDoubleTapCancel != null) {
    //   map.putIfAbsent(GestureType.onDoubleTapCancel, () => onDoubleTapCancel!);
    // }
    if (onLongPressDown != null) {
      map.putIfAbsent(GestureType.onLongPressDown, () => onLongPressDown!);
    }
    // if (onLongPressCancel != null) {
    //   map.putIfAbsent(GestureType.onLongPressCancel, () => onLongPressCancel!);
    // }
    // if (onLongPress != null) {
    //   map.putIfAbsent(GestureType.onLongPress, () => onLongPress!);
    // }
    if (onLongPressStart != null) {
      map.putIfAbsent(GestureType.onLongPressStart, () => onLongPressStart!);
    }
    if (onLongPressMoveUpdate != null) {
      map.putIfAbsent(
          GestureType.onLongPressMoveUpdate, () => onLongPressMoveUpdate!);
    }
    // if (onLongPressUp != null) {
    //   map.putIfAbsent(GestureType.onLongPressUp, () => onLongPressUp!);
    // }
    if (onLongPressEnd != null) {
      map.putIfAbsent(GestureType.onLongPressEnd, () => onLongPressEnd!);
    }
    if (onSecondaryLongPressDown != null) {
      map.putIfAbsent(GestureType.onSecondaryLongPressDown,
          () => onSecondaryLongPressDown!);
    }
    // if (onSecondaryLongPressCancel != null) {
    //   map.putIfAbsent(GestureType.onSecondaryLongPressCancel,
    //       () => onSecondaryLongPressCancel!);
    // }
    // if (onSecondaryLongPress != null) {
    //   map.putIfAbsent(
    //       GestureType.onSecondaryLongPress, () => onSecondaryLongPress!);
    // }
    if (onSecondaryLongPressStart != null) {
      map.putIfAbsent(GestureType.onSecondaryLongPressStart,
          () => onSecondaryLongPressStart!);
    }
    if (onSecondaryLongPressMoveUpdate != null) {
      map.putIfAbsent(GestureType.onSecondaryLongPressMoveUpdate,
          () => onSecondaryLongPressMoveUpdate!);
    }
    // if (onSecondaryLongPressUp != null) {
    //   map.putIfAbsent(
    //       GestureType.onSecondaryLongPressUp, () => onSecondaryLongPressUp!);
    // }
    if (onSecondaryLongPressEnd != null) {
      map.putIfAbsent(
          GestureType.onSecondaryLongPressEnd, () => onSecondaryLongPressEnd!);
    }
    if (onTertiaryLongPressDown != null) {
      map.putIfAbsent(
          GestureType.onTertiaryLongPressDown, () => onTertiaryLongPressDown!);
    }
    // if (onTertiaryLongPressCancel != null) {
    //   map.putIfAbsent(GestureType.onTertiaryLongPressCancel,
    //       () => onTertiaryLongPressCancel!);
    // }
    // if (onTertiaryLongPress != null) {
    //   map.putIfAbsent(
    //       GestureType.onTertiaryLongPress, () => onTertiaryLongPress!);
    // }
    if (onTertiaryLongPressStart != null) {
      map.putIfAbsent(GestureType.onTertiaryLongPressStart,
          () => onTertiaryLongPressStart!);
    }
    if (onTertiaryLongPressMoveUpdate != null) {
      map.putIfAbsent(GestureType.onTertiaryLongPressMoveUpdate,
          () => onTertiaryLongPressMoveUpdate!);
    }
    // if (onTertiaryLongPressUp != null) {
    //   map.putIfAbsent(
    //       GestureType.onTertiaryLongPressUp, () => onTertiaryLongPressUp!);
    // }
    if (onTertiaryLongPressEnd != null) {
      map.putIfAbsent(
          GestureType.onTertiaryLongPressEnd, () => onTertiaryLongPressEnd!);
    }
    if (onVerticalDragDown != null) {
      map.putIfAbsent(
          GestureType.onVerticalDragDown, () => onVerticalDragDown!);
    }
    if (onVerticalDragStart != null) {
      map.putIfAbsent(
          GestureType.onVerticalDragStart, () => onVerticalDragStart!);
    }
    if (onVerticalDragUpdate != null) {
      map.putIfAbsent(
          GestureType.onVerticalDragUpdate, () => onVerticalDragUpdate!);
    }
    if (onVerticalDragEnd != null) {
      map.putIfAbsent(GestureType.onVerticalDragEnd, () => onVerticalDragEnd!);
    }
    // if (onVerticalDragCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onVerticalDragCancel, () => onVerticalDragCancel!);
    // }
    if (onHorizontalDragDown != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragDown, () => onHorizontalDragDown!);
    }
    if (onHorizontalDragStart != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragStart, () => onHorizontalDragStart!);
    }
    if (onHorizontalDragUpdate != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragUpdate, () => onHorizontalDragUpdate!);
    }
    if (onHorizontalDragEnd != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragEnd, () => onHorizontalDragEnd!);
    }
    // if (onHorizontalDragCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onHorizontalDragCancel, () => onHorizontalDragCancel!);
    // }
    if (onForcePressStart != null) {
      map.putIfAbsent(GestureType.onForcePressStart, () => onForcePressStart!);
    }
    if (onForcePressPeak != null) {
      map.putIfAbsent(GestureType.onForcePressPeak, () => onForcePressPeak!);
    }
    if (onForcePressUpdate != null) {
      map.putIfAbsent(
          GestureType.onForcePressUpdate, () => onForcePressUpdate!);
    }
    if (onForcePressEnd != null) {
      map.putIfAbsent(GestureType.onForcePressEnd, () => onForcePressEnd!);
    }
    if (onPanDown != null) {
      map.putIfAbsent(GestureType.onPanDown, () => onPanDown!);
    }
    if (onPanStart != null) {
      map.putIfAbsent(GestureType.onPanStart, () => onPanStart!);
    }
    if (onPanUpdate != null) {
      map.putIfAbsent(GestureType.onPanUpdate, () => onPanUpdate!);
    }
    if (onPanEnd != null) {
      map.putIfAbsent(GestureType.onPanEnd, () => onPanEnd!);
    }
    // if (onPanCancel != null) {
    //   map.putIfAbsent(GestureType.onPanCancel, () => onPanCancel!);
    // }
    if (onScaleStart != null) {
      map.putIfAbsent(GestureType.onScaleStart, () => onScaleStart!);
    }
    if (onScaleUpdate != null) {
      map.putIfAbsent(GestureType.onScaleUpdate, () => onScaleUpdate!);
    }
    // if (onScaleEnd != null) {
    //   map.putIfAbsent(GestureType.onScaleEnd, () => onScaleEnd!);
    // }

    return map;
  }
}
