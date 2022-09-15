import 'package:get/get.dart';
import 'package:my_shop/screens/profile/components/confirm_logout_bottom_sheet.dart';
import 'package:my_shop/screens/shipping/shipping_address_screen.dart';
import 'package:my_shop/screens/user_info/user_info_screen.dart';

import '../shipping/controllers/shipping_controller.dart';
import '../user_info/user_info_controller.dart';

class ProfileController extends GetxController {
  String image = 'assets/4.jpg';
  String name = 'Andrew Ainsley';
  String number = '+1 111 467 378 399';

  void goToEditProfile() {
    Get.find<UserInfoController>().isEditingMode = true;
    Get.to(() => const UserInfoScreen());
  }

  void showConfirmLogoutDialog() {
    Get.bottomSheet(const ConfirmLogoutSheet());
  }

  void goToShippingAddresses() {
    Get.find<ShippingController>().isEditingMode = true;
    Get.to(const ShippingAddressScreen());
  }
}
