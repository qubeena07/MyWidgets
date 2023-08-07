import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_widgets/widgets/am_pm_widget.dart';
import 'package:my_widgets/widgets/hours.dart';

import '../widgets/minutes.dart';

class ModernWheelScroll extends StatefulWidget {
  const ModernWheelScroll({super.key});

  @override
  State<ModernWheelScroll> createState() => _ModernWheelScrollState();
}

class _ModernWheelScrollState extends State<ModernWheelScroll> {
  late FixedExtentScrollController _controller;
  String min = "";
  String hour = "";
  String amPm = "";

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
        body: Column(
          children: [
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Icon(
                      Icons.arrow_right_rounded,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),
                  //for hours
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          setState(() {
                            hour = value.toString();
                            log(hour, name: "hour");
                          });
                        },
                        controller: _controller,
                        perspective: 0.005,
                        itemExtent: 50,
                        diameterRatio: 1.2,
                        childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 12,
                            builder: (context, index) {
                              return MyHours(
                                hours: index,
                              );
                            })),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  //for minutes
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          setState(() {
                            min = value.toString();
                            log(min, name: "min");
                          });
                        },
                        perspective: 0.005,
                        itemExtent: 50,
                        diameterRatio: 1.2,
                        childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: (context, index) {
                              return MyMinutes(
                                minutes: index,
                              );
                            })),
                  ),
                  const SizedBox(
                    width: 15,
                  ),

                  //for minutes
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          if (value == 0) {
                            setState(() {
                              amPm = "AM";
                            });
                          } else {
                            setState(() {
                              amPm = "PM";
                            });
                          }

                          log(amPm, name: "am pm");
                        },
                        perspective: 0.005,
                        itemExtent: 50,
                        diameterRatio: 1.2,
                        childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 2,
                            builder: (context, index) {
                              if (index == 0) {
                                return const AmPmWidget(isAm: true);
                              } else {
                                return const AmPmWidget(isAm: false);
                              }
                            })),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Text(
              "Selected Time -- $hour: $min $amPm",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ));
  }
}
