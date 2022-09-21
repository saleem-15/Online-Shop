import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_shop/models/product_preview.dart';

import 'services/search_service.dart';

class SearchController extends GetxController {
  final searchTextController = TextEditingController();
  String get searchedKeyWord => searchTextController.text;
  //
  RxBool isLoading = false.obs;
  RxBool isSearched = false.obs;
  int get numOfResults => results.length;
  final RxList<ProductPreview> results = <ProductPreview>[].obs;

  //TODO fetch suggestion from sharedPref
  RxList<String> recentSearches = [
    'Nikon camera',
    'Silver Watch',
    'Headphones',
    'Casual Shirt',
  ].obs;

  void searchSuggestion(String recentSearch) {
    searchTextController.text = recentSearch;
    search();
  }

  void deleteSuggestionAtIndex(int index) {
    recentSearches.removeAt(index);
  }

  void search() async {
    // dismiss the keyboard
    Get.focusScope!.unfocus();
    // Api call
    results.clear();
    results.addAll(await searchService(searchedKeyWord));
    isSearched(true);
    isLoading(false);
  }
}
