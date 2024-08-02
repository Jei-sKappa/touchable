import 'package:flutter/cupertino.dart';
import 'package:touchable/src/shapes/shape.dart';

class PathShape extends Shape {
  final Path path;

  PathShape(
    this.path, {
    super.paint,
    super.hitTestBehavior,
    super.gestureCallbacks,
  });

  @override
  bool isInside(Offset p) {
    return path.contains(p);
  }
}
