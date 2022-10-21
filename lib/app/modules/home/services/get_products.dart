import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api.dart';
import '../../../models/product_preview.dart';
import '../home_controller.dart';

Future<List<ProductPreview>> fetchProductsService(int pageNum) async {
  try {
    final response = await dio.get(
      PRODUCTS_PATH,
      queryParameters: {'page': pageNum},
    );

    final data = response.data['data'];
    final metaData = response.data['meta'];
    final numOfAllProducts = metaData['total'] as int;

    final numOfPages = metaData['last_page'] as int;
    Get.find<HomeController>().setNumOfPages = numOfPages;
    Get.find<HomeController>().totalNumOfProducts = numOfAllProducts;

    if (Get.find<HomeController>().isLoggingInfo) {
      log('products: $data');
    }

    return convertDataToProductPreviewList(data as List);
  } on DioError {
    rethrow;
  }
}

List<ProductPreview> convertDataToProductPreviewList(List productsData) {
  final List<ProductPreview> productsList = [];

  for (var p in productsData) {
    final id = p['id'].toString();
    final name = p['name'];
    final price = p['price'] as num;
    final image = p['image'];

    final productPreview = ProductPreview(
      id: id,
      name: name,
      price: price.toDouble(),
      isFavorite: false,
      image: '$image',
    );

    productsList.add(productPreview);
  }
  return productsList;
}
