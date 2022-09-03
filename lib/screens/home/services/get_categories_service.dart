import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../app_components/constants/api_url.dart';
import '../../../models/category.dart';

Future<List<Category>> getCategoriesService() async {
  try {
    final response = await dio.post('/category/index');

    final jsonData = response.data;
    log(jsonData.toString());
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
