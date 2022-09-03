import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../user_info/user_info_controller.dart';
import '../../user_info/user_info_screen.dart';
import '../sign_in/signin_screen.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signup() {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    Get.find<UserInfoController>().isEditingMode = false;
    Get.to(() => const UserInfoScreen());
  }

  String? emailFieldValidator(String? value) {
    if (emailController.text.isEmail) {
      return null;
    }

    return 'Enter a valid email';
  }

  String? passwordFieldValidator(String? value) {
    if (passwordController.text.length.isLowerThan(6)) {
      return 'min password lenght is 6 characters';
    }
    return null;
  }

  void goToSignin() {
    Get.to(() => const SigninScreen());
  }
}
