import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/screens/cart/components/confirm_delete_item_bottom_sheet.dart';

import '../checkout/checkout_controller.dart';
import '../checkout/checkout_screen.dart';
import 'services/decrease_cart_item_quantity.dart';
import 'services/delete_cart_item.dart';
import 'services/increase_cart_item_quantity.dart';

class CartController extends GetxController {
  double get totalCartItemsPrice {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.value.totalPrice;
    }
    return sum;
  }

  RxList<Rx<CartItem>> cartItems = [
    CartItem(
      price: 385,
      productId: '1',
      productName: 'Wrella Cardigans',
      quantity: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: Colors.deepPurple[300]!.value,
      chosenSize: 'M',
    ).obs,
    CartItem(
      price: 385,
      productId: '2',
      productName: 'Wrella Cardigans',
      quantity: 3,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'S',
    ).obs,
    CartItem(
      price: 385,
      productId: '3',
      productName: 'Wrella Cardigans',
      quantity: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'L',
    ).obs,
  ].obs;

  void addNewCartITem(CartItem item) {
    cartItems.add(item.obs);
  }

  void reduceQuantityByOne(String productId) {
    final cartItem = cartItems.firstWhere((cartItem) => cartItem.value.productId == productId);
    if (cartItem.value.quantity == 1) {
      return;
    }
    cartItem.update((item) {
      item!.quantity = item.quantity - 1;
    });

    decreaseQuantityByOneService(cartItem.value);
  }

  void increaseQuantityByOne(String productId) {
    final cartItem = cartItems.firstWhere((cartItem) => cartItem.value.productId == productId);

    cartItem.update((item) {
      item!.quantity = item.quantity + 1;
    });

    increaseQuantityByOneService(cartItem.value);
  }

  showDeleteConfirmation(String productId) {
    final cartItem = cartItems.firstWhere((cartItem) => cartItem.value.productId == productId);

    Get.bottomSheet(
      ConfirmDeleteItem(cartItem: cartItem.value),
      enterBottomSheetDuration: const Duration(milliseconds: 400),
    );
  }

  void deleteCartItem(CartItem cartItem) {
    cartItems.removeWhere(
      (item) => item.value == cartItem,
    );
    deleteCartItemService(cartItem);
  }

  void checkout() {
    //pass the list of items to the checkout controller
    Get.find<CheckoutController>().setOrdersList(cartItems);

    Get.toNamed('/checkout');
  }
}
