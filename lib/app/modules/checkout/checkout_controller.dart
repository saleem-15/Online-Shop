import 'dart:developer';

import 'package:get/get.dart';

import '../../../utils/custom_snackbar.dart';
import '../../models/cart_item.dart';
import '../../models/shipping_address.dart';
import '../../models/shipping_type.dart';
import '../../modules/cart/cart_controller.dart';
import '../../modules/checkout/services/checkout_service.dart';
import '../shipping/controllers/shipping_controller.dart';

class CheckoutController extends GetxController {
  ShippingAddress? _shippingAddress;
  ShippingAddress? get shippingAddress => _shippingAddress;

  ShippingType? _shippingType;
  ShippingType? get shippingType => _shippingType;

  double get ordersTotalPrice {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.value.totalPrice;
    }
    return sum;
  }

  double? get shippingFee => _shippingType?.price;
  double get totalFee => ordersTotalPrice + shippingFee!;

  late RxList<Rx<CartItem>> cartItems;

  Future<void> onContinueToPaymentButtonPressed() async {
    final isValid = validateData();
    if (!isValid) {
      return;
    }

    log(shippingType!.toString());
    final isSuccessfull = await checkoutService(_shippingAddress!.id, shippingType!.id);
    if (isSuccessfull) {
      Get.find<CartController>().clearCart();
    }
  }

  void setOrdersList(List<Rx<CartItem>> value) {
    cartItems = value.obs;
  }

  void setShippingType(ShippingType? selectedshippingType) {
    _shippingType = selectedshippingType;
    update(['selected_shipping_type_listener', 'pricing_listener']);
  }

  void setShippingAddress(ShippingAddress? shippingAddress) {
    _shippingAddress = shippingAddress;
    update(['selected_address_listener']);
  }

  void onShippingInfoCardPressed() {
    Get.find<ShippingAddressController>().isEditingMode = false;
    Get.toNamed('/shipping_addresses');
  }

  void onShippingTypeCardPressed() {
    Get.toNamed('/shipping_type');
  }

  ///validates if user can proceed to payment or not
  bool validateData() {
    if (_shippingAddress == null) {
      CustomSnackBar.showCustomErrorSnackBar(message: 'choose shipping address!');
      return false;
    }
    if (_shippingType == null) {
      CustomSnackBar.showCustomErrorSnackBar(message: 'choose shipping type!');
      return false;
    }

    return true;
  }
}
