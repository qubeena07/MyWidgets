import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.width,
      this.color,
      required this.onTap,
      this.iconColor,
      this.text,
      this.icon});
  double? width;
  Color? color;
  VoidCallback onTap;
  String? text;
  IconData? icon;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width ?? 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? Colors.black),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text ?? "Submit",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  icon,
                  size: 20,
                  color: iconColor ?? Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
