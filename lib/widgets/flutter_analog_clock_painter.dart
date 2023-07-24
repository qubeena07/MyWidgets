import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class FlutterAnalogClockPainter extends CustomPainter {
  final DateTime _datetime;
  final double _borderWidth;
  FlutterAnalogClockPainter(
    this._datetime, {
    required double borderWidth,
  }) : _borderWidth = borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final double borderWidth = _borderWidth ?? radius / 20.0;

    canvas.translate(size.width / 2, size.height / 2);

    canvas.drawCircle(
        const Offset(0, 0),
        radius,
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.white);

    // border style
    if (borderWidth > 0) {
      Paint borderPaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..isAntiAlias = true;
      canvas.drawCircle(
          const Offset(0, 0), radius - borderWidth / 2, borderPaint);
    }
    double L = 150;
    double S = 6;
    _paintHourHand(canvas, L / 2.0, S);
    _paintMinuteHand(canvas, L / 1.4, S / 1.4);
    _paintSecondHand(canvas, L / 1.2, S / 3);

    //drawing center point
    Paint centerPointPaint = Paint()
      ..strokeWidth = ((radius - borderWidth) / 10)
      ..strokeCap = StrokeCap.round
      ..color = Colors.black;
    canvas.drawPoints(PointMode.points, [const Offset(0, 0)], centerPointPaint);
  }

  /// drawing hour hand
  void _paintHourHand(Canvas canvas, double radius, double strokeWidth) {
    double angle = _datetime.hour % 12 + _datetime.minute / 60.0 - 3;
    Offset handOffset = Offset(cos(getRadians(angle * 30)) * radius,
        sin(getRadians(angle * 30)) * radius);
    final hourHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth;
    canvas.drawLine(const Offset(0, 0), handOffset, hourHandPaint);
  }

  /// drawing minute hand
  void _paintMinuteHand(Canvas canvas, double radius, double strokeWidth) {
    double angle = _datetime.minute - 15.0;
    Offset handOffset = Offset(cos(getRadians(angle * 6.0)) * radius,
        sin(getRadians(angle * 6.0)) * radius);
    final hourHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth;
    canvas.drawLine(const Offset(0, 0), handOffset, hourHandPaint);
  }

  /// drawing second hand
  void _paintSecondHand(Canvas canvas, double radius, double strokeWidth) {
    double angle = _datetime.second - 15.0;
    Offset handOffset = Offset(cos(getRadians(angle * 6.0)) * radius,
        sin(getRadians(angle * 6.0)) * radius);
    final hourHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth;
    canvas.drawLine(const Offset(0, 0), handOffset, hourHandPaint);
  }

  @override
  bool shouldRepaint(FlutterAnalogClockPainter oldDelegate) {
    return _datetime != oldDelegate._datetime ||
        _borderWidth != oldDelegate._borderWidth;
  }

  static double getRadians(double angle) {
    return angle * pi / 180;
  }
}
