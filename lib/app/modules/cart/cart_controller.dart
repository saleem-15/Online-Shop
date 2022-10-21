import 'package:get/get.dart';

import '../../models/cart_item.dart';
import '../../models/product.dart';
import '../../modules/cart/components/confirm_delete_item_bottom_sheet.dart';
import '../../modules/cart/services/add_product_to_cart_service.dart';
import '../../modules/cart/services/edit_cart_item.dart';
import '../checkout/checkout_controller.dart';
import 'services/delete_cart_item.dart';
import 'services/get_all_cart_items.dart';

class CartController extends GetxController {
  double get totalCartItemsPrice {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.value.totalPrice;
    }
    return sum;
  }

  RxBool isLoading = true.obs;
  RxList<Rx<CartItem>> cartItems = <Rx<CartItem>>[].obs;

  @override
  void onReady() async {
    getCartItems();

    super.onReady();
  }

  void clearCart() {
    cartItems.clear();
  }

  void addNewCartITem(Product product, int chosenQuantity,
      String selectedColorId, String? selectedSizeId) {
    // cartItems.add(item.obs);CartItem item,
    addProductToCartService(
        product.id, selectedColorId, selectedSizeId, chosenQuantity);
  }

  Future<void> reduceQuantityByOne(String cartItemID) async {
    final cartItem =
        cartItems.firstWhere((cartItem) => cartItem.value.id == cartItemID);
    if (cartItem.value.quantity == 1) {
      return;
    }

    final bool isUpdated = await decreaseQuantityByOneService(cartItem.value);

    if (isUpdated) {
      cartItem.update((item) {
        item!.quantity = item.quantity - 1;
      });
    }
  }

  Future<void> increaseQuantityByOne(String cartItemId) async {
    final cartItem =
        cartItems.firstWhere((cartItem) => cartItem.value.id == cartItemId);

    final bool isUpdated = await increaseQuantityByOneService(cartItem.value);

    if (isUpdated) {
      cartItem.update((item) {
        item!.quantity = item.quantity + 1;
      });
    }
  }

  showDeleteConfirmation(String productId) {
    final cartItem =
        cartItems.firstWhere((cartItem) => cartItem.value.id == productId);

    Get.bottomSheet(
      ConfirmDeleteItem(cartItem: cartItem.value),
      enterBottomSheetDuration: const Duration(milliseconds: 400),
    );
  }

  Future<void> deleteCartItem(CartItem cartItem) async {
    await deleteCartItemService(cartItem.id);
    getCartItems();
  }

  void checkout() {
    //pass the list of items to the checkout controller
    Get.find<CheckoutController>().setOrdersList(cartItems);

    Get.toNamed('/checkout');
  }

  Future<void> getCartItems() async {
    isLoading(true);
    final items = await getAllCartItemsService();
    isLoading(false);
    final convertedToRx = items.map((e) => e.obs);
    cartItems.clear();
    cartItems.addAll(convertedToRx);
  }

  Future<void> onRefresh() async {
    await getCartItems();
  }
}
