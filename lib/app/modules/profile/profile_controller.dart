// ignore: implementation_imports
import 'package:flutter/src/material/app.dart';
import 'package:get/get.dart';
import 'package:my_shop/config/theme/my_theme.dart';

import '../shipping/controllers/shipping_controller.dart';
import '../user_info/user_info_controller.dart';
import 'components/confirm_logout_bottom_sheet.dart';

class ProfileController extends GetxController {
  String image = 'assets/4.jpg';
  String name = 'Andrew Ainsley';
  String number = '+1 111 467 378 399';

  void goToEditProfile() {
    Get.toNamed('/user_info');
    Get.find<UserInfoController>().isEditingMode = true;
  }

  void showConfirmLogoutDialog() {
    Get.bottomSheet(const ConfirmLogoutSheet());
  }

  void goToShippingAddresses() {
    Get.find<ShippingAddressController>().isEditingMode = true;
    Get.toNamed('/shipping_addresses');
  }

  void goToLanguageScreen() {
    Get.toNamed('/language');
  }

  void setThemeMode(ThemeMode themeMode) {
    MyTheme.changeTheme(themeMode);
  }
}
