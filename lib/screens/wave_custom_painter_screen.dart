import 'package:flutter/material.dart';

class WaveCustomPainterScreen extends StatefulWidget {
  const WaveCustomPainterScreen({super.key});

  @override
  State<WaveCustomPainterScreen> createState() =>
      _WaveCustomPainterScreenState();
}

class _WaveCustomPainterScreenState extends State<WaveCustomPainterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.red,
          ),
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width / 2.8,
            child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 60,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  radius: 50,
                  child: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 80,
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
