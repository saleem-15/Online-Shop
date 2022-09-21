import 'package:get/get.dart';
import 'package:my_shop/screens/user_info/user_info_controller.dart';

class UserInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInfoController());
  }
}
