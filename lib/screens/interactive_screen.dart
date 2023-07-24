import 'package:flutter/material.dart';

class InteractiveWidget extends StatelessWidget {
  const InteractiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SizedBox(
          height: 500,
          width: double.infinity,
          child: InteractiveViewer(
              // scaleEnabled: false,
              // constrained: false,
              boundaryMargin: const EdgeInsets.all(42),
              child: Image.asset("assets/beach.jpeg")
              // AssetImage('assets/beach.jpeg'),
              ),
        ),
      ),
    );
  }
}
