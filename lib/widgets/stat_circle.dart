import 'package:flutter/material.dart';

class StatCircle extends StatelessWidget {
  StatCircle({super.key, this.color, this.radius, this.circleText});
  Color? color;
  double? radius;
  String? circleText;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color ?? Colors.grey,
      radius: radius ?? 40,
      child: Center(
        child: Text(
          circleText ?? "",
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  StatRow({super.key, this.color, this.radius, this.circleText, this.rowText});
  Color? color;
  double? radius;
  String? circleText;
  String? rowText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatCircle(
          circleText: circleText,
          radius: radius,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          rowText ?? "Stat value",
          style: const TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
