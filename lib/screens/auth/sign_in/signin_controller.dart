import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/auth/sign_up/signup_screen.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signIn() {
    formKey.currentState!.validate();
  }

  String? emailFieldValidator(String? value) {
    if (emailController.text.isEmail) {
      return null;
    }

    return 'Enter a valid email';
  }

  String? passwordFieldValidator(String? value) {
    if (passwordController.text.length.isLowerThan(6)) {
      return 'Wrong password';
    }
    return null;
  }

  void goToSignup() {
    Get.to(() => const SignupScreen());
  }

  void forgetPassword() {}

  void signinWithGoogle() {}

  void signinWithFacebook() {}
}
