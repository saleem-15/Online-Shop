import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/utils/helpers.dart';
import 'package:my_shop/models/order_item.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

Future<List<OrderItem>> getAllOrdersService() async {
  try {
    final response = await dio.get(getAllUserOrders);
    //
    final data = response.data['Data'];
    // log(data.toString());

    return _converDataToOrders(data);
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
    return [];
  }
}

List<OrderItem> _converDataToOrders(List data) {
  List<OrderItem> orders = [];
  for (var orderData in data) {
    final orderItem = OrderItem.fromMap(orderData);
    orders.add(orderItem);
  }

  return orders;
}
