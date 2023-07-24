import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_widgets/model/product_model.dart';
import 'package:my_widgets/repo/riverpod_controller.dart';

class RiverpodScreen extends ConsumerStatefulWidget {
  const RiverpodScreen({super.key});

  @override
  ConsumerState<RiverpodScreen> createState() => _RiverpodScreenState();
}

class _RiverpodScreenState extends ConsumerState<RiverpodScreen> {
  ProductModel? response;

  @override
  void initState() {
    super.initState();
    // response = ref.read(getRiverpodProvider.notifier).getProducts();
    // response = ref.read(getRiverpodProvider.notifier).state;
    // log(response.toString(), name: "hello");
    // log(response!. products.toString(), name: "products list");
    getProduct();
  }

  getProduct() async {
    await ref.read(getRiverpodProvider.notifier).getProducts();
    // log(response.toString(), name: "log value");
    // log(response.toString(), name: "log value");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      response = ref.watch(getRiverpodProvider.notifier).state;
      if (response != null) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context, ref, _) {
      return response?.products != null
          ? ListView.builder(
              itemCount: response?.products?.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(response!.products![index].title.toString()));
              })
          : const Center(child: CircularProgressIndicator());
    }));
  }
}
