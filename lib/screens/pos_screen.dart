import 'package:flutter/material.dart';
import 'package:my_widgets/constants/colors.dart';
import 'package:my_widgets/constants/extension.dart';
import 'package:my_widgets/constants/icons_path.dart';
import 'package:my_widgets/screens/aegis_widget.dart';
import 'package:my_widgets/widgets/app_header.dart';
import 'package:my_widgets/widgets/get_greeting.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> with TickerProviderStateMixin {
  late TabController _controller;
  late TabController _controller1;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    _controller1 = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                  text: GetGreeting().getGreeting(), userName: 'Hancy Kumar'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sales",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                // height: 30,
                width: context.width * 0.60,
                child: CustomTabBar(
                  controller: _controller,
                  tabText1: "Menu Type",
                  tabText2: "Menu Group",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 150,
                child: TabBarView(controller: _controller, children: [
                  Container(
                    // height: 50,
                    color: Colors.red,
                  ),
                  Container(
                    // height: 50,
                    color: Colors.green,
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                // height: 30,
                // width: context.width * 0.60,
                child: CustomTabBar(
                  controller: _controller1,
                  tabText1: "Yesterday's summary",
                  tabText2: "Today's summary",
                ),
              ),
              SizedBox(
                height: context.height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TabBarView(controller: _controller1, children: [
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SummaryCard(
                          assetIcon: AssetIcons.notificationIcon,
                          serviceNumber: "1900",
                          serviceTitle: "Room Service",
                          containerColor:
                              const Color.fromARGB(255, 189, 235, 191),
                          iconColor: Colors.green,
                        ),
                        SummaryCard(
                          assetIcon: AssetIcons.editIcon,
                          serviceNumber: "23",
                          serviceTitle: "Cover",
                          containerColor:
                              const Color.fromARGB(255, 240, 208, 161),
                          iconColor: Colors.orange,
                        ),
                        SummaryCard(
                          assetIcon: AssetIcons.editIcon,
                          serviceNumber: "1900",
                          serviceTitle: "Departure",
                          containerColor:
                              const Color.fromARGB(255, 183, 222, 254),
                          iconColor: Colors.blue,
                        ),
                        SummaryCard(
                          assetIcon: AssetIcons.notificationIcon,
                          serviceNumber: "1900",
                          serviceTitle: "Room Service",
                          containerColor:
                              const Color.fromARGB(255, 189, 235, 191),
                          iconColor: Colors.green,
                        ),
                        SummaryCard(
                          assetIcon: AssetIcons.editIcon,
                          serviceNumber: "23",
                          serviceTitle: "Cover",
                          containerColor:
                              const Color.fromARGB(255, 240, 208, 161),
                          iconColor: Colors.orange,
                        ),
                        SummaryCard(
                          assetIcon: AssetIcons.editIcon,
                          serviceNumber: "1900",
                          serviceTitle: "Departure",
                          containerColor:
                              const Color.fromARGB(255, 183, 222, 254),
                          iconColor: Colors.blue,
                        ),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            IndicatorCard(
                                iconBackgroundColor: greenColor,
                                icon: Icons.arrow_upward,
                                title: 'Kathmandu Outlet',
                                subTitle: 'High Performing Outlets'),
                            IndicatorCard(
                                iconBackgroundColor: orangeColor,
                                icon: Icons.arrow_upward,
                                title: 'Pokhara Outlet',
                                subTitle: 'Low Performing Outlets'),
                          ],
                        )
                      ],
                    ),
                    Container(
                      // height: 50,
                      color: Colors.green,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTabBar extends StatelessWidget {
  CustomTabBar(
      {super.key,
      required TabController controller,
      required this.tabText1,
      required this.tabText2})
      : _controller = controller;

  final TabController _controller;
  String tabText1;
  String tabText2;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: primaryColor,
        indicatorColor: primaryColor,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelColor: tabBarTextColor,
        unselectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        controller: _controller,
        tabs: [
          Tab(
            text: tabText1,
          ),
          Tab(
            text: tabText2,
          ),
        ]);
  }
}
