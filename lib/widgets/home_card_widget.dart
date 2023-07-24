import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.iconData,
      this.onLongTap});
  String title;
  VoidCallback onTap;
  IconData? iconData;
  VoidCallback? onLongTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongTap,
      onTap: onTap,
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 242, 242, 242).withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(31, 253, 253, 253),
              Color.fromARGB(255, 243, 243, 243)
            ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 30,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
