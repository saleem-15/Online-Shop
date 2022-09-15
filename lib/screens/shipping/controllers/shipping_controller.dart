import 'package:get/get.dart';
import 'package:my_shop/screens/checkout/checkout_controller.dart';
import 'package:my_shop/screens/shipping/controllers/add_new_shipping_address_controller.dart';

import '../../../models/shipping_address.dart';
import '../components/add_new_address_bottom_sheet.dart';
import '../services/get_all_shiping_address_service.dart';

class ShippingController extends GetxController {
  late bool isEditingMode;
  final Rx<int> _selectedAddressIndex = 0.obs;
  Rx<int> get selectedAddressIndex => _selectedAddressIndex;

  final RxList<ShippingAddress> shippingAddresses = <ShippingAddress>[].obs;

  @override
  void onReady() async {
    shippingAddresses.addAll(await getAllShippingAddressService());

    // ! TODO this line is for testing purposes it should be deleted
    shippingAddresses.first.isDefaultAddress = true;

    super.onReady();
  }

  setSelectedAddressIndex(int myIndex) {
    _selectedAddressIndex.value = myIndex;

    Get.find<CheckoutController>().shippingAddress.value = shippingAddresses[myIndex];
  }

  void onAddNewAddressPressed() {
    Get.find<ShippingAddressDetailsController>().isEditingMode = false;
    Get.bottomSheet(const ShippingAddressDetailsSheet());
  }

  void onAddressTilePressed(int myIndex) {
    if (!isEditingMode) {
      setSelectedAddressIndex(myIndex);
      return;
    }
    Get.find<ShippingAddressDetailsController>()
      ..isEditingMode = true
      ..addressNameController.text = shippingAddresses[myIndex].name
      ..addressController.text = shippingAddresses[myIndex].address
      ..isDefaultAddress.value = shippingAddresses[myIndex].isDefaultAddress;

    Get.bottomSheet(const ShippingAddressDetailsSheet());
  }
}
