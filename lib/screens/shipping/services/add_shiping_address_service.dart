import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_shop/models/shipping_address.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';
import '../controllers/shipping_controller.dart';

Future<void> addNewShippingAddressService(String addressName, String address) async {
  try {
    final response = await dio.post(
      addShippingAddress,
      queryParameters: {
        'title': addressName,
        'address': address,
      },
    );
    //
    final id = response.data['Data']['id'];

    Get.find<ShippingController>().shippingAddresses.add(
          ShippingAddress(id: '$id', name: addressName, address: address),
        );
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
