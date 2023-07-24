import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    this.height,
    this.width,
    this.radius,
    super.key,
  });
  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 16))),
    );
  }
}
