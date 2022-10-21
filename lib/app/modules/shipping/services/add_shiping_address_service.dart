import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../controllers/shipping_controller.dart';

Future<void> addNewShippingAddressService(String addressName, String address, bool isDefault) async {
  try {
    await dio.post(
      SHIPPING_ADDRESS_PATH,
      queryParameters: {
        'title': addressName,
        'address': address,
        'default': isDefault ? 1 : 0,
      },
    );
    //
    // final id = response.data['Data']['id'];
    Get.find<ShippingAddressController>().updateAddressesList();
    // Get.find<ShippingController>().shippingAddresses.add(
    //       ShippingAddress(id: '$id', name: addressName, address: address,isDefaultAddress: isDefault),
    //     );
    CustomSnackBar.showCustomSnackBar(
      message: 'The address was added successfully'.tr,
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }
}
