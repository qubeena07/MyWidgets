import 'package:flutter/material.dart';

class RotationAnimationScreen extends StatefulWidget {
  const RotationAnimationScreen({super.key});

  @override
  State<RotationAnimationScreen> createState() =>
      _RotationAnimationScreenState();
}

class _RotationAnimationScreenState extends State<RotationAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller;

  late Animation<double> animation1;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation1 = CurvedAnimation(parent: controller1, curve: Curves.easeIn);
    controller1.repeat();
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeOut);
    controller2.repeat();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(seconds: 3);
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RotationTransition(
              turns: animation1,
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("assets/cube1.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RotationTransition(
            turns: animation2,
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset("assets/star1.jpeg"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            child: const Text("Show bottom sheet"),
            onPressed: () => showModalBottomSheet(
              context: context,
              transitionAnimationController: controller,
              builder: (context) {
                return Container(
                  color: Colors.green,
                  height: 200,
                  child: const Text("Your bottom sheet"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
