import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget eventChild;
  const EventCard({super.key, required this.isPast, required this.eventChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: isPast
              ? Colors.deepPurpleAccent[200]
              : Colors.deepPurpleAccent[100],
          borderRadius: BorderRadius.circular(8)),
      child: eventChild,
    );
  }
}
