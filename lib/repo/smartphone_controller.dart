import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_widgets/repo/smartphone_repo.dart';

import '../constants/state_data.dart';
import '../constants/status.dart';
import '../model/smartphone_model.dart';

final getSmartphoneController = StateNotifierProvider((ref) =>
    SmartphoneController(
        GenericState<SmartphoneModel>.loading(SmartphoneModel())));

class SmartphoneController
    extends StateNotifier<GenericState<SmartphoneModel>> {
  SmartphoneController(super.state);

  getSmartphone() async {
    final response = await SmartphoneRepo().fetchAllProduct();
    if (response != null) {
      state = state.copyWith(status: Status.success, data: response);
    } else {
      state =
          state.copyWith(status: Status.error, errorMessage: "No data found");
    }
  }
}
