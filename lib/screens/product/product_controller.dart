import 'package:get/get.dart';
import 'package:my_shop/models/product_preview.dart';
import 'package:my_shop/screens/product/fetch_product_details_service.dart';

import '../../models/product.dart';

class ProductController extends GetxController {
  late ProductPreview productPreview;
  late Rx<Product> product;

  // -1 ==> nothing is selected
  Rx<int> selectedColorIndex = (-1).obs;
  Rx<int> selectedSizeIndex = (-1).obs;

  /// this method must be calles before opening [ProductDetailsScreen]
  Future<void> updateProduct(ProductPreview p) async {
    productPreview = p;

    product = Product(
      id: productPreview.id,
      name: productPreview.name,
      price: productPreview.price,
      isFavorite: productPreview.isFavorite,
      images: [productPreview.image],
      description: '',
      colors: [],
      sizes: [],
    ).obs;
    selectedColorIndex = (-1).obs;
    selectedSizeIndex = (-1).obs;
    product.value = await fetchProductDetails(productPreview);
  }

  void addToCart() {}

  void toggleFavorite() {
    product.update((product) {
      product!.isFavorite = !product.isFavorite;
    });
    
  }

  void setSelectedSize(String selectedSize) {}

  void setSelectedColor(int selectedColor) {}
}
