import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_shop/app_components/utils/helpers.dart';
import 'package:my_shop/models/order_item.dart';
import 'package:my_shop/screens/orders/controllers/completed_orders_controller.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

Future<List<OrderItem>> fetchCompletedOrdersService(int pageNum) async {
  try {
    final response = await dio.get(
      COMPLETED_ORDERS_PATH,
      queryParameters: {'page': pageNum},
    );

    log('complete orders respones: ${response.data.toString()}');
    final data = response.data['data'];
    final metaData = response.data['meta'];
    final numOfAllProducts = metaData['total'] as int;

    final numOfPages = metaData['last_page'] as int;
    Get.find<CompletedOrdersController>().setNumOfPages = numOfPages;
    Get.find<CompletedOrdersController>().totalNumOfProducts = numOfAllProducts;

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
