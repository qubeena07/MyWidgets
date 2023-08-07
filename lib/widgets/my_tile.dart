import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text("Hell0"),
      ),
    );
  }
}
