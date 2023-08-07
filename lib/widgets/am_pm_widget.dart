import 'package:flutter/material.dart';

class AmPmWidget extends StatelessWidget {
  final bool isAm;
  const AmPmWidget({super.key, required this.isAm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        child: Center(
          child: Text(
            isAm == true ? "AM" : "PM",
            style: const TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
