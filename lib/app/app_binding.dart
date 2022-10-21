import 'package:get/get.dart';
import 'package:my_shop/app/modules/auth/controllers/auth_conroller.dart';

import 'modules/auth/controllers/signin_controller.dart';
import 'modules/auth/controllers/signup_controller.dart';
import 'modules/cart/cart_controller.dart';
import 'modules/home/home_controller.dart';
import 'modules/orders/controllers/completed_orders_controller.dart';
import 'modules/orders/controllers/ongoing_orders_controller.dart';
import 'modules/profile/profile_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    /// Auth controllers
    /// [AuthController] is runnig all the time  
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => SigninController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);

    /// bottom navigation bar screens
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => CompletedOrdersController(), fenix: true);
    Get.lazyPut(() => OngoingOrdersController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
