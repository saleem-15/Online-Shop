import 'package:get/get.dart';
import 'package:my_shop/screens/shipping/controllers/shipping_controller.dart';

class ShippingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingController());
  }
}
