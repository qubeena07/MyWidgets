import 'package:flutter/material.dart';

class RevenueRow extends StatelessWidget {
  RevenueRow({super.key, this.rNum, this.rTitle});

  String? rNum;
  String? rTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rNum ?? "0",
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 35),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          rTitle ?? "Revenue",
          style: const TextStyle(
              fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
