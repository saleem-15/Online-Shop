import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../../../models/cart_item.dart';

Future<List<CartItem>> getAllCartItemsService() async {
  try {
    final response = await dio.get(CART_PATH);
    //
    final data = response.data['Data'];
    log('cart items: $data');

    return _convertDataToCartItems(data as List);
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }

  return [];
}

List<CartItem> _convertDataToCartItems(List cartItemsData) {
  final List<CartItem> cartItemsList = [];

  for (var e in cartItemsData) {
    cartItemsList.add(CartItem.fromMap(e));
  }

  return cartItemsList;
}
