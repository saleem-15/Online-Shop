import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../controllers/shipping_controller.dart';

Future<void> updateShippingAddressService(
    String addressId, String addressName, String address, bool isDefault) async {
  try {
    await dio.put(
      '$SHIPPING_ADDRESS_PATH/$addressId',
      queryParameters: {
        'title': addressName,
        'address': address,
        'default': isDefault ? 1 : 0,
      },
    );
    // updateDataLocally(addressId, addressName, address, isDefault);
    Get.find<ShippingAddressController>().updateAddressesList();

    CustomSnackBar.showCustomSnackBar(
      message: 'The address was updated successfully',
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }
}
