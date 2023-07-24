import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/analytics_row.dart';
import '../widgets/bar_column.dart';
import '../widgets/header_widget.dart';
import '../widgets/revenue_row.dart';
import '../widgets/stat_circle.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                isCenter: true,
                isMain: false,
                title: "                ANALYTICS",
              ),
              SizedBox(
                height: 15.h,
              ),
              AnalyticsRow(title: "KPI STATISTICS(%)", cTitle: "See More"),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.80.w,
                    height: 180.h,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0.h,
                          right: 10.w,
                          child: StatCircle(
                            circleText: "84",
                            color: const Color.fromARGB(255, 245, 186, 110),
                            radius: 65.r,
                          ),
                        ),
                        Positioned(
                          top: 20.h,
                          left: 0.w,
                          child: StatCircle(
                            circleText: "63",
                            color: const Color.fromARGB(255, 219, 134, 109),
                            radius: 50.r,
                          ),
                        ),
                        Positioned(
                          right: 30.w,
                          top: 20.h,
                          child: StatCircle(
                            circleText: "0.49",
                            color: const Color.fromARGB(255, 149, 165, 254),
                            radius: 40.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatRow(
                        color: const Color.fromARGB(255, 245, 186, 110),
                        radius: 5.r,
                        rowText: "Gross Margin",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      StatRow(
                        color: const Color.fromARGB(255, 219, 134, 109),
                        radius: 5.r,
                        rowText: "CLR (Retention)",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      StatRow(
                        color: const Color.fromARGB(255, 149, 165, 254),
                        radius: 5.r,
                        rowText: "Churn Rate",
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              AnalyticsRow(title: "SALES REVENUE", cTitle: "Monthly"),
              SizedBox(
                height: 10.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BarColumn(height: 100.h, monthText: "Jan"),
                    BarColumn(height: 130.h, monthText: "Feb"),
                    BarColumn(
                      height: 160.h,
                      monthText: "Mar",
                      // color:
                    ),
                    BarColumn(height: 130.h, monthText: "Apr"),
                    BarColumn(height: 110.h, monthText: "May"),
                    BarColumn(height: 160.h, monthText: "Jun"),
                    BarColumn(height: 60.h, monthText: "Jul"),
                    BarColumn(height: 100.h, monthText: "Aug"),
                    BarColumn(height: 130.h, monthText: "Sep"),
                    BarColumn(height: 80.h, monthText: "Oct"),
                    BarColumn(height: 150.h, monthText: "Nov"),
                    BarColumn(height: 60.h, monthText: "Dec"),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RevenueRow(
                      rNum: "18k",
                      rTitle: "Monthly\nRevenue",
                    ),
                    const VerticalDivider(
                      color: Color.fromARGB(255, 74, 74, 74),
                      thickness: 0.4,
                    ),
                    RevenueRow(
                      rNum: "2%",
                      rTitle: "Revenue\nGrowth",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
