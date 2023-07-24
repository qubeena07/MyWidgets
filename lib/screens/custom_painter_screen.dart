import 'package:flutter/material.dart';
import 'package:my_widgets/widgets/shape_painter.dart';

import '../widgets/circle_painter.dart';

class CustomPainterScreen extends StatefulWidget {
  const CustomPainterScreen({super.key});

  @override
  State<CustomPainterScreen> createState() => _CustomPainterScreenState();
}

class _CustomPainterScreenState extends State<CustomPainterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween<double>(
      begin: 0,
      end: 12.5664, // 2Radians (360 degrees)
    ).animate(animationController);
    animationController.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Custom Painter"),
        ),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Transform.rotate(
            angle: animation.value,
            child: CustomPaint(
              painter: ShapePainter(),
              foregroundPainter: CirclePainter(),
              child: Container(),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}
