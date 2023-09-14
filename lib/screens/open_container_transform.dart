import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../widgets/inkwell_overlay.dart';
import '../widgets/open_container_wrapper.dart';
import '../widgets/smaller_card.dart';

class OpenContainerTransform extends StatefulWidget {
  const OpenContainerTransform({super.key});

  @override
  State<OpenContainerTransform> createState() => _OpenContainerTransformState();
}

class _OpenContainerTransformState extends State<OpenContainerTransform> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {
    if (isMarkedAsDone ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Marked as done!'),
      ));
    }
  }

  void _showSettingsBottomModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 125,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fade mode',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(2.0),
                    selectedBorderColor: Theme.of(context).colorScheme.primary,
                    onPressed: (int index) {
                      setModalState(() {
                        setState(() {
                          _transitionType = index == 0
                              ? ContainerTransitionType.fade
                              : ContainerTransitionType.fadeThrough;
                        });
                      });
                    },
                    isSelected: <bool>[
                      _transitionType == ContainerTransitionType.fade,
                      _transitionType == ContainerTransitionType.fadeThrough,
                    ],
                    children: const <Widget>[
                      Text('FADE'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('FADE THROUGH'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container Transform"),
        actions: [
          IconButton(
              onPressed: () {
                _showSettingsBottomModalSheet(context);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          OpenContainerWrapper(
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return _ExampleCard(openContainer: openContainer);
              },
              transitionType: _transitionType,
              onClosed: _showMarkedAsDoneSnackbar),
          const SizedBox(width: 8.0),
          OpenContainerWrapper(
            transitionType: _transitionType,
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return SmallerCard(
                openContainer: openContainer,
                subtitle: 'Secondary',
              );
            },
            onClosed: _showMarkedAsDoneSnackbar,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Expanded(
                child: OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (BuildContext _, VoidCallback openContainer) {
                    return SmallerCard(
                      openContainer: openContainer,
                      subtitle: 'Secondary text',
                    );
                  },
                  onClosed: _showMarkedAsDoneSnackbar,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (BuildContext _, VoidCallback openContainer) {
                    return SmallerCard(
                      openContainer: openContainer,
                      subtitle: 'Secondary text',
                    );
                  },
                  onClosed: _showMarkedAsDoneSnackbar,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return InkWellOverlayWidget(
      openContainer: openContainer,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Image.asset(
                  'assets/beach.jpeg',
                  width: 100,
                ),
              ),
            ),
          ),
          const ListTile(
            title: Text('Title'),
            subtitle: Text('Secondary text'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
