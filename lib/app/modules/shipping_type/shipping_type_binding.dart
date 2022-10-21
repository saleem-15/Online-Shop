import 'package:get/get.dart';

import 'shipping_type_controller.dart';

class ShippingTypeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingTypeController());
  }
}
