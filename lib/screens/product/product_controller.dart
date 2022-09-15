import 'package:get/get.dart';
import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/models/product_preview.dart';
import 'package:my_shop/screens/cart/cart_controller.dart';
import 'package:my_shop/screens/product/services/fetch_product_details_service.dart';

import '../../app_components/custom_snackbar.dart';
import '../../models/product.dart';

class ProductController extends GetxController {
  late ProductPreview productPreview;
  late Rx<Product> product;

  /// -1 ==> nothing is selected
  Rx<int> selectedColorIndex = (-1).obs;
  Rx<int> selectedSizeIndex = (-1).obs;
  Rx<int> quantity = 1.obs;

  double get totalCartItemsPrice => quantity.value * product.value.price;

  /// this method must be called before opening [ProductDetailsScreen]
  Future<void> updateProduct(ProductPreview p) async {
    productPreview = p;

    product = Product(
      id: productPreview.id,
      categoryId: '',
      name: productPreview.name,
      price: productPreview.price,
      isFavorite: productPreview.isFavorite,
      images: [productPreview.image],
      description: '',
      colors: [],
      sizes: [],
    ).obs;
    selectedColorIndex.value = -1;
    selectedSizeIndex.value = -1;
    quantity.value = 1;
    product.value = await fetchProductDetails(productPreview);
    // update(['images_slider']);
  }

  void addToCart() {
    //if the user did not select any size
    if (product.value.sizes.isNotEmpty && selectedSizeIndex.value == -1) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Failed',
        message: 'You have to choose the size first',
      );
      return;
    }
    //if the user did not select any color
    if (product.value.colors.isNotEmpty && selectedColorIndex.value == -1) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Failed',
        message: 'You have to choose the color first',
      );
      return;
    }

    final color = product.value.colors[selectedColorIndex.value];
    final size = product.value.sizes[selectedSizeIndex.value];
    final cartItem = CartItem(
      productId: product.value.id,
      productName: product.value.name,
      price: product.value.price,
      imageUrl: product.value.images[0],
      quantity: quantity.value,
      chosenColor: color,
      chosenSize: size,
    );

    Get.find<CartController>().addNewCartITem(cartItem);
  }

  void toggleFavorite() {
    product.update((product) {
      product!.isFavorite = !product.isFavorite;
    });
  }

  void setSelectedSize(String selectedSize) {}

  void setSelectedColor(int selectedColor) {}

  void reduceQuantityByOne() {
    if (quantity.value == 1) {
      return;
    }
    quantity.value--;
  }

  void increaseQuantityByOne() {
    quantity.value++;
  }
}
