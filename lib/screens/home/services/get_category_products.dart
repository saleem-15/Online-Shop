import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app_components/constants/api.dart';
import '../../../models/product_preview.dart';
import '../home_controller.dart';

Future<List<ProductPreview>> getCategoryProductsService(String categoryId) async {
  try {
    final response = await dio.get('$getCategoryProducts/$categoryId');

    final responeseData = response.data['Data']['products'];

    final productsData = responeseData as List;
    if (Get.find<HomeController>().isLoggingInfo) {
      log('products: $responeseData');
    }
    return convertDataToProductPreviewList(productsData);
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
