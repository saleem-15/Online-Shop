import 'package:get/get.dart';
import 'package:my_shop/screens/track_order/track_order_controller.dart';

class TrackOrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}
