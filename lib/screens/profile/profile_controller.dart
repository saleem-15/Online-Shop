import 'package:get/get.dart';
import 'package:my_shop/screens/user_info/user_info_screen.dart';

import '../user_info/user_info_controller.dart';

class ProfileController extends GetxController {
  String image = 'assets/4.jpg';
  String name = 'Andrew Ainsley';
  String number = '+1 111 467 378 399';

  void goToEditProfile() {
    Get.find<UserInfoController>().isEditingMode = true;
    Get.to(() => const UserInfoScreen());
  }
}
