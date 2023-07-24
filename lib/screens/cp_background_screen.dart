import 'package:flutter/material.dart';

import '../widgets/background_painter.dart';

class CpBackgroundScreen extends StatefulWidget {
  const CpBackgroundScreen({super.key});

  @override
  State<CpBackgroundScreen> createState() => _CpBackgroundScreenState();
}

class _CpBackgroundScreenState extends State<CpBackgroundScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.brown,
          child: CustomPaint(
            painter: BackgroundPainter(),
          ),
        ),
      ),
    );
  }
}
