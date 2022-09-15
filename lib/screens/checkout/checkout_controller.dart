import 'package:get/get.dart';
import 'package:my_shop/models/shipping_address.dart';

import '../../models/cart_item.dart';
import '../shipping/controllers/shipping_controller.dart';

class CheckoutController extends GetxController {
  Rx<ShippingAddress> shippingAddress =
      ShippingAddress(id: '1', name: 'Home', address: '61480 Sunbrook Park, PC 5679').obs;

  double get totalCartItemsPrice {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.value.totalPrice;
    }
    return sum;
  }

  late RxList<Rx<CartItem>> cartItems;

  void setOrdersList(List<Rx<CartItem>> value) {
    cartItems = value.obs;
  }

  void chooseShippingAddress() {
    ///Todo make sure that the shipping address that appears on the [CheckoutScreen] is selected in the [ShippingAddressScreen]

    Get.find<ShippingController>().isEditingMode = false;
    Get.toNamed('/shipping_addresses');
  }
}
