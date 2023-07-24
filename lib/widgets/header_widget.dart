import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_widgets/widgets/person_info.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget(
      {super.key,
      required this.isMain,
      this.title,
      required this.isCenter,
      this.onTap});
  bool isMain = true;
  bool isCenter = true;
  VoidCallback? onTap;

  String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isMain
            ? CircleImage(
                urlImage:
                    "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
                radius: 26.r,
              )
            : GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.adaptive.arrow_back)),
        SizedBox(
          width: 10.w,
        ),
        // isCenter
        //     ? Text(
        //         title ?? "name",
        //         textAlign: TextAlign.center,
        //         style: const TextStyle(
        //             fontSize: 18,
        //             color: Colors.black,
        //             fontWeight: FontWeight.w700),
        //       )
        //     :
        Text(
          title ?? "name",
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.legend_toggle_outlined,
              size: 30.sp,
            ))
      ],
    );
  }
}
