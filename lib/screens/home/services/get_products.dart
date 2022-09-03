import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../app_components/constants/api_url.dart';
import '../../../models/product_preview.dart';

Future<List<ProductPreview>> getProducts() async {
  try {
    final response = await dio.post(
      '/product/index',
      queryParameters: {'category_id': 1},
    );

    final jsonData = response.data;
    log(jsonData.toString());
    final productsData = jsonData['Data'] as List;

    return convertDataToProductPreviewList(productsData);
  } on DioError {
    rethrow;
  }
}

List<ProductPreview> convertDataToProductPreviewList(List productsData) {
  final List<ProductPreview> productsList = [];
  int id = 0;

  for (var p in productsData) {
    final name = p['name'];
    final price = p['price'];
    final image = p['image'];

    final productPreview = ProductPreview(
      id: '${id++}',
      name: name,
      price: price,
      isFavorite: false,
      image: '$image',
    );

    productsList.add(productPreview);
  }
  return productsList;
}
