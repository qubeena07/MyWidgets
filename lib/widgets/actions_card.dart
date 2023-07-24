import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionCard extends StatelessWidget {
  ActionCard({super.key, required this.iconValue, this.onTap});

  IconData iconValue;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.all(14.r),
              child: Center(
                child: Icon(
                  iconValue,
                  size: 25.sp,
                ),
              ),
            )),
      ),
    );
  }
}
