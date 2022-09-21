import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';
import '../controllers/shipping_controller.dart';

Future<void> updateShippingAddressService(
    String addressId, String addressName, String address, bool isDefault) async {
  try {
    await dio.put(
      '$updateShippingAddress/$addressId',
      queryParameters: {
        'title': addressName,
        'address': address,
        'default': isDefault ? 1 : 0,
      },
    );
    //

    // updateDataLocally(addressId, addressName, address, isDefault);
    Get.find<ShippingController>().updateAddressesList();

    CustomSnackBar.showCustomSnackBar(
      message: 'The address was updated successfully',
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data['Messages']),
    );
  }
}

// void updateDataLocally(String addressId, String addressName, String address, bool isDefault) {
//   final controller = Get.find<ShippingController>();
//   //remove the old address object
//   controller.shippingAddresses.removeWhere((address) => address.id == addressId);

  

//   //add the updated address
//   controller.shippingAddresses.add(
//     ShippingAddress(id: addressId, address: address, name: addressName, isDefaultAddress: isDefault),
//   );
// }
