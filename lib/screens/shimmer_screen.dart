import 'package:flutter/material.dart';
import 'package:my_widgets/widgets/shimmer_loading.dart';
import 'package:my_widgets/widgets/skeleton.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({super.key});

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  // var shimmerGradient = const LinearGradient(
  //   colors: [
  //     Color(0xFFEBEBF4),
  //     Color(0xFFF4F4F4),
  //     Color(0xFFEBEBF4),
  //   ],
  //   stops: [
  //     0.1,
  //     0.3,
  //     0.4,
  //   ],
  //   begin: Alignment(-1.0, -0.3),
  //   end: Alignment(1.0, 0.3),
  //   tileMode: TileMode.clamp,
  // );

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: [
          ShimmerLoading(
            child: Skeleton(
              height: 60,
              radius: 60,
              width: 60,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                child: Skeleton(
                  width: 250,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ShimmerLoading(
                child: Skeleton(
                  width: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
