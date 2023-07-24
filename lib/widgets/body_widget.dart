import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  BodyWidget({
    required this.text,
    required this.imageName,
    super.key,
  });
  String text;
  String imageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imageName), fit: BoxFit.fill)),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
          )),
        )
      ],
    );
  }
}
