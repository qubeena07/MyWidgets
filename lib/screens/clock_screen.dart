import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/clock_painter.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {});
      });
    });
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 226, 226, 226),
                  Color.fromARGB(31, 231, 231, 231)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(96, 157, 156, 156)
                          .withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(5, 10)),
                  const BoxShadow(
                      color: Color.fromARGB(255, 200, 200, 200),
                      blurRadius: 15,
                      offset: Offset(-5, -02)),
                ]),
          ),
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 243, 243, 243),
                  Color.fromARGB(31, 245, 245, 245)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(96, 129, 129, 129)
                          .withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(5, 10)),
                  const BoxShadow(
                      color: Color.fromARGB(255, 189, 189, 189),
                      blurRadius: 15,
                      offset: Offset(-5, -02)),
                ]),
          ),
          Transform.rotate(
            angle: pi / 2,
            child: Container(
              width: 300,
              height: 300,
              constraints: const BoxConstraints.expand(),
              child: CustomPaint(
                painter: ClockPainter(),
                child: Container(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
