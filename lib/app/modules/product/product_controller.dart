import 'package:get/get.dart';

import '../../../utils/custom_snackbar.dart';
import '../../models/product.dart';
import '../../models/product_color.dart';
import '../../models/product_preview.dart';
import '../../models/product_size.dart';
import '../cart/cart_controller.dart';
import 'services/fetch_product_details_service.dart';

class ProductController extends GetxController {
  late ProductPreview productPreview;
  late Rx<Product> product;

  /// -1 ==> nothing is selected
  Rx<int> selectedColorIndex = (-1).obs;
  ProductColor get selectedColor => product.value.colors[selectedColorIndex.value];
  //
  Rx<int> selectedSizeIndex = (-1).obs;
  ProductSize? get selectedSize =>
      selectedSizeIndex.value == -1 ? null : product.value.sizes[selectedSizeIndex.value];
  //
  Rx<int> chosenQuantity = 1.obs;

  double get totalPrice => chosenQuantity.value * product.value.price;

  /// this method must be called before opening [ProductDetailsScreen]
  Future<void> updateProduct(ProductPreview p) async {
    productPreview = p;

    final tempProduct = Product(
      id: productPreview.id,
      categoryId: '',
      name: productPreview.name,
      price: productPreview.price,
      isFavorite: productPreview.isFavorite,
      images: [productPreview.image],
      description: '',
      colors: [],
      sizes: [],
      quantity: 1,
    ).obs;
    product = tempProduct;
    selectedColorIndex.value = -1;
    selectedSizeIndex.value = -1;
    chosenQuantity.value = 1;
    product.value = await fetchProductDetails(productPreview);
    // update(['images_slider']);
  }

  void addToCart() {
    final bool isValid = validateUserChoices();

    if (!isValid) {
      return;
    }

    Get.find<CartController>().addNewCartITem(
      product.value,
      chosenQuantity.value,
      selectedColor.id,
      selectedSize?.id,
    );
  }

  void toggleFavorite() {
    product.update((product) {
      product!.isFavorite = !product.isFavorite;
    });
  }

  void setSelectedSize(int selectedSizeIndex) {
    this.selectedSizeIndex(selectedSizeIndex);
  }

  void setSelectedColor(int selectedColorIndex) {
    this.selectedColorIndex(selectedColorIndex);
  }

  void reduceQuantityByOne() {
    if (chosenQuantity.value == 1) {
      return;
    }
    chosenQuantity.value--;
  }

  void increaseQuantityByOne() {
    if (chosenQuantity.value == product.value.quantity) {
      CustomSnackBar.showCustomErrorToast(
          message: 'the available product quantity is ${product.value.quantity}');

      return;
    }
    chosenQuantity.value++;
  }

  bool validateUserChoices() {
    //if the user did not select any size
    if (product.value.sizes.isNotEmpty && selectedSizeIndex.value == -1) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Failed',
        message: 'You have to choose the size first',
      );
      return false;
    }
    //if the user did not select any color
    if (product.value.colors.isNotEmpty && selectedColorIndex.value == -1) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Failed',
        message: 'You have to choose the color first',
      );
      return false;
    }
    return true;
  }
}
