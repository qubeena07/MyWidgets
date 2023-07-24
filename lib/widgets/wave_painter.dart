import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()
    //   ..color = Colors.redAccent
    //   ..strokeWidth = 5
    //   ..style = PaintingStyle.fill
    //   ..strokeCap = StrokeCap.round;

    // var path = Path();
    // path.lineTo(0, size.height * 0.5);
    // var firstStart = Offset(size.width * 0.4, size.height * 0.5);
    // var firstEnd = Offset(size.width * 0.4, size.height * 0.4);
    // path.quadraticBezierTo(
    //     firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    // var secondStart = Offset(size.width * 0.5, size.height * 0.6);
    // var secondEnd = Offset(size.width * 0.7, size.height * 0.6);
    // path.quadraticBezierTo(
    //     secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    // path.close();

    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, 0)
      ..quadraticBezierTo(
        size.width * .7,
        size.height * .08,
        size.width * .9,
        size.height * .05,
      )
      ..arcToPoint(
        Offset(
          size.width * .93,
          size.height * .15,
        ),
        radius: Radius.circular(size.height * .05),
        largeArc: true,
      )
      ..cubicTo(
        size.width * .6,
        size.height * .15,
        size.width * .5,
        size.height * .46,
        0,
        size.height * .3,
      )
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
