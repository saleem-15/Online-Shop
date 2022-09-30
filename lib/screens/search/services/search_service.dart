import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../app_components/utils/helpers.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/constants/api.dart';
import '../../../models/product_preview.dart';

Future<List<ProductPreview>> searchService(String keyword,int pageKey) async {
  try {
    final response = await dio.post(
      SEARCH_PATH,
      queryParameters: {'toSearch': keyword},
    );
    final responeseData = response.data['Data'];

    log(responeseData.toString());

    return convertDataToProductPreviewList(responeseData as List);
  } on DioError catch (e) {
    log(e.response!.toString());

    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.message),
    );

    return [];
  }
}

List<ProductPreview> convertDataToProductPreviewList(List productsData) {
  final List<ProductPreview> productsList = [];

  for (Map<String, dynamic> p in productsData) {
    productsList.add(ProductPreview.fromMap(p));
  }
  return productsList;
}
