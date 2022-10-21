import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';

///returns true if successeded
Future<bool> checkoutService(
    String shippingAddressId, String shippingTypeId) async {
  try {
    await dio.post(
      CHECKOUT_PATH,
      queryParameters: {
        'address_id': shippingAddressId,
        'shippingType_id': shippingTypeId,
      },
    );
    CustomSnackBar.showCustomSnackBar(
        message: 'The order was purshased successfully'.tr);
    return true;
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
        message: formatErrorMsg(e.response!.data));
    return false;
  }
}
