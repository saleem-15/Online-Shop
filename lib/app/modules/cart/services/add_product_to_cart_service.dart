import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';

Future<void> addProductToCartService(
    String productId, String colorId, String? sizeId, int quantity) async {
  try {
    final response = await dio.post(
      CART_PATH,
      queryParameters: {
        'product_id': productId,
        'color_id': colorId,
        if (sizeId != null) 'size_id': sizeId,
        'quantity': quantity,
      },
    );
    //
    final data = response.data['Data'];
    log(data.toString());

    CustomSnackBar.showCustomSnackBar(
        message: 'The products was added to the cart');
  } on DioError catch (e) {
    log(e.response.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: formatErrorMsg(e.response!.data),
    );
  }
}
