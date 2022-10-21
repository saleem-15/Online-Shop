import 'package:get/get.dart';

import '../../modules/user_info/user_info_controller.dart';

class UserInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserInfoController());
  }
}
