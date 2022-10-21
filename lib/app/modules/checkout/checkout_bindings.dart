import 'package:get/get.dart';

import '../shipping/controllers/shipping_controller.dart';
import 'checkout_controller.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
    Get.put(ShippingAddressController(), permanent: true);
    // Get.put(ShippingTypeController(), permanent: true);
  }
}
