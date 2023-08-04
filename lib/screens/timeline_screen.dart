import 'package:flutter/material.dart';
import 'package:my_widgets/widgets/timeline_tile.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: ListView(
          children: const [
            MyTimelineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              eventChild: Text("ORDER FIXED"),
            ),
            MyTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventChild: Text("ORDER PLACED"),
            ),
            MyTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventChild: Text("ORDER SHIPPED"),
            ),
            MyTimelineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              eventChild: Text("ORDER DELIVERED"),
            ),
          ],
        ),
      ),
    );
  }
}
