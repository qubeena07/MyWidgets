import 'package:flutter/material.dart';
import 'package:my_widgets/screens/gesture/gesture_two.dart';

class GestureOne extends StatefulWidget {
  const GestureOne({super.key});

  @override
  State<GestureOne> createState() => _GestureOneState();
}

class _GestureOneState extends State<GestureOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      // onHorizontalDragStart: (details) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const AgeSlider(),
      //       ));
      // },
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const AgeSlider(),
          //     ));
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GestureTwo(),
              ));
        }
      },
      child: Container(
        color: Colors.amber,
        height: double.infinity,
        width: double.infinity,
        child: const Center(child: Text("Gesture One")),
      ),
    ));
  }
}
