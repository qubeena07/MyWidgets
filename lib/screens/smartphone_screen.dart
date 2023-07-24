import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_widgets/constants/state_data.dart';
import 'package:my_widgets/constants/status.dart';
import 'package:my_widgets/model/smartphone_model.dart';
import 'package:my_widgets/repo/smartphone_controller.dart';

class SmartphoneScreen extends ConsumerStatefulWidget {
  const SmartphoneScreen({super.key});

  @override
  ConsumerState<SmartphoneScreen> createState() => _SmartphoneScreenState();
}

class _SmartphoneScreenState extends ConsumerState<SmartphoneScreen> {
  @override
  void initState() {
    ref.read(getSmartphoneController.notifier).getSmartphone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state =
        (ref.watch(getSmartphoneController) as GenericState<SmartphoneModel>);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod 2'),
      ),
      body: Builder(builder: (context) {
        final status = state.status;
        switch (status) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.success:
            return ListView.builder(
                itemCount: state.data.products!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(state.data.products![index].title!));

                  // ListTile(
                  //   title: Text(state.data[index].),
                  // );
                });
          case Status.error:
            return Center(
              child: Text(state.errorMessage),
            );
        }
      }),
    );
  }
}
