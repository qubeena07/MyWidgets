import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonInfo extends StatelessWidget {
  PersonInfo(
      {super.key,
      required this.urlImage,
      this.name,
      this.position,
      this.percentage,
      this.place});
  String urlImage;
  String? name;
  String? position;
  String? place;
  String? percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleImage(urlImage: urlImage),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name ?? "John James",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: 8.h,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Text(
                    position ?? "CEO",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 87, 87, 87)),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 0.2.h,

                    // thickness: 0.4,
                  ),
                  Text(
                    place ?? "CEO",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 87, 87, 87)),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          percentage ?? "10%",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: Colors.black),
        ),
      ],
    );
  }
}

class CircleImage extends StatelessWidget {
  CircleImage({super.key, required this.urlImage, this.radius});
  String urlImage;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius ?? 25.sp,
        backgroundImage: NetworkImage(
          urlImage,
        ));
  }
}
