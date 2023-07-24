import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BackgroundRiveScreen extends StatefulWidget {
  const BackgroundRiveScreen({super.key});

  @override
  State<BackgroundRiveScreen> createState() => _BackgroundRiveScreenState();
}

class _BackgroundRiveScreenState extends State<BackgroundRiveScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
            fit: BoxFit.fill,
          ),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 10,
            ),
            child: const SizedBox(),
          )),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "CONTENT HERE",
                  style: TextStyle(
                      fontSize: 60, height: 1.3, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 350,
                ),
                AnimatedBtn(
                  btnAnimationController: _btnAnimationController,
                  press: () {
                    _btnAnimationController.isActive = true;
                    Future.delayed(const Duration(seconds: 20));
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn(
      {super.key,
      required RiveAnimationController btnAnimationController,
      required this.press})
      : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_right_alt,
                    size: 40,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Start the course",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
