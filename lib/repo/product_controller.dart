import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_widgets/repo/smartphone_repo.dart';

import '../constants/state_data.dart';
import '../constants/status.dart';
import '../model/product_id_model.dart';

// final getSmartphoneController = StateNotifierProvider((ref) =>
//     SmartphoneController(
//         GenericState<SmartphoneModel>.loading(SmartphoneModel())));
// StateProviderFamily((ref, int) => ProductController(
//     GenericState<ProductIdModel>.loading(ProductIdModel())
//     ));
final getProductIdController = StateNotifierProvider.autoDispose
    .family<ProductController, GenericState<ProductIdModel>, int>((ref, id) =>
        ProductController(
            GenericState<ProductIdModel>.loading(ProductIdModel()), id));

class ProductController extends StateNotifier<GenericState<ProductIdModel>> {
  int id;
  ProductController(super.state, this.id);

  getProductById() async {
    final response = await SmartphoneRepo().getProductById(id);
    if (response != null) {
      state = state.copyWith(status: Status.success, data: response);
    } else {
      state =
          state.copyWith(status: Status.error, errorMessage: "No data found");
    }
  }
}
