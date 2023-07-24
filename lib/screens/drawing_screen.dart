import 'package:flutter/material.dart';

import '../widgets/drawing_painter.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({super.key});

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  Color selectedColor = Colors.black;
  double strokeWidth = 5;
  List<DrawingPoint> drawingPoint = [];
  List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.black,
    Colors.purple,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              setState(() {
                drawingPoint.add(DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round));
              });
            },
            onPanUpdate: (details) {
              setState(() {
                drawingPoint.add(DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round));
              });
            },
            onPanEnd: (details) {
              setState(() {
                drawingPoint.add(null!);
              });
            },
            child: CustomPaint(
              painter: DrawingPainter(drawingPoint),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
              top: 45,
              right: 15,
              child: Row(
                children: [
                  Slider(
                      activeColor: Colors.red,
                      min: 0,
                      max: 40,
                      value: strokeWidth,
                      onChanged: (val) => setState(() {
                            strokeWidth = val;
                          })),
                  ElevatedButton.icon(
                      onPressed: () => setState(() {
                            drawingPoint = [];
                          }),
                      icon: const Icon(Icons.close),
                      label: const Text("Clear board"))
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey.withOpacity(0.5),
          padding: const EdgeInsets.all(8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  colors.length, (index) => colorContainer(colors[index]))),
        ),
      ),
    );
  }

  Widget colorContainer(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border:
                isSelected ? Border.all(color: Colors.white, width: 4) : null),
      ),
    );
  }
}
