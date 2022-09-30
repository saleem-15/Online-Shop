import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/models/product_preview.dart';

import '../../../app_components/constants/api.dart';

Future<Product> fetchProductDetails(ProductPreview product) async {
  try {
    final response = await dio.get(
      '$PRODUCTS_PATH/${product.id}',
    );
    final responeseData = response.data['Data'];

    return Product.fromMap(responeseData);
  } on DioError catch (e) {
    log(e.response.toString());

    rethrow;
  }
}
