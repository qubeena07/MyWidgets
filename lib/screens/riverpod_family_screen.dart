import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_widgets/constants/state_data.dart';
import 'package:my_widgets/constants/status.dart';
import 'package:my_widgets/model/product_id_model.dart';
import 'package:my_widgets/repo/product_controller.dart';

class RiverpodFamilyScreen extends ConsumerStatefulWidget {
  const RiverpodFamilyScreen({super.key});

  @override
  ConsumerState<RiverpodFamilyScreen> createState() =>
      _RiverpodFamilyScreenState();
}

class _RiverpodFamilyScreenState extends ConsumerState<RiverpodFamilyScreen> {
  @override
  void initState() {
    ref.read(getProductIdController(9).notifier).getProductById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GenericState<ProductIdModel> state = ref.watch(getProductIdController(9));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod family"),
      ),
      body: Builder(builder: (context) {
        final status = state.status;
        switch (status) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.success:
            return ListTile(
              title: Text(state.data.title!),
              subtitle: Text(state.data.price.toString()),
              leading: Text(state.data.rating.toString()),
            );

          // ListTile(
          //   title: Text(state.data[index].),
          // );

          case Status.error:
            return Center(
              child: Text(state.errorMessage),
            );
        }
      }),
    );
  }
}
