import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_widgets/constants/colors.dart';
import 'package:my_widgets/constants/icons_path.dart';

class AppHeader extends StatelessWidget {
  const AppHeader(
      {super.key,
      required this.text,
      required this.userName,
      this.notificationOntap});

  final String? text;
  final String? userName;
  final VoidCallback? notificationOntap;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Row(
        children: [
          const CircleAvatar(
              radius: 20, backgroundImage: AssetImage("assets/beach.jpeg")),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text ?? "Good morning",
                style: const TextStyle(fontSize: 12, color: greyTextColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                userName ?? "User Name",
                style: const TextStyle(
                    fontSize: 16,
                    color: darkTextColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
              onTap: notificationOntap,
              child: CircleAvatar(
                  backgroundColor: whiteColor,
                  child: SvgPicture.asset(AssetIcons.notificationIcon)))
        ],
      ),
    ));
  }
}
