import 'package:flutter/material.dart';

import 'gesture_two.dart';

class GestureThree extends StatefulWidget {
  const GestureThree({super.key});

  @override
  State<GestureThree> createState() => _GestureThreeState();
}

class _GestureThreeState extends State<GestureThree> {
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
                builder: (context) => const GestureTwo(),
              ));
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {}
      },
      child: Container(
        color: Colors.red,
        height: double.infinity,
        width: double.infinity,
        child: const Center(child: Text("Gesture Three")),
      ),
    ));
  }
}
