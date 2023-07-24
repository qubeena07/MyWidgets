import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white.withOpacity(0.2);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();

    final path2 = Path();
    path2.moveTo(size.width, 0);
    path2.lineTo(size.width * 1, 0);

    path2.lineTo(size.width * 0.3, size.height);
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
