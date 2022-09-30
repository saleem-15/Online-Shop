// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:my_shop/models/product_preview.dart';
// import 'package:my_shop/storage/my_shared_pref.dart';

// import 'services/search_service.dart';

// class SearchController extends GetxController {
//   final RxList<ProductPreview> results = <ProductPreview>[].obs;
//   int get numOfResults => results.length;

//   int totalNumOfProducts = 1;
//   int numOfPages = 1;
//   final pagingController = PagingController<int, ProductPreview>(
//     firstPageKey: 1,
//   );

//   final FocusNode searchFoucus = FocusNode();
//   final searchTextController = TextEditingController();
//   String get searchedKeyWord => searchTextController.text.trim();

//   RxBool isLoading = false.obs;
//   RxBool isTextFieldHasFocus = true.obs;

//   RxList<String> recentSearches = MySharedPref.getRecentSearchs.obs;

//   @override
//   void onInit() {
//     searchFoucus.requestFocus();
//     pagingController.addPageRequestListener((pageKey) async {
//       // search(pageKey);
//     });

//     /// listen to the search text field focus and notify [isTextFieldHasFocus]
//     searchFoucus.addListener(() {
//       if (searchFoucus.hasFocus) {
//         isTextFieldHasFocus(true);
//       } else {
//         isTextFieldHasFocus(false);
//       }
//     });
//     super.onInit();
//   }

//   void searchSuggestion(String recentSearch) {
//     searchTextController.text = recentSearch;
//     numOfPages = 1;
//     // search(1);
//   }

//   void deleteSuggestionAtIndex(int index) {
//     MySharedPref.removeSearch(recentSearches[index]);
//     recentSearches.removeAt(index);
//   }

// // /*
//   Future<void> fethcProducts(int pageKey) async {
//     try {
//       final newProducts = await searchService(searchedKeyWord, pageKey);
//       final isLastPage = numOfPages == pageKey;

//       if (isLastPage) {
//         pagingController.appendLastPage(newProducts);
//       } else {
//         final nextPageKey = pageKey + 1;
//         pagingController.appendPage(newProducts, nextPageKey);
//       }
//     } catch (error) {
//       pagingController.error = error;
//       rethrow;
//     }
//   }

// // */
//   void search(int pageKey) async {
//     /// store the search to the searches History
//     MySharedPref.addSearch(searchedKeyWord);

//     /// dismiss the keyboard
//     Get.focusScope!.unfocus();

//     /// reomve any old results
//     results.clear();

//     isLoading(true);
//     final fetchedResults = await searchService(searchedKeyWord);
//     results.addAll(fetchedResults);
//     isLoading(false);
//   }

//   @override
//   void onClose() {
//     searchFoucus.dispose();
//     super.onClose();
//   }
// }
