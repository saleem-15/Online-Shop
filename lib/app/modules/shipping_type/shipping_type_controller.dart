import 'dart:developer';

import 'package:get/get.dart';

import '../../models/shipping_type.dart';
import '../../modules/checkout/checkout_controller.dart';
import 'services/get_all_shiping_types_service.dart';

// ignore_for_file: unnecessary_cast

class ShippingTypeController extends GetxController {
  RxBool isLoading = true.obs;

  int? _selectedShippingTypeIndex;
  int? get selectedShippingTypeIndex => _selectedShippingTypeIndex;

  ShippingType? get selectedshippingType => selectedShippingTypeIndex == null
      ? null
      : shippingTypes[selectedShippingTypeIndex!];

  final RxList<ShippingType> shippingTypes = <ShippingType>[].obs;

  @override
  void onReady() async {
    await loadShippingTypes();

    selectInitialShippingType();
    super.onReady();
  }

  setSelectedShippingTypeIndex(int myIndex) {
    log('selected type index: $myIndex');
    _selectedShippingTypeIndex = myIndex;

    Get.find<CheckoutController>().setShippingType(selectedshippingType);

    // shippingAddresses[myIndex];

    update(['selected_shipping_type_listener']);
  }

  Future<void> onShippingTypeTilePressed(int myIndex) async {
    setSelectedShippingTypeIndex(myIndex);
  }

  void onApplyButtonPressed() {
    Get.back();
  }

  void selectInitialShippingType() {
    if (shippingTypes.isEmpty) {
      return;
    }
    setSelectedShippingTypeIndex(0);
  }

  /// loads shipping types from back-end
  Future<void> loadShippingTypes() async {
    isLoading(true);
    final loadded = await getAllShippingTypesService();
    shippingTypes.clear();
    shippingTypes.addAll(loadded);
    isLoading(false);
  }
}
