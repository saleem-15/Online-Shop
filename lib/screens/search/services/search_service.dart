//TODO api call (it must return list of products)
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';
import 'package:my_shop/app_components/utils/helpers.dart';

import '../../../app_components/constants/api.dart';
import '../../../models/product_preview.dart';

Future<List<ProductPreview>> searchService(String keyword) async {
  try {
    final response = await dio.post(search, queryParameters: {
      'toSearch': keyword,
    });
    final responeseData = response.data['Data'];

    log(responeseData.toString());

    return convertDataToProductPreviewList(responeseData as List);
  } on DioError catch (e) {
    log(e.response!.toString());

    CustomSnackBar.showCustomErrorSnackBar(message: formatErrorMsg(e.message));

    return [];
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
