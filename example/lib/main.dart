import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Touchable',
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Offset circlePosition = const Offset(150, 150);

  void updateCirclePosition(Offset position) {
    setState(() {
      circlePosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Touchable'),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: CanvasTouchDetector(
                gesturesToOverride: [
                  GestureType.onTapDown,
                ],
                builder: (context) {
                  return CustomPaint(
                    painter: MyPainter(
                      canvasTouchDetectorContext: context,
                    ),
                    child: Container(),
                  );
                },
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: CanvasTouchDetector(
                gesturesToOverride: [
                  GestureType.onPanStart,
                  GestureType.onPanUpdate,
                  GestureType.onPanEnd,
                ],
                builder: (context) {
                  return CustomPaint(
                    painter: MovablePainter(
                      canvasTouchDetectorContext: context,
                      position: circlePosition,
                      onPositionChanged: updateCirclePosition,
                    ),
                    child: Container(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovablePainter extends CustomPainter {
  const MovablePainter({
    required this.canvasTouchDetectorContext,
    required this.position,
    required this.onPositionChanged,
  });

  final BuildContext canvasTouchDetectorContext;

  final Offset position;

  final void Function(Offset) onPositionChanged;

  @override
  void paint(Canvas canvas, Size size) {
    final _canvas = TouchyCanvas(canvasTouchDetectorContext, canvas);

    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    _canvas.drawCircle(
      position,
      75,
      paint,
      gestureCallbacks: GestureCallbacks(
        onPanStart: (details) {
          print('onPanStart AAA');
        },
        onPanUpdate: (details) {
          print('onPanUpdate AAA');
          onPositionChanged(details.localPosition);
        },
        onPanEnd: (details) {
          print('onPanEnd AAA');
        },
      ),
    );
  }

  @override
  bool shouldRepaint(MovablePainter oldDelegate) {
    return true;
  }
}

class MyPainter extends CustomPainter {
  const MyPainter({
    required this.canvasTouchDetectorContext,
  });

  final BuildContext canvasTouchDetectorContext;

  @override
  void paint(Canvas canvas, Size size) {
    final _canvas = TouchyCanvas(canvasTouchDetectorContext, canvas);

    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    _canvas.drawRect(
      Rect.fromLTWH(10, 100, 100, 50),
      paint,
      gestureCallbacks: GestureCallbacks(
        onTapDown: (details) {
          print('onTapDown');
        },
      ),
    );

    // Draw Circle
    _canvas.drawCircle(
      Offset(250, 50),
      30,
      paint,
      gestureCallbacks: GestureCallbacks(
        onTapDown: (details) {
          print('onTapDown');
        },
      ),
    );

    // Draw Oval
    _canvas.drawOval(
      Rect.fromLTWH(10, 200, 100, 50),
      paint,
      gestureCallbacks: GestureCallbacks(
        onTapDown: (details) {
          print('onTapDown');
        },
      ),
    );

    _canvas.drawLine(
      Offset(70, 40),
      Offset(200, 80),
      paint,
      gestureCallbacks: GestureCallbacks(
        onTapDown: (details) {
          print('onTapDown');
        },
      ),
    );

    // Draw Paragraph
    // _canvas.drawParagraph();

    // Draw Path
    final path = Path()
      ..moveTo(10, 10)
      ..lineTo(50, 50)
      ..lineTo(10, 50)
      ..close();
    _canvas.drawPath(
      path,
      paint,
      gestureCallbacks: GestureCallbacks(
        onTapDown: (details) {
          print('onTapDown');
        },
      ),
    );

    // Draw Shadow
    _canvas.drawShadow(
      path,
      Colors.white,
      5,
      true,
    );

    // Draw Points
    // _canvas.drawPoints(
    //   PointMode.polygon,
    //   [
    //     Offset(210, 10),
    //     Offset(250, 50),
    //     Offset(210, 50),
    //     Offset(210, 10),
    //   ],
    //   paint,
    //   onTapDown: (details) {
    //     print('onTapDown');
    //   },
    // );

    // Draw Rect
    _canvas.drawRect(
      Rect.fromLTWH(120, 100, 100, 50),
      paint,
      gestureCallbacks: GestureCallbacks(
        onTapDown: (details) {
          print('onTapDown');
        },
      ),
    );

    // Draw RRect
    _canvas.drawRRect(
      RRect.fromLTRBR(120, 160, 220, 200, const Radius.circular(10)),
      paint,
      gestureCallbacks: GestureCallbacks(
        onTapDown: (details) {
          print('onTapDown');
        },
      ),
    );

    // Draw Arc
    _canvas.drawArc(Rect.fromLTRB(10, 300, 65, 370), 45, 90, true, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return true;
  }
}
