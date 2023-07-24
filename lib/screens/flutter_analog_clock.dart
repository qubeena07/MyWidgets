import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/flutter_analog_clock_painter.dart';

class FlutterAnalogClock extends StatefulWidget {
  final DateTime? dateTime;
  final double? borderWidth;
  final double width;
  final double height;
  final BoxDecoration? decoration;
  final Widget? child;
  const FlutterAnalogClock(
      {this.dateTime,
      this.borderWidth,
      this.width = double.infinity,
      this.height = double.infinity,
      this.decoration = const BoxDecoration(),
      this.child,
      Key? key})
      : super(key: key);

  @override
  State<FlutterAnalogClock> createState() =>
      _FlutterAnalogClockState(dateTime ?? DateTime.now());
}

class _FlutterAnalogClockState extends State<FlutterAnalogClock> {
  Timer? _timer;
  late final DateTime? _dateTime;
  _FlutterAnalogClockState(this._dateTime);

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _dateTime = _dateTime!.add(const Duration(seconds: 1));
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: widget.decoration,
        child: CustomPaint(
          painter: FlutterAnalogClockPainter(_dateTime ?? DateTime.now(),
              borderWidth: widget.borderWidth ?? 0),
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
