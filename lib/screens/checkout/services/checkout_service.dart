import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';
import 'package:my_shop/app_components/utils/helpers.dart';

import '../../../app_components/constants/api.dart';

Future<void> checkoutService(String shippingAddressId) async {
  log('address id: $shippingAddressId');
  try {
    final response = await dio.post(
      checkout,
      queryParameters: {
        'address_id': shippingAddressId,
      },
    );

    log('${response.data['Data']}');
  } on DioError catch (e) {
    CustomSnackBar.showCustomErrorSnackBar(message: formatErrorMsg(e.response!.data));
  }
}
