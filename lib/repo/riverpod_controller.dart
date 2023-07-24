import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../model/product_model.dart';

final getRiverpodProvider =
    StateNotifierProvider<RiverpodController, ProductModel?>((ref) {
  return RiverpodController();
});

class RiverpodController extends StateNotifier<ProductModel?> {
  RiverpodController() : super(null);

  Dio dioClient = Dio();
  getProducts() async {
    try {
      final response = await dioClient.get("$baseUrl/products");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null) {
          state = ProductModel.fromJson(response.data);
          // Products.fromJson(response.data['products']);

          // value.add(state!.products as Products);
          log(state.toString(), name: 'value riverpod');
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
