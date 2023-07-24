import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class AnalogClockScreen extends StatefulWidget {
  const AnalogClockScreen({super.key});

  @override
  State<AnalogClockScreen> createState() => _AnalogClockScreenState();
}

class _AnalogClockScreenState extends State<AnalogClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange,
        const Color.fromARGB(255, 213, 90, 81).withOpacity(1),
        Colors.deepOrangeAccent.withOpacity(0.5)
      ], begin: Alignment.topRight, end: Alignment.bottomCenter)),
      child: const Center(
        child: AnalogClock(
          hourHandColor: Color.fromARGB(255, 46, 121, 252),
          minuteHandColor: Color.fromARGB(255, 106, 181, 243),
          secondHandColor: Color.fromARGB(255, 169, 26, 26),
          // showDigitalClock: false,
          digitalClockColor: Colors.white,
          tickColor: Colors.white,
        ),
      ),
    );
  }
}
