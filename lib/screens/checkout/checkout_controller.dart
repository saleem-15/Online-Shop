import 'package:get/get.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';
import 'package:my_shop/models/shipping_address.dart';
import 'package:my_shop/models/shipping_type.dart';
import 'package:my_shop/screens/checkout/services/checkout_service.dart';

import '../../models/cart_item.dart';
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

  double? get shippingFee => _shippingType!.price;
  double get totalFee => ordersTotalPrice + shippingFee!;

  late RxList<Rx<CartItem>> cartItems;

  @override
  void onReady() {
    super.onReady();
    listenToSelectedAddress();
  }

  void setOrdersList(List<Rx<CartItem>> value) {
    cartItems = value.obs;
  }

  void setShippingType(ShippingType? selectedshippingType) {
    _shippingType = selectedshippingType;
    update(['selected_shipping_type_listener']);
  }

  void setShippingAddress(ShippingAddress? shippingAddress) {
    _shippingAddress = shippingAddress;
    update(['selected_address_listener']);
  }

  void onShippingInfoCardPressed() {
    Get.find<ShippingController>().isEditingMode = false;
    Get.toNamed('/shipping_addresses');
  }

  void onContinueToPaymentButtonPressed() {
    final isValid = validateData();
    if (!isValid) {
      return;
    }
    checkoutService(_shippingAddress!.id);
  }

  void listenToSelectedAddress() {
    final shippingController = Get.find<ShippingController>();
    ever(
      shippingController.shippingAddresses,
      (_) {
        _shippingAddress = shippingController.selectedAddress;
        update(['selected_address_listener']);
      },
    );
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