import 'package:flutter/material.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Hero(
            tag: "DemoTag",
            child: Icon(
              Icons.add,
              size: 150,
            )),
      ),
    );
  }
}
