import 'package:flutter/material.dart';
import 'package:my_widgets/widgets/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eventChild;

  const MyTimelineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.eventChild,
      required this.isPast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(
            color:
                isPast ? Colors.deepPurpleAccent : Colors.deepPurple.shade200,
          ),
          indicatorStyle: IndicatorStyle(
              width: 25,
              color:
                  isPast ? Colors.deepPurpleAccent : Colors.deepPurple.shade200,
              iconStyle: IconStyle(
                  iconData: Icons.done,
                  color: isPast ? Colors.white : Colors.deepPurple.shade200)),
          endChild: EventCard(isPast: isPast, eventChild: eventChild)),
    );
  }
}
