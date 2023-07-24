import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_widgets/model/product_model.dart';
import 'package:my_widgets/repo/network_api.dart';
import 'package:my_widgets/screens/shimmer_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

//   var shimmerGradient = const LinearGradient(
//   colors: [
//     Color(0xFFEBEBF4),
//     Color(0xFFF4F4F4),
//     Color(0xFFEBEBF4),
//   ],
//   stops: [
//     0.1,
//     0.3,
//     0.4,
//   ],
//   begin: Alignment(-1.0, -0.3),
//   end: Alignment(1.0, 0.3),
//   tileMode: TileMode.clamp,
// );

  @override
  Widget build(BuildContext context) {
    ProductModel? productModel =
        Provider.of<NetworkApi>(context).getProductList as ProductModel?;
    log(productModel.toString(), name: "product model");
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        shrinkWrap: true,
        itemCount: productModel?.products?.length ?? 0,
        itemBuilder: (context, index) {
          return isLoading
              ? const ShimmerScreen()
              : ListTile(
                  leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        productModel?.products?[index].thumbnail ??
                            "https://www.peakpx.com/en/hd-wallpaper-desktop-knkqz",
                      )),
                  title: Text(
                    productModel?.products?[index].title ?? "N/a",
                  ),
                  subtitle: Text(
                    productModel?.products?[index].brand ?? "N/a",
                  ));
        },
      ),
    );
  }
}
