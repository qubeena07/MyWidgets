import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants.dart';
import '../model/product_id_model.dart';
import '../model/smartphone_model.dart';

class SmartphoneRepo {
  // Future<List<String>?>
  // DioClient dioClient = DioClient(baseUrl: baseUrl);
  Dio dioClient = Dio();

  fetchAllProduct() async {
    final response =
        await dioClient.get("$baseUrl/products/category/smartphones");
    // await dioClient.getRequest(path: '/products/category/smartphones');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (response.data != null) {
        final data = SmartphoneModel.fromJson(response.data);
        // jsonDecode(response.data);
        log(data.toString(), name: 'log value');
        return data;
      }
    }
    return null;
  }

  getProductById(int id) async {
    final productResponse = await dioClient.get("$baseUrl/products/$id");
    // final productResponse = await dioClient.getRequest(path: '/products/$id');

    if (productResponse.statusCode! >= 200 &&
        productResponse.statusCode! < 300) {
      if (productResponse.data != null) {
        final data = ProductIdModel.fromJson(productResponse.data);
        // jsonDecode(response.data);
        log(data.toString(), name: 'log value by product ids');
        return data;
      }
    }
    return null;
  }
}
