import 'package:flutter/material.dart';
import 'package:my_widgets/screens/gesture/gesture_one.dart';
import 'package:my_widgets/screens/gesture/gesture_three.dart';

class GestureTwo extends StatefulWidget {
  const GestureTwo({super.key});

  @override
  State<GestureTwo> createState() => _GestureTwoState();
}

class _GestureTwoState extends State<GestureTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GestureOne(),
              ));
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GestureThree(),
              ));
        }
      },
      child: Container(
        color: Colors.green,
        height: double.infinity,
        width: double.infinity,
        child: const Center(child: Text("Gesture Two")),
      ),
    ));
  }
}
