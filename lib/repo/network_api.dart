import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/product_model.dart';

class NetworkApi extends ChangeNotifier {
  Dio dioClient = Dio();

  late final Object getProductList;
  Future<Object> getProduct() async {
    try {
      final response = await dioClient.get("$baseUrl/products");
      if (response.statusCode == 200) {
        getProductList = ProductModel.fromJson(response.data);
      }
    } catch (e) {
      log('Error while fetching profile: ${e.toString()}');
    }
    return getProductList;
  }

  // getProductList(BuildContext context) async {
  //   final response =
  //       await Provider.of<NetworkApi>(context, listen: false).getProduct();
  //   if (response is ProductModel) {
  //     return response;
  //   }
  // }
}
