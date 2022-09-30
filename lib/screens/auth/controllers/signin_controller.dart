import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/main.dart';

import '../../../app.dart';
import '../screens/signup_screen.dart';
import '../services/sign_in_service.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final isSuccessfull = await signInService(email, password);

    if (isSuccessfull) {
      Get.off(() => MyApp());
    }
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
