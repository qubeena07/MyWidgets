import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  var shimmerGradient = const LinearGradient(
    colors: [
      Colors.black,
      Colors.grey,
      Colors.black,
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return shimmerGradient.createShader(bounds);
      },
      child: widget.child,
    );
  }
}



// class _SlidingGradientTransform extends GradientTransform {
//   const _SlidingGradientTransform({
//     required this.slidePercent,
//   });

//   final double slidePercent;

//   @override
//   Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
//     return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
//   }
// }
