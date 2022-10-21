import 'package:get/get.dart';

import '../../modules/orders/controllers/completed_orders_controller.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompletedOrdersController());
  }
}
