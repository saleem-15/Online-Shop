import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';

Future<void> setShippingAddressAsDefaultService(String addressId) async {
  try {
    final response = await dio.post(
      setShippingAddressAsDefault,
      queryParameters: {
        'address_id': addressId,
      },
    );
    //

    CustomSnackBar.showCustomSnackBar(
      message: 'The address was set As default',
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data['Messages']),
    );
  }
}
