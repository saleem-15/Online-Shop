import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../models/category.dart';
import '../../models/product_preview.dart';
import '../../modules/home/services/get_categories_service.dart';
import '../product/product_controller.dart';
import 'services/get_category_products.dart';
import 'services/get_products.dart';

class HomeController extends GetxController {
  //used to log info about home
  bool isLoggingInfo = false;
  //
  RxInt selectedCategoryIndex = 0.obs;
  String get selectedCategoryId => categories[selectedCategoryIndex.value].id.toString();

  final List<Category> categories = [
    Category(id: -1, name: 'All'),
  ];

  final pagingController = PagingController<int, ProductPreview>(
    firstPageKey: 1,
  );

  RxBool isLoadingCategories = true.obs;

  int get numOfPages {
    return categories[selectedCategoryIndex.value].numOfPages;
  }

  set setNumOfPages(int numOfPages) {
    categories[selectedCategoryIndex.value].numOfPages = numOfPages;
  }

  int get totalNumOfProducts {
    return categories[selectedCategoryIndex.value].totalNumOfProducts;
  }

  set totalNumOfProducts(int numOfAllProducts) {
    categories[selectedCategoryIndex.value].totalNumOfProducts = numOfAllProducts;
  }

  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) async {
      fethcProducts(pageKey);
    });
    categories.addAll(await getCategoriesService());
    isLoadingCategories.value = false;

    super.onInit();
  }

  void goToProductDetails(ProductPreview p) {
    Get.find<ProductController>().updateProduct(p);
    Get.toNamed('/product_details');
  }

  void onCategorySelected(int categoryIndex) async {
    /// cashe the category products
    categories[selectedCategoryIndex.value].products = pagingController.itemList;

    selectedCategoryIndex(categoryIndex);

    /// if there is a cashed products in memory get them
    pagingController.itemList = categories[selectedCategoryIndex.value].products;
  }

  Future<void> fethcProducts(int pageKey) async {
    try {
      final newProducts = selectedCategoryIndex.value == 0
          ? await fetchProductsService(pageKey)
          : await fetchCategoryProductsService(selectedCategoryId, pageKey);
      final isLastPage = numOfPages == pageKey;

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

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
