import 'dart:async';

import 'package:flutter/material.dart';
import 'package:touchable/src/touch_detection_controller.dart';
import 'package:touchable/src/types/types.dart';

///[CanvasTouchDetector] widget detects the gestures on your [CustomPaint] widget.
///
/// Wrap your [CustomPaint] widget with [CanvasTouchDetector]
/// The [builder] function passes the [BuildContext] and expects a [CustomPaint] object as its return value.
/// The [gesturesToOverride] list must contains list of gestures you want to listen to (by default contains all types of gestures).
class CanvasTouchDetector extends StatefulWidget {
  final CustomTouchPaintBuilder builder;
  final List<GestureType> gesturesToOverride;

  const CanvasTouchDetector({
    Key? key,
    required this.builder,
    required this.gesturesToOverride,
  }) : super(key: key);

  @override
  _CanvasTouchDetectorState createState() => _CanvasTouchDetectorState();
}

class _CanvasTouchDetectorState extends State<CanvasTouchDetector> {
  final StreamController<Gesture> touchController =
      StreamController.broadcast();
  StreamSubscription? streamSubscription;

  Future<void> addStreamListener(Function(Gesture) callBack) async {
    await streamSubscription?.cancel();
    streamSubscription = touchController.stream.listen(callBack);
  }

