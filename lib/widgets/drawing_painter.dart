import 'dart:ui';

import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoint;
  DrawingPainter(this.drawingPoint);
  List<Offset> offsetsList = [];
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoint.length; i++) {
      if (drawingPoint[i + 1] != null) {
        canvas.drawLine(drawingPoint[i].offset, drawingPoint[i + 1].offset,
            drawingPoint[i].paint);
      } else if (drawingPoint[i + 1] == null) {
        offsetsList.clear();
        offsetsList.add(drawingPoint[i].offset);

        canvas.drawPoints(PointMode.points, offsetsList, drawingPoint[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DrawingPoint {
  Offset offset;
  Paint paint;
  DrawingPoint(this.offset, this.paint);
}
