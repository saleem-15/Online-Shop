import 'package:get/get.dart';

import '../../modules/track_order/track_order_controller.dart';

class TrackOrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}
