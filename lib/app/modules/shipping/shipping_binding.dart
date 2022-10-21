import 'package:get/get.dart';

import '../../modules/shipping/controllers/shipping_controller.dart';

class ShippingAddressBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingAddressController());
  }
}
