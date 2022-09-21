import 'package:get/get.dart';
import 'package:my_shop/screens/shipping/controllers/shipping_controller.dart';

class ShippingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingController());
  }
}
