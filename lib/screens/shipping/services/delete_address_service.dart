import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';
import '../controllers/shipping_controller.dart';

/// returns true if the address was deleted from back-end
Future<bool> deleteShippingAddressService(String addressId) async {
  try {
    await dio.delete(
      '$SHIPPING_ADDRESS_PATH/$addressId',
    );

    //remove the address from my local cashe
    Get.find<ShippingController>().shippingAddresses.removeWhere((address) => address.id == addressId);

    CustomSnackBar.showCustomSnackBar(
      message: 'The address was deleted'.tr,
    );

    return true;
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
    return false;
  }
}
