import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/utils/helpers.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

Future<void> addOrderService(String productId,String addressId, String colorId, String? sizeId, int quantity) async {
  try {
    final response = await dio.post(
      addProductToCart,
      queryParameters: {
        'product_id': productId,
        'address_id':addressId,
        'color_id': colorId,
        if (sizeId != null) 'size_id': sizeId,
        'quantity': quantity,
      },
    );
    //
    final data = response.data['Data'];
    log(data.toString());

    CustomSnackBar.showCustomSnackBar(message: 'The order was added successfully');
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }
}
