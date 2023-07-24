import 'package:flutter/material.dart';

import '../widgets/body_widget.dart';

class FlutterWebScreen extends StatelessWidget {
  const FlutterWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [NavigationBarWidget(), BodyContent(), FooterWeb()],
      ),
    );
  }
}

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Colors.black54, Colors.white])),
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 230,
                width: 150,
                child: Image.asset("assets/peach.png", fit: BoxFit.contain)),
            // const SizedBox(
            //   width: 250,
            // ),
            const Text(
              "WELCOME TO NEW HOME",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 30),
            ),
            const Text(
              "Logout",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        // height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.indigoAccent,
          Colors.cyanAccent,
          Colors.purpleAccent
        ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyWidget(
                text: "Some Beach",
                imageName: "assets/beach.jpeg",
              ),
              BodyWidget(
                text: "Cute Dog",
                imageName: "assets/dog.jpeg",
              ),
              BodyWidget(
                text: "You're the Sunflower",
                imageName: "assets/sunflower.jpeg",
              ),
              BodyWidget(
                text: "IfellForYou ",
                imageName: "assets/tour.jpeg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterWeb extends StatelessWidget {
  const FooterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Colors.black54, Colors.white])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Contact Us",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