  @override
  Widget build(BuildContext context) {
    return TouchDetectionController(
      touchController,
      addStreamListener,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Builder(
          builder: (context) {
            return widget.builder(context);
          },
        ),
        onTapDown: !widget.gesturesToOverride.contains(GestureType.onTapDown)
            ? null
            : (tapDetail) {
                touchController.add(Gesture(GestureType.onTapDown, tapDetail));
              },
        onTapUp: !widget.gesturesToOverride.contains(GestureType.onTapUp)
            ? null
            : (tapDetail) {
                touchController.add(Gesture(GestureType.onTapUp, tapDetail));
              },
        ////. onTap: !widget.gesturesToOverride.contains(GestureType.onTap)
        /////     ? null
        ////.     : () {
        ////.         touchController.add(Gesture(GestureType.onTap, null));
        ////.       },
        ////. onTapCancel:
        ////.     !widget.gesturesToOverride.contains(GestureType.onTapCancel)
        ////.         ? null
        ////.         : () {
        ////.             touchController.add(Gesture(GestureType.onTapCancel, null));
        ////.           },
        ///// onSecondaryTap: !widget.gesturesToOverride
        /////         .contains(GestureType.onSecondaryTap)
        /////     ? null
        /////     : () {
        /////         touchController.add(Gesture(GestureType.onSecondaryTap, null));
        /////       },
        onSecondaryTapDown: !widget.gesturesToOverride
                .contains(GestureType.onSecondaryTapDown)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onSecondaryTapDown, tapDetail));
              },
        onSecondaryTapUp:
            !widget.gesturesToOverride.contains(GestureType.onSecondaryTapUp)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onSecondaryTapUp, tapDetail));
                  },
        ///// onSecondaryTapCancel: !widget.gesturesToOverride
        /////         .contains(GestureType.onSecondaryTapCancel)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onSecondaryTapCancel, null));
        /////       },
        onTertiaryTapDown:
            !widget.gesturesToOverride.contains(GestureType.onTertiaryTapDown)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onTertiaryTapDown, tapDetail));
                  },
        onTertiaryTapUp:
            !widget.gesturesToOverride.contains(GestureType.onTertiaryTapUp)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onTertiaryTapUp, tapDetail));
                  },
        ///// onTertiaryTapCancel:
        /////     !widget.gesturesToOverride.contains(GestureType.onTertiaryTapCancel)
        /////         ? null
        /////         : () {
        /////             touchController
        /////                 .add(Gesture(GestureType.onTertiaryTapCancel, null));
        /////           },
        onDoubleTapDown:
            !widget.gesturesToOverride.contains(GestureType.onDoubleTapDown)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onDoubleTapDown, tapDetail));
                  },
        ///// onDoubleTap:
        /////     !widget.gesturesToOverride.contains(GestureType.onDoubleTap)
        /////         ? null
        /////         : () {
        /////             touchController.add(Gesture(GestureType.onDoubleTap, null));
        /////           },
        ///// onDoubleTapCancel:
        /////     !widget.gesturesToOverride.contains(GestureType.onDoubleTapCancel)
        /////         ? null
        /////         : () {
        /////             touchController
        /////                 .add(Gesture(GestureType.onDoubleTapCancel, null));
        /////           },
        onLongPressDown:
            !widget.gesturesToOverride.contains(GestureType.onLongPressDown)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onLongPressDown, tapDetail));
                  },
        ///// onLongPressCancel:
        /////     !widget.gesturesToOverride.contains(GestureType.onLongPressCancel)
        /////         ? null
        /////         : () {
        /////             touchController
        /////                 .add(Gesture(GestureType.onLongPressCancel, null));
        /////           },
        ///// onLongPress:
        /////     !widget.gesturesToOverride.contains(GestureType.onLongPress)
        /////         ? null
        /////         : () {
        /////             touchController.add(Gesture(GestureType.onLongPress, null));
        /////           },
        onLongPressStart:
            !widget.gesturesToOverride.contains(GestureType.onLongPressStart)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onLongPressStart, tapDetail));
                  },
        onLongPressMoveUpdate: !widget.gesturesToOverride
                .contains(GestureType.onLongPressMoveUpdate)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onLongPressMoveUpdate, tapDetail));
              },
        ///// onLongPressUp: !widget.gesturesToOverride
        /////         .contains(GestureType.onLongPressUp)
        /////     ? null
        /////     : () {
        /////         touchController.add(Gesture(GestureType.onLongPressUp, null));
        /////       },
        onLongPressEnd:
            !widget.gesturesToOverride.contains(GestureType.onLongPressEnd)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onLongPressEnd, tapDetail));
                  },
        onSecondaryLongPressDown: !widget.gesturesToOverride
                .contains(GestureType.onSecondaryLongPressDown)
            ? null
            : (tapDetail) {
                touchController.add(
                    Gesture(GestureType.onSecondaryLongPressDown, tapDetail));
              },
        ///// onSecondaryLongPressCancel: !widget.gesturesToOverride
        /////         .contains(GestureType.onSecondaryLongPressCancel)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onSecondaryLongPressCancel, null));
        /////       },
        ///// onSecondaryLongPress: !widget.gesturesToOverride
        /////         .contains(GestureType.onSecondaryLongPress)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onSecondaryLongPress, null));
        /////       },
        onSecondaryLongPressStart: !widget.gesturesToOverride
                .contains(GestureType.onSecondaryLongPressStart)
            ? null
            : (tapDetail) {
                touchController.add(
                    Gesture(GestureType.onSecondaryLongPressStart, tapDetail));
              },
        onSecondaryLongPressMoveUpdate: !widget.gesturesToOverride
                .contains(GestureType.onSecondaryLongPressMoveUpdate)
            ? null
            : (tapDetail) {
                touchController.add(Gesture(
                    GestureType.onSecondaryLongPressMoveUpdate, tapDetail));
              },
        ///// onSecondaryLongPressUp: !widget.gesturesToOverride
        /////         .contains(GestureType.onSecondaryLongPressUp)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onSecondaryLongPressUp, null));
        /////       },
        onSecondaryLongPressEnd: !widget.gesturesToOverride
                .contains(GestureType.onSecondaryLongPressEnd)
            ? null
            : (tapDetail) {
                touchController.add(
                    Gesture(GestureType.onSecondaryLongPressEnd, tapDetail));
              },
        onTertiaryLongPressDown: !widget.gesturesToOverride
                .contains(GestureType.onTertiaryLongPressDown)
            ? null
            : (tapDetail) {
                touchController.add(
                    Gesture(GestureType.onTertiaryLongPressDown, tapDetail));
              },
        ///// onTertiaryLongPressCancel: !widget.gesturesToOverride
        /////         .contains(GestureType.onTertiaryLongPressCancel)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onTertiaryLongPressCancel, null));
        /////       },
        ///// onTertiaryLongPress:
        /////     !widget.gesturesToOverride.contains(GestureType.onTertiaryLongPress)
        /////         ? null
        /////         : () {
        /////             touchController
        /////                 .add(Gesture(GestureType.onTertiaryLongPress, null));
        /////           },
        onTertiaryLongPressStart: !widget.gesturesToOverride
                .contains(GestureType.onTertiaryLongPressStart)
            ? null
            : (tapDetail) {
                touchController.add(
                    Gesture(GestureType.onTertiaryLongPressStart, tapDetail));
              },
        onTertiaryLongPressMoveUpdate: !widget.gesturesToOverride
                .contains(GestureType.onTertiaryLongPressMoveUpdate)
            ? null
            : (tapDetail) {
                touchController.add(Gesture(
                    GestureType.onTertiaryLongPressMoveUpdate, tapDetail));
              },
        ///// onTertiaryLongPressUp: !widget.gesturesToOverride
        /////         .contains(GestureType.onTertiaryLongPressUp)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onTertiaryLongPressUp, null));
        /////       },
        onTertiaryLongPressEnd: !widget.gesturesToOverride
                .contains(GestureType.onTertiaryLongPressEnd)
            ? null
            : (tapDetail) {
                touchController.add(
                    Gesture(GestureType.onTertiaryLongPressEnd, tapDetail));
              },
        onVerticalDragDown: !widget.gesturesToOverride
                .contains(GestureType.onVerticalDragDown)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onVerticalDragDown, tapDetail));
              },
        onVerticalDragStart: !widget.gesturesToOverride
                .contains(GestureType.onVerticalDragStart)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onVerticalDragStart, tapDetail));
              },
        onVerticalDragUpdate: !widget.gesturesToOverride
                .contains(GestureType.onVerticalDragUpdate)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onVerticalDragUpdate, tapDetail));
              },
        onVerticalDragEnd:
            !widget.gesturesToOverride.contains(GestureType.onVerticalDragEnd)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onVerticalDragEnd, tapDetail));
                  },
        ///// onVerticalDragCancel: !widget.gesturesToOverride
        /////         .contains(GestureType.onVerticalDragCancel)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onVerticalDragCancel, null));
        /////       },
        onHorizontalDragDown: !widget.gesturesToOverride
                .contains(GestureType.onHorizontalDragDown)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onHorizontalDragDown, tapDetail));
              },
        onHorizontalDragStart: !widget.gesturesToOverride
                .contains(GestureType.onHorizontalDragStart)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onHorizontalDragStart, tapDetail));
              },
        onHorizontalDragUpdate: !widget.gesturesToOverride
                .contains(GestureType.onHorizontalDragUpdate)
            ? null
            : (tapDetail) {
                touchController.add(
                    Gesture(GestureType.onHorizontalDragUpdate, tapDetail));
              },
        onHorizontalDragEnd: !widget.gesturesToOverride
                .contains(GestureType.onHorizontalDragEnd)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onHorizontalDragEnd, tapDetail));
              },
        ///// onHorizontalDragCancel: !widget.gesturesToOverride
        /////         .contains(GestureType.onHorizontalDragCancel)
        /////     ? null
        /////     : () {
        /////         touchController
        /////             .add(Gesture(GestureType.onHorizontalDragCancel, null));
        /////       },
        onForcePressStart:
            !widget.gesturesToOverride.contains(GestureType.onForcePressStart)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onForcePressStart, tapDetail));
                  },
        onForcePressPeak:
            !widget.gesturesToOverride.contains(GestureType.onForcePressPeak)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onForcePressPeak, tapDetail));
                  },
        onForcePressUpdate: !widget.gesturesToOverride
                .contains(GestureType.onForcePressUpdate)
            ? null
            : (tapDetail) {
                touchController
                    .add(Gesture(GestureType.onForcePressUpdate, tapDetail));
              },
        onForcePressEnd:
            !widget.gesturesToOverride.contains(GestureType.onForcePressEnd)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onForcePressEnd, tapDetail));
                  },
        onPanDown: !widget.gesturesToOverride.contains(GestureType.onPanDown)
            ? null
            : (tapDetail) {
                touchController.add(Gesture(GestureType.onPanDown, tapDetail));
              },
        onPanStart: !widget.gesturesToOverride.contains(GestureType.onPanStart)
            ? null
            : (tapDetail) {
                touchController.add(Gesture(GestureType.onPanStart, tapDetail));
              },
        onPanUpdate:
            !widget.gesturesToOverride.contains(GestureType.onPanUpdate)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onPanUpdate, tapDetail));
                  },
        onPanEnd: !widget.gesturesToOverride.contains(GestureType.onPanEnd)
            ? null
            : (tapDetail) {
                touchController.add(Gesture(GestureType.onPanEnd, tapDetail));
              },
        ///// onPanCancel:
        /////     !widget.gesturesToOverride.contains(GestureType.onPanCancel)
        /////         ? null
        /////         : () {
        /////             touchController.add(Gesture(GestureType.onPanCancel, null));
        /////           },
        onScaleStart:
            !widget.gesturesToOverride.contains(GestureType.onScaleStart)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onScaleStart, tapDetail));
                  },
        onScaleUpdate:
            !widget.gesturesToOverride.contains(GestureType.onScaleUpdate)
                ? null
                : (tapDetail) {
                    touchController
                        .add(Gesture(GestureType.onScaleUpdate, tapDetail));
                  },
        ///// onScaleEnd: !widget.gesturesToOverride.contains(GestureType.onScaleEnd)
        /////     ? null
        /////     : (tapDetail) {
        /////         touchController.add(Gesture(GestureType.onScaleEnd, tapDetail));
        /////       },
      ),
    );
  }

  @override
  void dispose() {
    touchController.close();
    super.dispose();
  }
}
