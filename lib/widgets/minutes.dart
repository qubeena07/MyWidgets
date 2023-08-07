import 'package:flutter/material.dart';

class MyMinutes extends StatelessWidget {
  final int minutes;
  const MyMinutes({super.key, required this.minutes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        child: Center(
          child: Text(
            minutes < 10 ? "0$minutes" : minutes.toString(),
            style: const TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
