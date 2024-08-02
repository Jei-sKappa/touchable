import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:touchable/src/types/types.dart';

class ShapeUtil {
  static double distance(Offset p1, Offset p2) {
    return sqrt(pow(p2.dy - p1.dy, 2) + pow(p2.dx - p1.dx, 2));
  }
}

typedef gestureCallback = void Function();

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

  static Map<GestureType, Function> getGestureCallbackMap({
    required GestureTapDownCallback? onTapDown,
    required GestureTapUpCallback? onTapUp,
    // required GestureTapCallback? onTap,
    // required GestureTapCancelCallback? onTapCancel,
    // required GestureTapCallback? onSecondaryTap,
    required GestureTapDownCallback? onSecondaryTapDown,
    required GestureTapUpCallback? onSecondaryTapUp,
    // required GestureTapCancelCallback? onSecondaryTapCancel,
    required GestureTapDownCallback? onTertiaryTapDown,
    required GestureTapUpCallback? onTertiaryTapUp,
    // required GestureTapCancelCallback? onTertiaryTapCancel,
    required GestureTapDownCallback? onDoubleTapDown,
    // required GestureTapCallback? onDoubleTap,
    // required GestureTapCancelCallback? onDoubleTapCancel,
    required GestureLongPressDownCallback? onLongPressDown,
    // required GestureLongPressCancelCallback? onLongPressCancel,
    // required GestureLongPressCallback? onLongPress,
    required GestureLongPressStartCallback? onLongPressStart,
    required GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    // required GestureLongPressUpCallback? onLongPressUp,
    required GestureLongPressEndCallback? onLongPressEnd,
    required GestureLongPressDownCallback? onSecondaryLongPressDown,
    // required GestureLongPressCancelCallback? onSecondaryLongPressCancel,
    // required GestureLongPressCallback? onSecondaryLongPress,
    required GestureLongPressStartCallback? onSecondaryLongPressStart,
    required GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate,
    // required GestureLongPressUpCallback? onSecondaryLongPressUp,
    required GestureLongPressEndCallback? onSecondaryLongPressEnd,
    required GestureLongPressDownCallback? onTertiaryLongPressDown,
    // required GestureLongPressCancelCallback? onTertiaryLongPressCancel,
    // required GestureLongPressCallback? onTertiaryLongPress,
    required GestureLongPressStartCallback? onTertiaryLongPressStart,
    required GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate,
    // required GestureLongPressUpCallback? onTertiaryLongPressUp,
    required GestureLongPressEndCallback? onTertiaryLongPressEnd,
    required GestureDragDownCallback? onVerticalDragDown,
    required GestureDragStartCallback? onVerticalDragStart,
    required GestureDragUpdateCallback? onVerticalDragUpdate,
    required GestureDragEndCallback? onVerticalDragEnd,
    // required GestureDragCancelCallback? onVerticalDragCancel,
    required GestureDragDownCallback? onHorizontalDragDown,
    required GestureDragStartCallback? onHorizontalDragStart,
    required GestureDragUpdateCallback? onHorizontalDragUpdate,
    required GestureDragEndCallback? onHorizontalDragEnd,
    // required GestureDragCancelCallback? onHorizontalDragCancel,
    required GestureDragDownCallback? onPanDown,
    required GestureDragStartCallback? onPanStart,
    required GestureDragUpdateCallback? onPanUpdate,
    required GestureDragEndCallback? onPanEnd,
    // required GestureDragCancelCallback? onPanCancel,
    required GestureScaleStartCallback? onScaleStart,
    required GestureScaleUpdateCallback? onScaleUpdate,
    // required GestureScaleEndCallback? onScaleEnd, // It does not have a position
    required GestureForcePressStartCallback? onForcePressStart,
    required GestureForcePressPeakCallback? onForcePressPeak,
    required GestureForcePressUpdateCallback? onForcePressUpdate,
    required GestureForcePressEndCallback? onForcePressEnd,
  }) {
    var map = <GestureType, Function>{};

    if (onTapDown != null) {
      map.putIfAbsent(GestureType.onTapDown, () => onTapDown);
    }
    if (onTapUp != null) {
      map.putIfAbsent(GestureType.onTapUp, () => onTapUp);
    }
    // if (onTap != null) {
    //   map.putIfAbsent(GestureType.onTap, () => onTap);
    // }
    // if (onTapCancel != null) {
    //   map.putIfAbsent(GestureType.onTapCancel, () => onTapCancel);
    // }
    // if (onSecondaryTap != null) {
    //   map.putIfAbsent(GestureType.onSecondaryTap, () => onSecondaryTap);
    // }
    if (onSecondaryTapDown != null) {
      map.putIfAbsent(GestureType.onSecondaryTapDown, () => onSecondaryTapDown);
    }
    if (onSecondaryTapUp != null) {
      map.putIfAbsent(GestureType.onSecondaryTapUp, () => onSecondaryTapUp);
    }
    // if (onSecondaryTapCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onSecondaryTapCancel, () => onSecondaryTapCancel);
    // }
    if (onTertiaryTapDown != null) {
      map.putIfAbsent(GestureType.onTertiaryTapDown, () => onTertiaryTapDown);
    }
    if (onTertiaryTapUp != null) {
      map.putIfAbsent(GestureType.onTertiaryTapUp, () => onTertiaryTapUp);
    }
    // if (onTertiaryTapCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onTertiaryTapCancel, () => onTertiaryTapCancel);
    // }
    if (onDoubleTapDown != null) {
      map.putIfAbsent(GestureType.onDoubleTapDown, () => onDoubleTapDown);
    }
    // if (onDoubleTap != null) {
    //   map.putIfAbsent(GestureType.onDoubleTap, () => onDoubleTap);
    // }
    // if (onDoubleTapCancel != null) {
    //   map.putIfAbsent(GestureType.onDoubleTapCancel, () => onDoubleTapCancel);
    // }
    if (onLongPressDown != null) {
      map.putIfAbsent(GestureType.onLongPressDown, () => onLongPressDown);
    }
    // if (onLongPressCancel != null) {
    //   map.putIfAbsent(GestureType.onLongPressCancel, () => onLongPressCancel);
    // }
    // if (onLongPress != null) {
    //   map.putIfAbsent(GestureType.onLongPress, () => onLongPress);
    // }
    if (onLongPressStart != null) {
      map.putIfAbsent(GestureType.onLongPressStart, () => onLongPressStart);
    }
    if (onLongPressMoveUpdate != null) {
      map.putIfAbsent(
          GestureType.onLongPressMoveUpdate, () => onLongPressMoveUpdate);
    }
    // if (onLongPressUp != null) {
    //   map.putIfAbsent(GestureType.onLongPressUp, () => onLongPressUp);
    // }
    if (onLongPressEnd != null) {
      map.putIfAbsent(GestureType.onLongPressEnd, () => onLongPressEnd);
    }
    if (onSecondaryLongPressDown != null) {
      map.putIfAbsent(
          GestureType.onSecondaryLongPressDown, () => onSecondaryLongPressDown);
    }
    // if (onSecondaryLongPressCancel != null) {
    //   map.putIfAbsent(GestureType.onSecondaryLongPressCancel,
    //       () => onSecondaryLongPressCancel);
    // }
    // if (onSecondaryLongPress != null) {
    //   map.putIfAbsent(
    //       GestureType.onSecondaryLongPress, () => onSecondaryLongPress);
    // }
    if (onSecondaryLongPressStart != null) {
      map.putIfAbsent(GestureType.onSecondaryLongPressStart,
          () => onSecondaryLongPressStart);
    }
    if (onSecondaryLongPressMoveUpdate != null) {
      map.putIfAbsent(GestureType.onSecondaryLongPressMoveUpdate,
          () => onSecondaryLongPressMoveUpdate);
    }
    // if (onSecondaryLongPressUp != null) {
    //   map.putIfAbsent(
    //       GestureType.onSecondaryLongPressUp, () => onSecondaryLongPressUp);
    // }
    if (onSecondaryLongPressEnd != null) {
      map.putIfAbsent(
          GestureType.onSecondaryLongPressEnd, () => onSecondaryLongPressEnd);
    }
    if (onTertiaryLongPressDown != null) {
      map.putIfAbsent(
          GestureType.onTertiaryLongPressDown, () => onTertiaryLongPressDown);
    }
    // if (onTertiaryLongPressCancel != null) {
    //   map.putIfAbsent(GestureType.onTertiaryLongPressCancel,
    //       () => onTertiaryLongPressCancel);
    // }
    // if (onTertiaryLongPress != null) {
    //   map.putIfAbsent(
    //       GestureType.onTertiaryLongPress, () => onTertiaryLongPress);
    // }
    if (onTertiaryLongPressStart != null) {
      map.putIfAbsent(
          GestureType.onTertiaryLongPressStart, () => onTertiaryLongPressStart);
    }
    if (onTertiaryLongPressMoveUpdate != null) {
      map.putIfAbsent(GestureType.onTertiaryLongPressMoveUpdate,
          () => onTertiaryLongPressMoveUpdate);
    }
    // if (onTertiaryLongPressUp != null) {
    //   map.putIfAbsent(
    //       GestureType.onTertiaryLongPressUp, () => onTertiaryLongPressUp);
    // }
    if (onTertiaryLongPressEnd != null) {
      map.putIfAbsent(
          GestureType.onTertiaryLongPressEnd, () => onTertiaryLongPressEnd);
    }
    if (onVerticalDragDown != null) {
      map.putIfAbsent(GestureType.onVerticalDragDown, () => onVerticalDragDown);
    }
    if (onVerticalDragStart != null) {
      map.putIfAbsent(
          GestureType.onVerticalDragStart, () => onVerticalDragStart);
    }
    if (onVerticalDragUpdate != null) {
      map.putIfAbsent(
          GestureType.onVerticalDragUpdate, () => onVerticalDragUpdate);
    }
    if (onVerticalDragEnd != null) {
      map.putIfAbsent(GestureType.onVerticalDragEnd, () => onVerticalDragEnd);
    }
    // if (onVerticalDragCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onVerticalDragCancel, () => onVerticalDragCancel);
    // }
    if (onHorizontalDragDown != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragDown, () => onHorizontalDragDown);
    }
    if (onHorizontalDragStart != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragStart, () => onHorizontalDragStart);
    }
    if (onHorizontalDragUpdate != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragUpdate, () => onHorizontalDragUpdate);
    }
    if (onHorizontalDragEnd != null) {
      map.putIfAbsent(
          GestureType.onHorizontalDragEnd, () => onHorizontalDragEnd);
    }
    // if (onHorizontalDragCancel != null) {
    //   map.putIfAbsent(
    //       GestureType.onHorizontalDragCancel, () => onHorizontalDragCancel);
    // }
    if (onForcePressStart != null) {
      map.putIfAbsent(GestureType.onForcePressStart, () => onForcePressStart);
    }
    if (onForcePressPeak != null) {
      map.putIfAbsent(GestureType.onForcePressPeak, () => onForcePressPeak);
    }
    if (onForcePressUpdate != null) {
      map.putIfAbsent(GestureType.onForcePressUpdate, () => onForcePressUpdate);
    }
    if (onForcePressEnd != null) {
      map.putIfAbsent(GestureType.onForcePressEnd, () => onForcePressEnd);
    }
    if (onPanDown != null) {
      map.putIfAbsent(GestureType.onPanDown, () => onPanDown);
    }
    if (onPanStart != null) {
      map.putIfAbsent(GestureType.onPanStart, () => onPanStart);
    }
    if (onPanUpdate != null) {
      map.putIfAbsent(GestureType.onPanUpdate, () => onPanUpdate);
    }
    if (onPanEnd != null) {
      map.putIfAbsent(GestureType.onPanEnd, () => onPanEnd);
    }
    // if (onPanCancel != null) {
    //   map.putIfAbsent(GestureType.onPanCancel, () => onPanCancel);
    // }
    if (onScaleStart != null) {
      map.putIfAbsent(GestureType.onScaleStart, () => onScaleStart);
    }
    if (onScaleUpdate != null) {
      map.putIfAbsent(GestureType.onScaleUpdate, () => onScaleUpdate);
    }
    // if (onScaleEnd != null) {
    //   map.putIfAbsent(GestureType.onScaleEnd, () => onScaleEnd);
    // }

    return map;
  }
}
