import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_shop/models/shipping_address.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';
import '../controllers/shipping_controller.dart';

Future<void> addNewShippingAddressService(String addressName, String address, bool isDefault) async {
  try {
    final response = await dio.post(
      addShippingAddress,
      queryParameters: {
        'title': addressName,
        'address': address,
        'default': isDefault ? 1 : 0,
      },
    );
    //
    // final id = response.data['Data']['id'];
    Get.find<ShippingController>().updateAddressesList();
    // Get.find<ShippingController>().shippingAddresses.add(
    //       ShippingAddress(id: '$id', name: addressName, address: address,isDefaultAddress: isDefault),
    //     );
    CustomSnackBar.showCustomSnackBar(
      message: 'The address was added successfully',
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data['Messages']),
    );
  }
}
