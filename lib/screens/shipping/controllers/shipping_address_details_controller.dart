import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/add_shiping_address_service.dart';
import '../services/delete_address_service.dart';
import '../services/update_shiping_address_service.dart';

class ShippingAddressDetailsController extends GetxController {
  /// if the bottom sheet is used to Display a details for an Existing address
  /// then the value is (True)
  late bool isEditingMode;
  final RxBool isDefaultAddress = false.obs;
  late String addressId;
  final addressNameController = TextEditingController();
  final addressController = TextEditingController();

  String get address => addressController.text.trim();
  String get addressName => addressNameController.text.trim();

  //inial variables value (used to determine if the data is updated)
  late String initialAddressName;
  late String initialAddress;
  late bool initialIsDefault;
  //

  bool get isDataUpdated {
    if (initialAddressName == addressName &&
        initialAddress == address &&
        initialIsDefault == isDefaultAddress.value) {
      return false;
    }
    return true;
  }

  final formKey = GlobalKey<FormState>();

  void addNewAddress() {
    final isValidData = formKey.currentState!.validate();

    if (!isValidData) {
      return;
    }

    addNewShippingAddressService(addressName, address, isDefaultAddress.value);
  }

  void onCheckboxPressed(bool? value) {
    isDefaultAddress.toggle();
  }

  String? addressValidator(String? address) {
    if (address == null || address.isBlank! || address.isEmpty) {
      return 'required';
    }
    if (address.removeAllWhitespace.isNum) {
      return 'Enter a valid address';
    }
    return null;
  }

  String? addressNameValidator(String? addressName) {
    if (addressName == null || addressName.isEmpty) {
      return 'required';
    }
    return null;
  }

  /// on (add/update) button pressed
  Future<void> onButtonPressed() async {
    // remove the bottom sheet first
    Get.back();
    if (!isEditingMode) {
      addNewAddress();
      return;
    }

    if (isDataUpdated) {
      log('data is changed');
      await updateShippingAddressService(addressId, addressName, address, isDefaultAddress.value);
    }
  }

  Future<void> onDeleteButtonPressed() async {
    Navigator.pop(Get.context!);
    // if (Get.isBottomSheetOpen!) {
    //   Get.back();
    // }
    await deleteShippingAddressService(addressId);
  }

  ///call this method when the bottom sheet is closed (to reset its controller data)
  void resetController() {
    addressController.clear();
    addressNameController.clear();
    isDefaultAddress(false);
  }
}
