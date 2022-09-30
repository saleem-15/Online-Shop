import 'package:my_shop/app_components/utils/helpers.dart';

import '../../../models/cart_item.dart';

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

/// returnes true if its updated successfully
Future<bool> editCartItemService(String itemId, String? colorId, String? sizeId, int? quantity) async {
  try {
    await dio.put(
      '$CART_PATH/$itemId',
      queryParameters: {
        if (colorId != null) 'color_id': colorId,
        if (sizeId != null) 'size_id': sizeId,
        if (quantity != null) 'quantity': quantity,
      },
    );

    return true;
  } on DioError catch (e) {
    log(e.response.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: formatErrorMsg(e.response!.data),
    );
    return false;
  }
}

///returns true if its updated successfully
Future<bool> decreaseQuantityByOneService(CartItem cartItem) async {
  return await editCartItemService(cartItem.id, null, null, cartItem.quantity - 1);
}

///returns true if its updated successfully
Future<bool> increaseQuantityByOneService(CartItem cartItem) async {
  return await editCartItemService(cartItem.id, null, null, cartItem.quantity + 1);
}
