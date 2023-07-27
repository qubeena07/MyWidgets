import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideScreen extends StatelessWidget {
  const SlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SlideAction(
            innerColor: Colors.deepPurple,
            outerColor: Colors.deepPurple[200],
            borderRadius: 12,
            elevation: 0,
            sliderButtonIcon: const Icon(
              Icons.lock_outline_rounded,
              color: Colors.white,
            ),
            // submittedIcon: const Icon(
            //   Icons.lock_open,
            //   color: Colors.deepPurple,
            // ),
            onSubmit: () {},
            text: "Slide to unlock",
            textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            sliderRotate: false,
          ),
        ),
      ),
    );
  }
}
