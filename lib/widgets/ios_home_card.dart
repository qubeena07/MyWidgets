import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IosHomeCard extends StatelessWidget {
  IosHomeCard(
      {super.key,
      this.firstText,
      this.firstSize,
      this.sizeBox1,
      this.subText,
      this.imageSrc,
      this.cardWidget,
      this.contHeight,
      // required this.isStack,
      this.contWidth,
      this.stackWidget,
      this.sizedBoxHeight,
      this.subSize});
  String? firstText;
  double? firstSize;
  double? sizeBox1;
  String? subText;
  double? subSize;
  double? sizedBoxHeight;
  String? imageSrc;
  Widget? cardWidget;
  double? contHeight;
  double? contWidth;
  Widget? stackWidget;
  // bool isStack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 190.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstText ?? "Hello",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: firstSize ?? 15.sp),
            ),
            SizedBox(
              height: sizeBox1 ?? 0.h,
            ),
            Text(
              subText ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: subSize ?? 10.h),
            ),
            SizedBox(
              height: sizedBoxHeight ?? 0.h,
            ),

            SizedBox(height: contHeight, width: contWidth, child: cardWidget),
            // isStack
            //     ? Row(
            //         children: [
            //           SizedBox(
            //               height: contHeight,
            //               width: contWidth,
            //               child: cardWidget),
            //           SizedBox(
            //               height: contHeight,
            //               width: contWidth,
            //               child: cardWidget),
            //           SizedBox(
            //               height: contHeight,
            //               width: contWidth,
            //               child: cardWidget),
            //         ],
            //       )
            //     : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
