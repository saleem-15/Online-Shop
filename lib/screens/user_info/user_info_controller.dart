import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'components/choose_image_source_bottom_sheet.dart';

class UserInfoController extends GetxController {
  late bool isEditingMode;
  File? image;

  final nameController = TextEditingController();
  final nickNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  String name = 'Saleem ahdi';
  String nickName = 'saleem';
  String birthDate = '15/9/2001';
  String phoneNumber = '0567244416';

  late final FocusNode dateFocus;
  late final FocusNode emailFocus;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late ImageSource imageSource;

  @override
  void onInit() {
    emailFocus = FocusNode();

    // add listener to dateTextfield so when the field has focus the date picker dialog opens
    //and when it dialog closes => the focus goes to the next textField
    dateFocus = FocusNode()
      ..addListener(() async {
        if (dateFocus.hasFocus) {
          await pickDate();
          emailFocus.requestFocus();
        }
      });
    super.onInit();
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void updateProfileInfo() {
    final isDataValid = validateForm();
    if (!isDataValid) {
      return;
    }

    // api call
  }

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date == null) {
      return;
    }

    birthDateController.text = DateFormat.yMd().format(date);
  }

  String? phoneNumberValidator(String? value) {
    if (value == null) {
      return 'Required';
    }
    bool isPhoneNumber = GetUtils.isPhoneNumber(value);

    if (!isPhoneNumber) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  String? emailValidator(String? email) {
    if (email == null) {
      return 'Required';
    }

    if (!email.isEmail) {
      return 'Enter a valid Email';
    }

    return null;
  }

  String? nickNameValidator(String? nickName) {
    if (nickName == null || nickName.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Required';
    }
    return null;
  }

  @override
  void onClose() {
    dateFocus.dispose();
    super.onClose();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    await Get.bottomSheet(const ChooseImageSource());

    // Pick an image
    final XFile? xImage = await picker.pickImage(source: imageSource);

    ///if the user didnt pick an image
    if (xImage == null) {
      return;
    }
    update(['user_image']);

    image = File(xImage.path);
  }

  void pickImageFromGallery() {
    imageSource = ImageSource.gallery;
    Get.back();
  }

  void pickImageFromCamer() {
    imageSource = ImageSource.camera;
    Get.back();
  }
}
