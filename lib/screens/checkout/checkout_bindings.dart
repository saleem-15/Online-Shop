import 'package:get/get.dart';
import 'package:my_shop/screens/checkout/checkout_controller.dart';

import '../shipping/controllers/shipping_controller.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
    Get.put(ShippingController(), permanent: true);
  }
}
