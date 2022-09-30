import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';

Future<void> setShippingAddressAsDefaultService(String addressId) async {
  try {
    await dio.post(
      SHIPPING_ADDRESS_PATH,
      queryParameters: {
        'address_id': addressId,
      },
    );
    //

    CustomSnackBar.showCustomSnackBar(
      message: 'The address was set As default'.tr,
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }
}
