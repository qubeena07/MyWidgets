import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressRing extends StatefulWidget {
  const CircularProgressRing(
      {Key? key,
      required this.progress,
      this.linearGradientFirstColor = Colors.orange,
      this.linearGradientSecondColor = Colors.deepOrange})
      : super(key: key);
  final double progress;
  final Color? linearGradientFirstColor;
  final Color? linearGradientSecondColor;

  @override
  State<CircularProgressRing> createState() => _CircularProgressRingState();
}

class _CircularProgressRingState extends State<CircularProgressRing>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));

    _animation =
        Tween<double>(begin: 0, end: 100).animate(_animationController!)
          ..addListener(() {
            setState(() {});
          });
    _animationController!.forward();
  }

  @override
  void dispose() {
    if (_animationController != null) _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: CustomPaint(
            foregroundPainter: CircularProgress(
                linearGradientFirstColor: Colors.deepOrange[300],
                linearGradientSecondColor: Colors.deepOrange[300],
                animationProgress: _animationController!.value,
                progress: widget.progress),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 68,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.progress >= 0)
                      Text(
                        widget.progress.toInt().toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 32),
                      ),
                    if (widget.progress < 0)
                      const Text(
                        "0",
                        style: TextStyle(color: Colors.black, fontSize: 32),
                      ),
                    const Text(
                      // "Days left",
                      "Scan",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class CircularProgress extends CustomPainter {
  CircularProgress(
      {required this.animationProgress,
      required this.progress,
      this.linearGradientFirstColor = Colors.orange,
      this.linearGradientSecondColor = Colors.deepOrange});
  final double strokeWidth = 10;
  final double animationProgress;
  final double progress;
  final Color? linearGradientFirstColor;
  final Color? linearGradientSecondColor;
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double animatedRadius = 70;
    Paint circle = Paint()
      ..strokeWidth = strokeWidth
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
        colors: [
          Colors.red.withOpacity(0.2),
          Colors.blue.withOpacity(0.2),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: animatedRadius))
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    canvas.drawCircle(center, animatedRadius, circle);

    Paint animationArch = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..shader = const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
        colors: [Colors.redAccent, Colors.blue],
      ).createShader(Rect.fromCircle(center: center, radius: animatedRadius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (animationProgress * progress / 146);
    if (progress > 0) {
      canvas.drawArc(Rect.fromCircle(center: center, radius: animatedRadius),
          -pi / 2, angle, false, animationArch);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
