import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/add_shiping_address_service.dart';

class ShippingAddressDetailsController extends GetxController {
  late bool isEditingMode;
  RxBool isDefaultAddress = false.obs;

  final addressNameController = TextEditingController();
  final addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addNewAddress() {
    final isValidData = formKey.currentState!.validate();

    if (!isValidData) {
      return;
    }

    final address = addressController.text.trim();
    final addressName = addressNameController.text.trim();

    addNewShippingAddressService(addressName, address);
    Get.back();
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
}
