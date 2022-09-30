import 'package:get/get.dart';
import 'package:my_shop/screens/orders/controllers/completed_orders_controller.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompletedOrdersController());
  }
}
