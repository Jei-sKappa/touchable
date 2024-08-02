import 'dart:async';

import 'package:flutter/material.dart';
import 'package:touchable/src/types/types.dart';

class TouchDetectionController extends InheritedWidget {
  final StreamController<Gesture> _controller;
  final Future<void> Function(Function(Gesture) callBack) addListener;

  bool get hasListener => _controller.hasListener;

  StreamController<Gesture> get controller => _controller;

  const TouchDetectionController(this._controller, this.addListener,
      {required Widget child})
      : super(child: child);

  static TouchDetectionController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TouchDetectionController>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}