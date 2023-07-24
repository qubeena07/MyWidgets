import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_widgets/constants/extension.dart';

import '../constants/colors.dart';
import '../constants/icons_path.dart';
import '../widgets/app_header.dart';
import '../widgets/get_greeting.dart';

class AegisWidget extends StatefulWidget {
  const AegisWidget({super.key});

  @override
  State<AegisWidget> createState() => _AegisWidgetState();
}

class _AegisWidgetState extends State<AegisWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                AppHeader(
                  text: GetGreeting().getGreeting(),
                  userName: "Dipika Ranabhat",
                  notificationOntap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SummaryCard(
                      assetIcon: AssetIcons.notificationIcon,
                      serviceNumber: "1900",
                      serviceTitle: "Room Service",
                      containerColor: const Color.fromARGB(255, 189, 235, 191),
                      iconColor: Colors.green,
                    ),
                    SummaryCard(
                      assetIcon: AssetIcons.checkOutIcon,
                      serviceNumber: "23",
                      serviceTitle: "Cover",
                      containerColor: const Color.fromARGB(255, 240, 208, 161),
                      iconColor: Colors.orange,
                    ),
                    SummaryCard(
                      assetIcon: AssetIcons.editIcon,
                      serviceNumber: "1900",
                      serviceTitle: "Departure",
                      containerColor: const Color.fromARGB(255, 183, 222, 254),
                      iconColor: Colors.blue,
                    ),
                    SummaryCard(
                      assetIcon: AssetIcons.notificationIcon,
                      serviceNumber: "1900",
                      serviceTitle: "chat",
                      containerColor: const Color.fromARGB(255, 189, 235, 191),
                      iconColor: Colors.green,
                    ),
                  ],
                ),
                Wrap(
                  runAlignment: WrapAlignment.start,
                  // crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    IndicatorCard(
                        iconBackgroundColor: greenColor,
                        icon: Icons.airplane_ticket,
                        title: "Kathmandu Outlet",
                        subTitle: "High Performing Outlet"),
                    const SizedBox(
                      width: 16,
                    ),
                    IndicatorCard(
                        iconBackgroundColor: orangeColor,
                        icon: Icons.low_priority_sharp,
                        title: "Pokhara Outlet",
                        subTitle: "Low Performing Outlet"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                PropertyCard(
                  title: "Property 1",
                ),
                const SizedBox(
                  height: 16,
                ),
                PropertyCard(title: 'Property 2'),
                // ChartsCard(
                //     textColor: greenColor,
                //     iconText: AssetIcons.walkingManIcon,
                //     amount: "10000000000000",
                //     title: 'Total income')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  String assetIcon;
  Color? iconColor;
  String serviceNumber;
  String serviceTitle;
  Color? containerColor;

  SummaryCard(
      {super.key,
      required this.assetIcon,
      this.iconColor,
      required this.serviceNumber,
      this.containerColor,
      required this.serviceTitle});

  @override
  Widget build(BuildContext context) {
    // var size = context;
    return Container(
      // height: 190,
      width: context.width * 0.27,
      decoration: BoxDecoration(
          color: containerColor ?? whiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 13,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  assetIcon,
                )
                //  Icon(
                //   icon,
                //   size: 13,
                //   color: iconColor,
                // ),
                ),
            const SizedBox(
              height: 9,
            ),
            Text(
              serviceNumber,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: iconColor),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              serviceTitle,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: subtitleColor),
            ),
          ],
        ),
      ),
    );
  }
}

class IndicatorCard extends StatelessWidget {
  Color iconBackgroundColor;
  IconData icon;
  String title;
  String subTitle;
  // Color?

  IndicatorCard(
      {super.key,
      required this.iconBackgroundColor,
      required this.icon,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.43,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 13,
              backgroundColor: iconBackgroundColor,
              child: Icon(
                icon,
                size: 13,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: iconBackgroundColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: subtitleColor),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  String title;
  VoidCallback? editOnTap;
  VoidCallback? deleteOnTap;

  PropertyCard(
      {super.key, required this.title, this.deleteOnTap, this.editOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: propertyCardColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetIcons.propertyHouseIcon,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: propertyTextColor),
            ),
            const Spacer(),
            // GestureDetector(
            //     onTap: () {},
            //     child:
            PopupMenuButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              icon: SvgPicture.asset(AssetIcons.settingsIcon),
              itemBuilder: (ctx) => [
                PopupMenuItem(
                    onTap: editOnTap,
                    child: Row(
                      children: [
                        SvgPicture.asset(AssetIcons.editIcon),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Edit",
                          style: TextStyle(
                              color: propertyTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
                PopupMenuItem(
                    onTap: deleteOnTap,
                    child: Row(
                      children: [
                        SvgPicture.asset(AssetIcons.deleteIcon),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Delete",
                          style: TextStyle(
                              color: redTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
              ],
            )
            // SvgPicture.asset(
            //   AssetIcons.settingsIcon,
            // )
            // ),
          ],
        ),
      ),
    );
  }
}
