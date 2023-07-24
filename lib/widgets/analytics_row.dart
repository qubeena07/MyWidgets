import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalyticsRow extends StatelessWidget {
  AnalyticsRow({super.key, required this.title, required this.cTitle});

  String title;
  String cTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: EdgeInsets.all(4.r),
            child: Center(
              child: Text(
                cTitle,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        )
      ],
    );
  }
}
