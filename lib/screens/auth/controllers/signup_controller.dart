import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/auth/screens/signin_screen.dart';
import 'package:my_shop/storage/my_shared_pref.dart';

import '../../../app.dart';
import '../../user_info/user_info_controller.dart';
import '../../user_info/user_info_screen.dart';
import '../services/chech_is_email_used_service.dart';
import '../services/sign_up_service.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> onSignupButtonPressed() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final email = emailController.text.trim();
    final isEmailUsed = await checkIsEmailUsedService(email);

    //if email is used => dont complete signup process
    if (isEmailUsed) {
      return;
    }

    Get.find<UserInfoController>()
      ..isEditingMode = false
      ..emailController.text = email;
    Get.to(() => const UserInfoScreen());
  }

  Future<void> signup(
      String name, String nickName, String email, String phone, String dateOfBirth, File? image) async {
    final password = passwordController.text.trim();

    storeUserInfo(name, nickName, email, phone, dateOfBirth, image);
    final results = await signupService(
      name,
      nickName,
      email,
      password,
      phone,
      dateOfBirth,
      image,
    );

    /// is sign up process is done correctly
    final isSuccessfull = results[1];

    if (isSuccessfull) {
      Get.off(() => const MyApp());
    }
  }

  storeUserInfo(String name, String nickName, String email, String phone, String dateOfBirth, File? image) {
    MySharedPref.setUserName(name);
    MySharedPref.setUserNickName(nickName);
    MySharedPref.setUserEmail(email);
    MySharedPref.setUserPhoneNumber(phone);
    MySharedPref.setUserDateOfBirth(dateOfBirth);
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
