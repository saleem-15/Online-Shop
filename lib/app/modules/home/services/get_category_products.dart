import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api.dart';
import '../../../models/product_preview.dart';
import '../home_controller.dart';

Future<List<ProductPreview>> fetchCategoryProductsService(
    String categoryId, int pageKey) async {
  try {
    final response = await dio.get(
      '$CATEGORY_PATH/$categoryId',
      queryParameters: {'page': pageKey},
    );

    final data = response.data['Data']['products'];
    final productsData = data['data'];
    log('products: ${data.toString()}');
    final numOfAllProducts = data['total'] as int;
    final numOfPages = data['last_page'] as int;

    Get.find<HomeController>().setNumOfPages = numOfPages;
    Get.find<HomeController>().totalNumOfProducts = numOfAllProducts;

    return convertDataToProductPreviewList(productsData as List);
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
