import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../../../models/product_preview.dart';
import '../search_controller.dart';

Future<List<ProductPreview>> searchService(String keyword, int pageKey) async {
  try {
    final response = await dio.post(
      SEARCH_PATH,
      queryParameters: {
        'toSearch': keyword,
        'paginate_num': pageKey,
      },
    );
    final data = response.data['data'];

    final metaData = response.data['meta'];
    final resultsNum = metaData['total'] as int;
    final numOfPages = metaData['last_page'] as int;

    Get.find<SearchController>().numOfPages = numOfPages;
    Get.find<SearchController>().resultsNum = resultsNum;

    log(data.toString());

    return convertDataToProductPreviewList(data as List);
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
