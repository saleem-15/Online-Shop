import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../utils/constants/api.dart';
import '../../../models/product_preview.dart';
import '../../../models/product.dart';

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
