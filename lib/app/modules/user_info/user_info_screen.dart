// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/app/shared/profile_picture.dart';

import 'user_info_controller.dart';

class UserInfoScreen extends GetView<UserInfoController> {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'User Info'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            right: 20.w,
            left: 20.w,
            top: 15.h,
          ),
          constraints: BoxConstraints(
            minHeight: screenHeight,
            maxHeight: double.infinity,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: controller.pickImage,
                      child: GetBuilder<UserInfoController>(
                        assignId: true,
                        id: 'user_image',
                        builder: (controller) => ProfilePicture(
                          image: controller.image == null ? null : FileImage(controller.image!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      controller: controller.nameController,

                      decoration: InputDecoration(
                        hintText: 'Full Name'.tr,
                      ),
                      validator: controller.nameValidator,
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: controller.nickNameController,
                      decoration: InputDecoration(
                        hintText: 'Nickname'.tr,
                      ),
                      validator: controller.nickNameValidator,
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      focusNode: controller.dateFocus,
                      // readOnly: true,
                      controller: controller.birthDateController,
                      decoration: const InputDecoration(
                        hintText: 'Date of Birth',
                        suffixIcon: ImageIcon(
                          AssetImage('assets/icons/calendar_icon_32.png'),
                          size: 20,
                        ),
                      ),
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      focusNode: controller.emailFocus,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        hintText: 'Email'.tr,
                      ),
                      validator: controller.emailValidator,
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Phone Number'.tr,
                      ),
                      validator: controller.phoneNumberValidator,
                      textInputAction: TextInputAction.done, // Moves focus to next field
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: controller.updateProfileInfo,
                child: Text(controller.isEditingMode ? 'Update'.tr : 'Continue'.tr),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
