import 'package:get/get.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';
import 'package:my_shop/models/shipping_address.dart';
import 'package:my_shop/screens/checkout/services/checkout_service.dart';

import '../../models/cart_item.dart';
import '../shipping/controllers/shipping_controller.dart';

class CheckoutController extends GetxController {
  ShippingAddress? shippingAddress;

  double get ordersTotalPrice {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.value.totalPrice;
    }
    return sum;
  }

  double? get shippingFee => 10;

  double get totalFee {
    return ordersTotalPrice + shippingFee!;
  }

  /// if the shipping type is not chosen => the returned value will be null
  @override
  void onReady() {
    super.onReady();
    listenToSelectedAddress();
  }

  late RxList<Rx<CartItem>> cartItems;

  void setOrdersList(List<Rx<CartItem>> value) {
    cartItems = value.obs;
  }

  void chooseShippingAddress() {
    //Todo make sure that the shipping address that appears on the [CheckoutScreen] is selected in the [ShippingAddressScreen]

    Get.find<ShippingController>().isEditingMode = false;
    Get.toNamed('/shipping_addresses');
  }

  void onContinueToPaymentButtonPressed() {
    // addOrderService();
    if (shippingAddress == null) {
      CustomSnackBar.showCustomErrorSnackBar(message: 'choose shipping address!');
      return;
    }
    checkoutService(shippingAddress!.id);
  }

  void listenToSelectedAddress() {
    final shippingController = Get.find<ShippingController>();
    ever(
      shippingController.shippingAddresses,
      (_) {
        shippingAddress = shippingController.selectedAddress;
        update(['selected_address_listener']);
      },
    );
  }
}
