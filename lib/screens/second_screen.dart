import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_widgets/screens/analytics_screen.dart';
import 'package:my_widgets/widgets/actions_card.dart';
import 'package:my_widgets/widgets/header_widget.dart';
import 'package:my_widgets/widgets/person_info.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade300, Colors.brown.shade100])),
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              HeaderWidget(
                isCenter: false,
                isMain: true,
                title: "BRYAN SIMONIS",
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const AnalyticsScreen()));
                // },
              ),
              SizedBox(
                height: 20.h,
              ),
              homeContainer(),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "DATA ACTIONS",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionCard(
                            iconValue: Icons.file_download_rounded,
                          ),
                          // const SizedBox(width: 15),
                          // const SizedBox(
                          //   width: double.infinity / 3,
                          // ),
                          ActionCard(
                            iconValue: Icons.bar_chart,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AnalyticsScreen()));
                            },
                          ),
                          // const SizedBox(width: 15),
                          ActionCard(iconValue: Icons.refresh),
                          // const SizedBox(width: 15),
                          ActionCard(iconValue: Icons.menu),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "EMAIL OPEN RATE",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 8.h),
              PersonInfo(
                  name: "Robert Fox",
                  position: "CMO",
                  place: "Borer",
                  percentage: "63.4%",
                  urlImage:
                      'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
              SizedBox(
                height: 10.h,
              ),
              PersonInfo(
                  name: "Marta Padberg",
                  position: "COO",
                  place: "Boehm",
                  percentage: "72.9%",
                  urlImage:
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80')
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      //   child: BottomNavigationWidget(),
      // ),
    );
  }

  Container homeContainer() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 193, 192, 192),
          borderRadius: BorderRadius.circular(18.r)),
      padding: EdgeInsets.only(top: 18.h, left: 18.w, right: 18.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  child: Center(
                    child: Text(
                      "LECTURE",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "B2B SALES\nTECHNIQUES",
                style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "04.07.2022",
                style: TextStyle(
                    color: const Color.fromARGB(255, 123, 122, 122),
                    fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
          // const SizedBox(
          //   width: 6,
          // ),
          SizedBox(
            height: 170.h,
            width: 100.w,
            child: Image.asset("assets/human.png"),
          ),
        ],
      ),
    );
  }
}
