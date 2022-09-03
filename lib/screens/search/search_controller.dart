import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'services/search_service.dart';

class SearchController extends GetxController {
  final searchTextController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isSearched = false.obs;
  int get numOfResults => 0;

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

    // Api call
    searchService(recentSearch);
  }

  void deleteSuggestionAtIndex(int index) {
    recentSearches.removeAt(index);
  }

  void search() {
    // dismiss the keyboard
    Get.focusScope!.unfocus();
    // Api call
    searchService(searchTextController.text);
    isSearched.value = true;
    isLoading.value = true;

    //api waiting demo
    Future.delayed(const Duration(seconds: 5)).then((value) {
      isLoading.value = false;
    });
  }
}
