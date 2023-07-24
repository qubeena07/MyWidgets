import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_widgets/constants/colors.dart';

class ChartsCard extends StatelessWidget {
  Color textColor;
  String iconText;
  String title;
  String amount;
  String graphIcon;
  String graphTitle;

  ChartsCard(
      {super.key,
      required this.textColor,
      required this.iconText,
      required this.graphTitle,
      required this.amount,
      required this.graphIcon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: textColor,
              child: SvgPicture.asset(iconText),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Rs. $amount",
              style: TextStyle(
                  fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 115,
              width: 150,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  graphIcon,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  graphTitle,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: subtitleColor),
            ),
          ],
        ),
      ),
    );
  }
}
