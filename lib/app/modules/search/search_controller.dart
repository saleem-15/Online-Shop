import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../models/product_preview.dart';
import '../../storage/my_shared_pref.dart';
import 'services/search_service.dart';

class SearchController extends GetxController {
  int resultsNum = 1;
  int numOfPages = 1;
  final pagingController = PagingController<int, ProductPreview>(
    firstPageKey: 1,
  );
  //
  RxList<String> recentSearches = MySharedPref.getRecentSearchs.obs;

  final searchTextController = TextEditingController();

  String get searchedKeyWord => searchTextController.text.trim();

  final FocusNode searchFoucus = FocusNode();
  RxBool isTextFieldHasFocus = true.obs;

  final RxBool showResults = false.obs;
  RxBool isLoadingForFirstPage = false.obs;

  @override
  void onInit() {
    searchFoucus.requestFocus();
    pagingController.addPageRequestListener((pageKey) async {
      fethcProducts(pageKey);
    });

    /// listen to the search text field focus and notify [isTextFieldHasFocus]
    searchFoucus.addListener(() {
      if (searchFoucus.hasFocus) {
        showResults(false);
      }
      isTextFieldHasFocus(searchFoucus.hasFocus);
    });
    super.onInit();
  }

  void searchSuggestion(String recentSearch) {
    searchTextController.text = recentSearch;
    search();
  }

  void deleteSuggestionAtIndex(int index) {
    MySharedPref.removeSearch(recentSearches[index]);
    recentSearches.removeAt(index);
  }

  /// makes an api request and puts the products to the itemsList
  Future<void> fethcProducts(int pageKey) async {
    log('fetch products is called');
    try {
      final newProducts = await searchService(searchedKeyWord, pageKey);
      final isLastPage = numOfPages == pageKey;
      isLoadingForFirstPage(false);

      if (isLastPage) {
        pagingController.appendLastPage(newProducts);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newProducts, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
      rethrow;
    }
  }

  /// this method must be called when the user wants to search.
  /// it should be called only once (its not responsible for pagination).
  void search() async {
    log('search is called');

    if (searchedKeyWord.isBlank!) {
      return;
    }

    /// store the search to the searches History
    MySharedPref.addSearch(searchedKeyWord);

    showResults(true);

    /// dismiss the keyboard
    searchFoucus.unfocus();

    /// resets the pagination controller (so it paginates for the new search keyword)
    pagingController.refresh();

    isLoadingForFirstPage(true);
  }

  @override
  void onClose() {
    searchFoucus.dispose();
    super.onClose();
  }

  /// returnes if the search screen should be poped or not
  Future<bool> onBackButtonPressed() async {
    final bool isTherePreviousSearchResults = pagingController.itemList == null
        ? false
        : pagingController.itemList!.isNotEmpty;
    searchFoucus.unfocus();
    log('on Back Button');
    log('showResults: ${showResults.value}');
    log('is there previous search results: $isTherePreviousSearchResults');
    // log('is there previous search ');

    /// if its in the search screen
    /// (result are hidden && there is some search results)
    if (showResults.isFalse && isTherePreviousSearchResults) {
      showResults(true);

      /// dont return to home screen
      return false;
    }

    ///  return to home screen
    return true;
  }
}
