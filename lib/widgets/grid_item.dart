import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({required this.value, Key? key}) : super(key: key);
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: const Color.fromARGB(255, 55, 163, 251)),
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          )),
    );
  }
}
