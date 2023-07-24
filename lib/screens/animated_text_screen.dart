import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextScreen extends StatefulWidget {
  const AnimatedTextScreen({super.key});

  @override
  State<AnimatedTextScreen> createState() => _AnimatedTextScreenState();
}

class _AnimatedTextScreenState extends State<AnimatedTextScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              child: TextLiquidFill(
                loadDuration: const Duration(seconds: 6),
                text: "LIFE",
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.white,
                textStyle: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold),
                boxHeight: 60,
              ),
            ),
            SizedBox(
              child: TextLiquidFill(
                loadDuration: const Duration(seconds: 9),
                text: "IS",
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.white,
                textStyle: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold),
                boxHeight: 65,
              ),
            ),
            SizedBox(
              child: TextLiquidFill(
                loadDuration: const Duration(seconds: 12),
                text: "BEAUTIFUL",
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.white,
                textStyle: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold),
                boxHeight: 65,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              color: Colors.brown,
              width: double.infinity,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText('do IT!'),
                      FadeAnimatedText('do it RIGHT!!'),
                      FadeAnimatedText('do it RIGHT NOW!!!'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
