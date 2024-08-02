import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:touchable/src/gesture_callbacks.dart';
import 'package:touchable/src/touchy_canvas.dart';

class InvalidCanvasError extends Error {
  final Object canvas;

  InvalidCanvasError(this.canvas);

  @override
  String toString() {
    return 'Invalid canvas type: $canvas';
  }
}

class TouchyCanvasHelper {
  static void clipPath(Object canvas, Path path, {bool doAntiAlias = true}) {
    if (canvas is Canvas) {
      canvas.clipPath(path, doAntiAlias: doAntiAlias);
    } else if (canvas is TouchyCanvas) {
      canvas.clipPath(path, doAntiAlias: doAntiAlias);
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void clipRRect(Object canvas, RRect rrect, {bool doAntiAlias = true}) {
    if (canvas is Canvas) {
      canvas.clipRRect(rrect, doAntiAlias: doAntiAlias);
    } else if (canvas is TouchyCanvas) {
      canvas.clipRRect(rrect, doAntiAlias: doAntiAlias);
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void clipRect(Object canvas, Rect rect,
      {ClipOp clipOp = ClipOp.intersect, bool doAntiAlias = true}) {
    if (canvas is Canvas) {
      canvas.clipRect(rect, clipOp: clipOp, doAntiAlias: doAntiAlias);
    } else if (canvas is TouchyCanvas) {
      canvas.clipRect(rect, clipOp: clipOp, doAntiAlias: doAntiAlias);
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawCircle(
    Object canvas,
    Offset c,
    double radius,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawCircle(c, radius, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawCircle(
        c,
        radius,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawLine(
    Object canvas,
    Offset p1,
    Offset p2,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawLine(p1, p2, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawLine(
        p1,
        p2,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawOval(
    Object canvas,
    Rect rect,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawOval(rect, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawOval(
        rect,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawPath(
    Object canvas,
    Path path,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawPath(path, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawPath(
        path,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawPoints(
    Object canvas,
    PointMode pointMode,
    List<Offset> points,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawPoints(pointMode, points, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawPoints(
        pointMode,
        points,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawRRect(
    Object canvas,
    RRect rrect,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawRRect(rrect, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawRRect(
        rrect,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawRawPoints(
    Object canvas,
    PointMode pointMode,
    Float32List points,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawRawPoints(pointMode, points, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawRawPoints(
        pointMode,
        points,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawRect(
    Object canvas,
    Rect rect,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawRect(rect, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawRect(
        rect,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawImage(
    Object canvas,
    Image image,
    Offset p,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawImage(image, p, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawImage(
        image,
        p,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }

  static void drawArc(
    Object canvas,
    Rect rect,
    double startAngle,
    double sweepAngle,
    bool useCenter,
    Paint paint, {
    HitTestBehavior? hitTestBehavior,
    GestureCallbacks? gestureCallbacks,
  }) {
    if (canvas is Canvas) {
      canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
    } else if (canvas is TouchyCanvas) {
      canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        useCenter,
        paint,
        hitTestBehavior: hitTestBehavior,
        gestureCallbacks: gestureCallbacks,
      );
    } else {
      throw InvalidCanvasError(canvas);
    }
  }
}
