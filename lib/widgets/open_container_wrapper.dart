import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:my_widgets/screens/details_page.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper(
      {required this.closedBuilder,
      required this.transitionType,
      required this.onClosed,
      super.key});
  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const DetailsPage();
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
