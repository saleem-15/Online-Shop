import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../controllers/shipping_controller.dart';

/// returns true if the address was deleted from back-end
Future<bool> deleteShippingAddressService(String addressId) async {
  try {
    await dio.delete(
      '$SHIPPING_ADDRESS_PATH/$addressId',
    );

    //remove the address from my local cashe
    Get.find<ShippingAddressController>().shippingAddresses.removeWhere((address) => address.id == addressId);

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
