// ignore_for_file: unnecessary_cast

import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_shop/screens/checkout/checkout_controller.dart';
import 'package:my_shop/screens/shipping/controllers/shipping_address_details_controller.dart';

import '../../../models/shipping_address.dart';
import '../components/add_new_address_bottom_sheet.dart';
import '../services/get_all_shiping_address_service.dart';

class ShippingController extends GetxController {
  /// if the to user is choosing  an Existing address then the value is (false)
  late bool isEditingMode;
  RxBool isLoading = true.obs;

  //
  int? _selectedAddressIndex;
  int? get selectedAddressIndex => _selectedAddressIndex;
  //

  ShippingAddress? get selectedAddress =>
      selectedAddressIndex == null ? null : shippingAddresses[selectedAddressIndex!];

  final RxList<ShippingAddress> shippingAddresses = <ShippingAddress>[].obs;

  void updateAddressesList() async {
    shippingAddresses.replaceRange(0, shippingAddresses.length, await getAllShippingAddressService());
  }

  @override
  void onReady() async {
    await loadAddresses();

    selectInitialAddress();
    super.onReady();
  }

  setSelectedAddressIndex(int myIndex) {
    log('selected address index: $myIndex');
    _selectedAddressIndex = myIndex;

    Get.find<CheckoutController>().shippingAddress = selectedAddress;
    // shippingAddresses[myIndex];

    update(['selected_address_listener']);
  }

  Future<void> onAddNewAddressPressed() async {
    Get.find<ShippingAddressDetailsController>().isEditingMode = false;
    await Get.bottomSheet(const ShippingAddressDetailsSheet());
    Get.find<ShippingAddressDetailsController>().resetController();
  }

  Future<void> onAddressTilePressed(int myIndex) async {
    if (!isEditingMode) {
      setSelectedAddressIndex(myIndex);
      return;
    }
    Get.find<ShippingAddressDetailsController>()
      ..isEditingMode = true
      ..addressId = shippingAddresses[myIndex].id
      ..addressNameController.text = shippingAddresses[myIndex].name
      ..initialAddressName = shippingAddresses[myIndex].name
      ..addressController.text = shippingAddresses[myIndex].address
      ..initialAddress = shippingAddresses[myIndex].address
      ..isDefaultAddress.value = shippingAddresses[myIndex].isDefaultAddress
      ..initialIsDefault = shippingAddresses[myIndex].isDefaultAddress;

    await Get.bottomSheet(const ShippingAddressDetailsSheet());
    Get.find<ShippingAddressDetailsController>().resetController();

    /// deleting the controller Manually
    /// because I am using a bottom sheet and Getx doesn't remove controllers
    ///  if they are connected to a bottom sheet
    // Get.delete<ShippingAddressDetailsController>();
  }

  /// this button should appear only when choosing an address
  void onApplyButtonPressed() {
    Get.back();
  }

  void selectInitialAddress() {
    if (shippingAddresses.isEmpty) {
      return;
    }

    // if there isn't a defualt address then it will return -1
    final defaultAddressIndex = shippingAddresses.indexWhere((address) => address.isDefaultAddress);

    if (defaultAddressIndex == -1) {
      setSelectedAddressIndex(0);
    } else {
      setSelectedAddressIndex(defaultAddressIndex);
    }
  }

  /// loads addresses from back-end
  Future<void> loadAddresses() async {
    isLoading(true);
    final loaddedAddresses = await getAllShippingAddressService();
    shippingAddresses.clear();
    shippingAddresses.addAll(loaddedAddresses);
    isLoading(false);
  }

  Future<void> onRefresh() async {
    await loadAddresses();
  }
}
