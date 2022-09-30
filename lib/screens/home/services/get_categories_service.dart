import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/home/home_controller.dart';

import '../../../app_components/constants/api.dart';
import '../../../models/category.dart';

Future<List<Category>> getCategoriesService() async {
  try {
    final response = await dio.get(CATEGORY_PATH);

    final jsonData = response.data;

    if (Get.find<HomeController>().isLoggingInfo) {
      log(jsonData.toString());
    }
    final categoriesData = jsonData['Data'] as List;

    return _convertDataToCategoriesList(categoriesData);
  } on DioError catch (e) {
    log(e.message);
    rethrow;
  }
}

List<Category> _convertDataToCategoriesList(List<dynamic> categoriesData) {
  final categoriesList = <Category>[];

  for (var c in categoriesData) {
    final categoryId = c['id'];
    final categoryName = c['name'];

    final category = Category(id: categoryId, name: categoryName);
    categoriesList.add(category);
  }

  return categoriesList;
}
