import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    //TO MAKE A CIRCLE
    canvas.drawCircle(center, 100, paint);

    //TO MAKE A CIRCLE USING PATH
    // var path = Path();
    // path.addOval(Rect.fromCircle(center: center, radius: 100));
    // canvas.drawPath(path, paint);

    //TO DRAW A SQUARE or any other shapes
    // var sides = 6; // change the number of side for any shapes
    // var radius = 150.0;
    // var path = Path();
    // var angle = (math.pi * 2) / sides;

    // Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    // path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    // for (int i = 1; i <= sides; i++) {
    //   double x = radius * math.cos(angle * i) + center.dx;
    //   double y = radius * math.sin(angle * i) + center.dy;

    //   path.lineTo(x, y);
    // }
    // path.close();
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
