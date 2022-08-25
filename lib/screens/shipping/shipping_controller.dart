import 'package:get/get.dart';
import 'package:my_shop/screens/checkout/checkout_controller.dart';

import '../../models/shipping_address.dart';

class ShippingController extends GetxController {
  final Rx<int> _selectedAddressIndex = 0.obs;
  Rx<int> get selectedAddressIndex => _selectedAddressIndex;

  List<ShippingAddress> shippingAddresses = [
    ShippingAddress(name: 'Home', address: '61480 Sunbrook Park, PC 5679'),
    ShippingAddress(name: 'Office', address: '81235 Clyde Calghar, PC 3637'),
    ShippingAddress(name: 'Appartement', address: '51980 Blue Bill Park, PC 75262'),
  ];

  void addNewAddress() {}

  setSelectedAddressIndex(int myIndex) {
    _selectedAddressIndex.value = myIndex;

    Get.find<CheckoutController>().shippingAddress.value = shippingAddresses[myIndex];
  }
}
