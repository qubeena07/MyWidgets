import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class CubeSwipe extends StatefulWidget {
  const CubeSwipe({super.key});

  @override
  State<CubeSwipe> createState() => _CubeSwipeState();
}

class _CubeSwipeState extends State<CubeSwipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          CarouselSlider(slideTransform: const RotateUpTransform(), children: [
        Container(
          color: Colors.deepPurpleAccent,
          child: const Center(
            child: Text(
              "Swipe →",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
        Container(
          color: Colors.pink,
          child: const Center(
            child: Text(
              "← Swipe →",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
        Container(
          color: Colors.yellow,
          child: const Center(
            child: Text(
              "← Swipe →",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
        Container(
          color: Colors.green,
          child: const Center(
            child: Text(
              "← Swipe",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }
}
